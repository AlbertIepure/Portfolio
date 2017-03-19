/*
 * Rng.cpp
 *
 *  Created on: 10.12.2014
 *      Author: zukunft
 */


#include "Rng.h"
#include "Typedefs.h"

// Constructor
Rng::Rng(int32 seed)
{
	RandomInit(seed);
}

// Destructor
Rng::~Rng(){
    delete [] mt;
}

// RandomInit
void Rng::RandomInit(int32 seed)
{
    // Sanity check for 32 bit and 64 architecture
#if defined(ENV64BIT)
    if (sizeof(void*) != 8)
    {
        cout<<"ENV64BIT: Error: pointer should be 8 bytes. Exiting."<<endl;
        exit(0);
    }
   wprintf(L"Diagnostics: we are running in 64-bit mode.\n");
#elif defined (ENV32BIT)
    if (sizeof(void*) != 4)
    {
    	cout<<"ENV32BIT: Error: pointer should be 4 bytes. Exiting."<<endl;
        exit(0);
    }
    cout<<"Diagnostics: we are running in 32-bit mode.\n"<<endl;;
#else
    #error "Must define either ENV32BIT or ENV64BIT".
#endif

//#ifdef ENV32BIT
#if 1
    // use 32 bit version in any case

        if(1){    // MT11213A
            MERS_N =  351;
            MERS_M =  175;
            MERS_L =  17;
            MERS_A =  0xE4BD75F5;
            MERS_B =  0x655E5280;
            MERS_C =  0xFFD58000;
        }else{    // MT19937:
            MERS_N =  624;
            MERS_M =  397; // To be checked
            MERS_L =  18;
            MERS_A =  0xE4BD75F5;
            MERS_B =  0x655E5280;
            MERS_C =  0xFFD58000;
        }
        MERS_U =  11;
        MERS_S =  7;
        MERS_T =  15;

        // State Vector
        mt = new uint32[MERS_N];

        // re-seed generator
        uint32 s = (uint32)seed;
        for (mti = 0; mti < MERS_N; mti++) {
            s = s * 29943829 - 1;
            mt[mti] = s;
        }
        // detect computer architecture
        union {double f; uint32 i[2];} convert;
        convert.f = 1.0;
        if (convert.i[1] == 0x3FF00000) Architecture = little_endian;
        else if (convert.i[0] == 0x3FF00000) Architecture = big_endian;
        else Architecture = non_ieee;
#else
        // 64 Bit Version
        MERS_N   = 312;
        MM       = 156;
        MATRIX_A = (uint64_t)(0xB5026F5AA96619E9);
        UM       = (uint64_t)(0xFFFFFFFF80000000); // Most significant 33 bits
        LM       = (uint64_t)(0x7FFFFFFF);         // Least significant 31 bits
        KM       = (uint64_t)(6364136223846793005);

        // State Vector
        mt = new uint32[MERS_N]; // format to be checked
        mt[0] = seed;
        for (mti=1; mti<MERS_N; mti++)
			mt[mti] =		(KM * (mt[mti-1] ^ (mt[mti-1] >> 62)) + mti);

#endif
}

// BRandom
uint32 Rng::BRandom()
{
    uint32 y;
//#ifdef ENV32BIT
#if 1
        if (mti >= MERS_N) {
            // generate MERS_N words at one time
            unsigned kk, km;
            for (kk=0, km=MERS_M; kk < MERS_N-1; kk++)
            {
            	// combine bits
                y = (mt[kk] & UPPER_MASK32) | (mt[kk+1] & LOWER_MASK32);
                // scrambling function
                mt[kk] = mt[km] ^ (y >> 1) ^ (-(int32)(y & 1) & MERS_A);
                if (++km >= MERS_N)
                	km = 0;
            }

        	// combine bits
            y = (mt[MERS_N-1] & UPPER_MASK32) | (mt[0] & LOWER_MASK32);
            // scrambling function
            mt[MERS_N-1] = mt[MERS_M-1] ^ (y >> 1) ^ (-(int32)(y & 1) & MERS_A);
            mti = 0;
        }

        y = mt[mti++];

        // Tempering (May be omitted):
        y ^=  y >> MERS_U;
        y ^= (y << MERS_S) & MERS_B;
        y ^= (y << MERS_T) & MERS_C;
        y ^=  y >> MERS_L;
#else
        cout<<"64 bit Version for BRandom is not implemented! "<<endl;
        exit(EXIT_FAILURE);

#endif
    return y;
}

