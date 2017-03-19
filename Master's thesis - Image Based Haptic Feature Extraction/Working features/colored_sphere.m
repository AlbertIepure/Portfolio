clear all
close all
clc

[x,y,z] = sphere(36);
surf(x,y,z,'FaceColor','interp','FaceAlpha',0.4,'EdgeColor','none');
colormap('hsv');
axis off
axis equal

x=[0 0];
y=[-1.5 1.5];
z=[0 0];
line(x,y,z,'Color','k');
text(-1.05,0.7,0,'Hue \rightarrow ','Color','k');

x=[-1.5 1.5];
y=[0 0];
z=[0 0];
line(x,y,z,'Color','k');
text(-1.6,0,0,'Chroma');

x=[0 0];
y=[0 0];
z=[-1.5 1.5];
line(x,y,z,'Color','k');
text(0,0,1.6,'Lightness');

x=[0 0.67];
y=[0 0];
z=[0 0.74];
line(x,y,z,'Color','r','LineWidth',2);
text(0.67,0,0.80,'\downarrow Dominant color');

hold on
ang=0:0.001:2*pi; 
xp=1*cos(ang);
yp=1*sin(ang);
plot(0+xp,0+yp);
hold off

text(0.25,-0.45,0.85,'\leftarrow Color Distance','Color','k');
% rotate3d on