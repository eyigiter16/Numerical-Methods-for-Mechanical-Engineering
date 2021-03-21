clc;
clear all;
close all;
disp('Problem 1:');

x = 0:0.0001:10;
y = ((2*x.^3)+(4*x.^2)-7*x-40).*(cos(20*x+2)).*(1+exp(-x))./(sqrt(x+1).*(1+x+x.^2));

ymin = min(y);
ymax = max(y);
i = find(y == ymin);
j = find(y == ymax);
xmin = x(i);
xmax = x(j);

figure(1)
plot(x,y,'k-',xmin,ymin,'ro',xmax,ymax,'bo','linewidth',2)
grid on;
xlabel('X');
ylabel('Y');
title({['Y maximum = ',num2str(ymax),' at X = ',num2str(xmax)];['Y minimum = ',num2str(ymin),' at X = ',num2str(xmin)]});

fprintf('Ymax = %2.4f at X = %2.4f, with an accuracy of +/- 0.0001 in X.\n',ymax,xmax);
fprintf('Ymin = %2.4f at X = %2.4f, with an accuracy of +/- 0.0001 in X.\n',ymin,xmin);