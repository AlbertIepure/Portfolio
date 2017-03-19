/*
 * typedefs.h
 *
 *  Created on: 12.01.2015
 *      Author: zukunft
 *
 *  Description:
 *      Defines basic data types.
 *      Template: IFX_OS
 */

#ifndef TYPEDEFS_H_
#define TYPEDEFS_H_

/* Determine the target type */
#if defined(WIN64) || defined (_WIN64) \
   || defined(__x86_64__) \
   || defined(__LP64__) || defined(_LP64) \
   || defined (__amd64) \
   || defined (powerpc64) || defined (__powerpc64__) || defined (__ppc64__) \
   || defined (__64BIT__)
/* X86_64 */
#  define ENV64BIT 1
#elif defined (__ia64__) || defined (__ia64)
/* IA64 */
#  define ENV64BIT 1
#else
/* not 64 bit system */
#  define ENV32BIT 1
#endif /* 64 bit determination */

// Basic data types
/* This is the unsigned 8-bit data type. */
typedef unsigned char            uint8;
/* This is the signed 8-bit data type. */
typedef signed char              int8;
/* This is the unsigned 16-bit data type. */
typedef unsigned short           uint16;
/* This is the signed 16-bit data type. */
typedef signed short             int16;
/* This is the unsigned 32-bit data type. */
typedef unsigned int             uint32;
/* This is the signed 32-bit data type. */
typedef signed int               int32;

#ifdef ENV64BIT
   /* NOTE: Most Unix systems use the I32LP64 standard
         which defines a long as 64 bits and Win64 uses
         the IL32LLP64 standard which defines a long as 32 bits.
   */
   #ifdef WIN64
      /* This is the unsigned 64-bit data type. */
      typedef unsigned long long int   uint64_t;
      /* This is the signed 64-bit data type. */
      typedef signed long long int     int64_t;
   #else /* WIN64 */
      /* This is the unsigned 64-bit data type. */
      typedef unsigned long int        uint64_t;
      /* This is the signed 64-bit data type. */
      typedef signed long int          int64_t;
   #endif /* WIN64 */

#else
   /* This is the unsigned 64-bit data type. */
   typedef unsigned long long int      uint64_t;
   /* This is the signed 64-bit data type. */
   typedef signed long long int        int64_t;
#endif /* 32/64 bit specific types */

#endif /* TYPEDEFS_H_ */
