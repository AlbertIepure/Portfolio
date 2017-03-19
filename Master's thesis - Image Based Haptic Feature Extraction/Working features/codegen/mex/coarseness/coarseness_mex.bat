@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2015a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2015a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=coarseness_mex
set MEX_NAME=coarseness_mex
set MEX_EXT=.mexw64
call setEnv.bat
echo # Make settings for coarseness > coarseness_mex.mki
echo COMPILER=%COMPILER%>> coarseness_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> coarseness_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> coarseness_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> coarseness_mex.mki
echo LINKER=%LINKER%>> coarseness_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> coarseness_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> coarseness_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> coarseness_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> coarseness_mex.mki
echo BORLAND=%BORLAND%>> coarseness_mex.mki
echo OMPFLAGS= >> coarseness_mex.mki
echo OMPLINKFLAGS= >> coarseness_mex.mki
echo EMC_COMPILER=msvc120>> coarseness_mex.mki
echo EMC_CONFIG=optim>> coarseness_mex.mki
"C:\Program Files\MATLAB\R2015a\bin\win64\gmake" -B -f coarseness_mex.mk
