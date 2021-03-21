clc
clear all
close all

a = 0;
N = 100000;
b = 2.02;
I = 197.2366;
while(I<199.9999)
x = linspace(a,b,N+1);
h = x(2) - x(1);
y = 100*(1-exp(-0.1*x).*cos(4*x+pi).*sin(x+4));
I = (h/3) * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
b = b+0.00001;
end

fprintf("With %d many small intervals, the a value must be a = %4.4f for the Integral to be 200.",N,b);
