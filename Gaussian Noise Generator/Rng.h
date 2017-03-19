/*
 * Rng.h
 *
 *  Created on: 10.12.2014
 *      Author: zukunft
 *
 *      Brief Description: Random Number Generator
 *
 *      Description:  C library functions for generating pseudorandom numbers using the
 *                    Mersenne Twist algorithm.  See M. Matsumoto and T. Nishimura,
 *                    "Mersenne Twister: A 623-Dimensionally Equidistributed Uniform
 *                    Pseudo-Random Number Generator", ACM Transactions on Modeling and
 *                    Computer Simulation, Vol. 8, No. 1, January 1998, pp 3--30.
 *
 *                    The Web page on the Mersenne Twist algorithm is at:
 *
 *                    http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html
 *
 *                    Template: Timesim implementation and source code provided by Geoff Kuenning
 */


#ifndef RNG_H_
#define RNG_H_


#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "Typedefs.h"

//#include <MainModule.h>


//#ifdef ENV32BIT
#define UPPER_MASK32	0x80000000	/* Most significant w-r bits */
#define LOWER_MASK32	0x7fffffff	/* Least significant r bits */
// not yet defined for 64 bit
//#endif


using namespace std;

class Rng {
public:
	// Constructor
	Rng(int32 seed);

    // Destructor
    virtual ~Rng();

    // Seed Random Number Generator
    void RandomInit(int32 seed);

    // Generate random integer in range [min,max]
    int32 IRandom(int32 min, int32 max);

    // Generate random float in range [0,1)
    double Random();

    //  output random bits
    uint32 BRandom();

    // 64 Bit Version of Mersenne Twister
    uint64_t genrand64_int64(void);

private:

    uint32 * mt;            // state vector
    unsigned mti;                  // index into mt
    //oe: capital notation will conflict with system internal defines under Linux
    enum TArch {little_endian, big_endian, non_ieee};
    TArch Architecture;           // conversion to float depends on computer architecture

    // number of random words that are generated in one shot
    unsigned MERS_N;

    int  MERS_M, /* should be derived from MERS_N */
         MERS_U, MERS_S, MERS_T, MERS_L, /*tempering values*/
         MM; /* MERS_M for 64 bit*/
    int32 MERS_A,
         MERS_B, MERS_C; /* tempering values */

    uint64_t MATRIX_A,  /* Constant vector for recurrence relation */
                       UM,LM,KM;  /* MERS_U,L,K for 64 bits */

};




#endif /* RNG_H_ */
