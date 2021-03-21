clc
clear all
close all

xTemp = 0:0.00001:2;
y1 = sqrt(25-(xTemp-3).^2);
y2 = 3*(xTemp-1).^2+2;
I = find((y1-y2)<=0.00003 & (y1-y2)>-0.00001);

a = xTemp(I(1));
b = xTemp(I(2));
N = 100000;
x = linspace(a,b,N+1);
h = x(2) - x(1);
I1 = (h/3) * (y1(1) + 4*sum(y1(2:2:end-1)) + 2*sum(y1(3:2:end-2)) + y1(end));
I2 = (h/3) * (y2(1) + 4*sum(y2(2:2:end-1)) + 2*sum(y2(3:2:end-2)) + y2(end));
Area = I1 - I2;
fprintf("Area of the intersection region = %.4f\n",Area);