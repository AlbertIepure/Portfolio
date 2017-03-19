@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2015a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2015a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=complexity_mex
set MEX_NAME=complexity_mex
set MEX_EXT=.mexw64
call setEnv.bat
echo # Make settings for complexity > complexity_mex.mki
echo COMPILER=%COMPILER%>> complexity_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> complexity_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> complexity_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> complexity_mex.mki
echo LINKER=%LINKER%>> complexity_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> complexity_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> complexity_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> complexity_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> complexity_mex.mki
echo BORLAND=%BORLAND%>> complexity_mex.mki
echo OMPFLAGS= >> complexity_mex.mki
echo OMPLINKFLAGS= >> complexity_mex.mki
echo EMC_COMPILER=msvc120>> complexity_mex.mki
echo EMC_CONFIG=optim>> complexity_mex.mki
"C:\Program Files\MATLAB\R2015a\bin\win64\gmake" -B -f complexity_mex.mk
