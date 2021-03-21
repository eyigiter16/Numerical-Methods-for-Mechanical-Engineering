clc
clear all
close all
 
h = 0.0001;
t = 0:h:5;
y(1) = 10;
yp(1) = 100;
ypp(1) = 0;

for (i=1:length(t)-1)
    ypp(i+1) = ypp(i) + (-0.5*y(i) - 0.3*t(i))*h;
    yp(i+1) = yp(i) + ypp(i)*h;
    y(i+1) = y(i) + yp(i)*h;
end
 
I=(find(max(y)==y));
fprintf('\nProblem 6\n\nYmax = %.4f m  at  t = %.4f s.\n',y(I),t(I));

plot(t,y,'r-','linewidth',1), xlabel('t [s]'), ylabel('Y [m]'), grid on