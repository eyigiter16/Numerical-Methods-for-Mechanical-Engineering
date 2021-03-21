clc
clear all
close all
 
h = 0.001;
m = 10;   c = 5;    k = 40;

t = 0:h:20;
x(1) = 0.5;
xp(1) = 0;
 
for (i = 1:length(t)-1)
    x(i+1) = x(i) + xp(i)*h;
    xp(i+1) = xp(i) + h*(-c*xp(i) - k*x(i))/m;
end
 
xP(1) = x(1);   tP(1) = t(1);   %at t = 0.000

a = 2;
for (i = 2:length(x)-1)
    if (x(i)>x(i-1) && x(i)>x(i+1))
        xP(a) = x(i);
        tP(a) = t(i);
        a = a+1;
    end
    if(a==5), break, end
end

fprintf('\nProblem 3\n\n');

for (i = 1:4), fprintf('Xpeak,%.0f = %.4f m  at  t = %.4f s.\n',i,xP(i),tP(i)); end
disp(' ');

for (i = 1:3), fprintf('Tpeak,%.0f - Tpeak,%.0f = %.4f\n',i+1,i,tP(i+1)-tP(i)); end
disp(' ');

for (i = 1:3), fprintf('Xpeak,%.0f / Xpeak,%.0f = %.4f\n',i,(i+1),xP(i)/xP(i+1)); end

plot(t,x,'k-','linewidth',1), xlabel('t [s]'), ylabel('X(t) [m]'), grid on
