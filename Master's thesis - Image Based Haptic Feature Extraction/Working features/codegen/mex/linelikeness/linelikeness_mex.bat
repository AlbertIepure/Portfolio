@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2015b
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2015b\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=linelikeness_mex
set MEX_NAME=linelikeness_mex
set MEX_EXT=.mexw64
call "C:\PROGRA~1\MATLAB\R2015b\sys\lcc64\lcc64\mex\lcc64opts.bat"
echo # Make settings for linelikeness > linelikeness_mex.mki
echo COMPILER=%COMPILER%>> linelikeness_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> linelikeness_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> linelikeness_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> linelikeness_mex.mki
echo LINKER=%LINKER%>> linelikeness_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> linelikeness_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> linelikeness_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> linelikeness_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> linelikeness_mex.mki
echo BORLAND=%BORLAND%>> linelikeness_mex.mki
echo OMPFLAGS= >> linelikeness_mex.mki
echo OMPLINKFLAGS= >> linelikeness_mex.mki
echo EMC_COMPILER=lcc64>> linelikeness_mex.mki
echo EMC_CONFIG=optim>> linelikeness_mex.mki
"C:\Program Files\MATLAB\R2015b\bin\win64\gmake" -B -f linelikeness_mex.mk