// Random
double Rng::Random()
{
    double randomnum;

//#ifdef ENV32BIT
# if 1
        uint32 r;
        // output random float number in the interval 0 <= x < 1
        union {double f; uint32 i[2];} convert;
        r = BRandom(); // get 32 random bits
        // The fastest way to convert random bits to floating point is as follows:
        // Set the binary exponent of a floating point number to 1+bias and set
        // the mantissa to random bits. This will give a random number in the
        // interval [1,2). Then subtract 1.0 to get a random number in the interval
        // [0,1). This procedure requires that we know how floating point numbers
        // are stored. The storing method is tested in function RandomInit and saved
        // in the variable Architecture. (A PC running Windows or Linux uses
        // LITTLE_ENDIAN architecture).
        switch (Architecture) {
        case little_endian:
            convert.i[0] =  r << 20;
            convert.i[1] = (r >> 12) | 0x3FF00000;
            return convert.f - 1.0;
        case big_endian:
            convert.i[1] =  r << 20;
            convert.i[0] = (r >> 12) | 0x3FF00000;
            return convert.f - 1.0;
        case non_ieee:
        default:;
        }

        // This somewhat slower method works for all
        // non-IEEE floating point representation:
        randomnum = (double) r * (1./((double)(uint32)(-1L)+1.));
#else
        // 64 Bit Version
        // generates a random number on [0,1)-real-interval
		int64 r1 = genrand64_int64() >> 11;

        randomnum =  ((double) r1) * (1.0/9007199254740992.0);
#endif
    return randomnum;
}

// IRandom: output random integer in the interval min <= x <= max
int32 Rng::IRandom(int32 min, int32 max)
{
    int32 r;

    r = int32((max - min + 1) * Random()) + min; // multiply interval with random and truncate
    if (r > max)
        r = max;
    if (max < min)
        return 0x80000000;
    return r;
}

// Generate Random Number for 64 bit architecture
uint64_t Rng::genrand64_int64(void)
{
    unsigned    i;
    uint64_t    x;
    static uint64_t   mag01[2]={0, MATRIX_A};

    if (mti >= MERS_N) { // generate MERS_N words at one time

        // if init_genrand64() has not been called,
        // a default initial seed is used
        if (mti == MERS_N +1)
            //    init_genrand64(5489ULL);
            RandomInit(5489);

        for (i=0;i< MERS_N-MM;i++) {
            x = (mt[i]&UM)|(mt[i+1]&LM);
            // mt[i] = mt[i+MM] ^ (x>>1) ^ mag01[(int)(x&1ULL)];
			mt[i] = mt[i+MM] ^ (x>>1) ^ mag01[(int)(x&1)];
        }
        for (;i< MERS_N -1;i++) {
            x = (mt[i]&UM)|(mt[i+1]&LM);
            //  mt[i] = mt[i+(MM- MERS_N)] ^ (x>>1) ^ mag01[(int)(x&1ULL)];
			mt[i] = mt[i+(MM- MERS_N)] ^ (x>>1) ^ mag01[(int)(x&1)];
        }
        x = (mt[ MERS_N-1]&UM)|(mt[0]&LM);
        //mt[ MERS_N -1] = mt[MM-1] ^ (x>>1) ^ mag01[(int)(x&1ULL)];
	    mt[ MERS_N -1] = mt[MM-1] ^ (x>>1) ^ mag01[(int)(x&1)];

        mti = 0;
    }

    x = mt[mti++];
    x ^= (x >> 29) & (uint64_t) (0x5555555555555555);
    x ^= (x << 17) & (uint64_t) (0x71D67FFFEDA60000);
    x ^= (x << 37) & (uint64_t) (0xFFF7EEE000000000);
    x ^= (x >> 43);

    return x;
}







