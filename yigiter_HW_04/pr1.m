clc;
clear all;
close all;

X = [0 1 2 3 4 5 6 7];
Y = [810 639 498 389 306 241 190 139];
Z = log(Y);
P = polyfit(X,Z,1);
m = P(1);
b = P(2);
c = exp(b);
xx = linspace(X(1)-1, X(end)+1, 9001);
yy = c*exp(m*xx);
i = find(xx >= 0.2999999 & xx <= 0.300000001);
fprintf('A = %.4f  B = %.4f  y(0.3) = %.4f\n',c,abs(m),yy(i));
plot(X,Y,'ro',xx,yy,'b-');