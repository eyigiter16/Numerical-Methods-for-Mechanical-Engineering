clc;
clear all;
close all;
disp('Problem 8:');

x = -4:0.00001:4;
y = 0.15*cos(4*x).*((x-2).^2)-2;
Px=0;
Py=-4;
D = sqrt((x-Px).^2+(y-Py).^2);
Dmin = min(D);
Dmax = max(D);
i = find(D == Dmin);
figure(8)
plot(x,y,'b-',Px,Py,'k*',x(i),y(i),'k*',[Px x(i)],[Py y(i)],'r-','linewidth',2)
title({['The shortest distance is ',num2str(Dmin)];['At x = ', num2str(x(i)),' y = ',num2str(y(i))]})
grid on, xlabel('x'), ylabel('y')