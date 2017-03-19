function [g_CD]=equalizer_generation(I_eq)

load G_CD;
fac=1024/I_eq;
G_CD=downsample(G_CD,fac);
G_CD=[G_CD(I_eq/2+1:I_eq),G_CD(1:I_eq/2)];
g_CD=ifft(G_CD);
g_CD=[g_CD(I_eq/2+1:I_eq),g_CD(1:I_eq/2)].';

end