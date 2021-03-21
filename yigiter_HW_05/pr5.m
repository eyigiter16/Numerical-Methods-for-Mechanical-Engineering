clc
clear all
close all

a = 10;
b = 5;
N = 100000;
x = linspace(-a,a,N+1);
h = x(2) - x(1);
y = sqrt(b.^2*(1-x.^2/a^2));
I = (h/3) * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
Area = 2*abs(I);

fprintf("The area is %.4f cm.",Area);
