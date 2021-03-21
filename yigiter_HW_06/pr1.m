clc
clear all
close all

h = 0.001;
y(1) = 10;
a = 0;  %t final

while (y(end)>0)
    a = a+h;
    t = 0:h:a;
    
    for (i=1:(length(t)-1))
        dydt = 5 - 0.4*t(i) - t(i)*exp(-0.1*t(i));
        y(i+1) = y(i) + dydt*h;
    end
end

I = find(max(y)==y);
fprintf('\nProblem 1\n\nYmax = %.4f  at  t = %.4f\n',y(I),t(I));
t0 = (t(length(t))*2-h)/2;
fprintf('\nY = 0  at  t = %.4f\n',t0);

plot(t,y,'m-','linewidth',1), xlabel('t [s]'), ylabel('Y [m]'), grid on, axis equal, axis([0 15 0 25]);