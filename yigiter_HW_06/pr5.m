clc
clear all
close all
 
h = 0.01;
t = 0:h:10;
N = length(t); y = zeros(1,N);
c = 0;

while (y(N)<120)
    c = c+0.1;
    y(1) = 100;
    for (i = 1:N-1)
        dydt = (c*exp(-0.1*t(i)))/(1+sqrt(y(i))) - t(i)*exp(-0.25*t(i));
        y(i+1) = y(i) + h*dydt;
    end
end

fprintf('\nProblem 5\n\nFor y(10) = 120 , c = %.1f\n',c);
plot(t,y,'c-','linewidth',1), xlabel('t'), ylabel('Y'), grid on