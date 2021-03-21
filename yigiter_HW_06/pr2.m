clc
clear all
close all

h = 0.0001;
c = 0.4:0.1:5;
y(1) = 10;

for (j = 1:length(c))
    x = 0:h:14;
    
    for (i = 1:length(x)-1)
        dydt = 5 - c(j)*x(i) - x(i)*exp(-0.1*x(i));
        y(i+1) = y(i) + dydt*h;
    end
    yMax(j) = max(y);
end

I = find(yMax<=15.1 & yMax>=14.9);
fprintf('\nProblem 2\n\nYmax = 15 when c = %.2f\n',c(I));

plot(c,yMax,'b-','linewidth',1), xlabel('c'), ylabel('yMax'), grid on