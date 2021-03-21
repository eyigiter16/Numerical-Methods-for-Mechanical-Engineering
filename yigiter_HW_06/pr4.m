clc
clear all
close all
 
h = 0.0001;
t = 0:h:500;
y(1) = 100;
 
for (i = 1:length(t)-1)
    dydt = (30*exp(-0.1*t(i)))/(1+sqrt(y(i)))-t(i)*exp(-0.25*t(i));
    y(i+1) = y(i)+h*dydt;
end

fprintf('\nProblem 4\n\nY approaches to %.4f  as time goes to infinity.\n',y(length(t)));
plot(t,y,'g-','linewidth',1), xlabel('t'), ylabel('Y'), grid on