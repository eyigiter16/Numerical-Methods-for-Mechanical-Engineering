clc
clear all
close all

a1 = 0;
b1 = 16;
N = 100000;
x11 = linspace(a1,b1,N+1);
h11 = x11(2) - x11(1);
y11 = x11.^2.*(16 - x11.^2/16);
I11 = (h11/3) * (y11(1) + 4*sum(y11(2:2:end-1)) + 2*sum(y11(3:2:end-2)) + y11(end));
x12 = linspace(a1,b1/2,N+1);
h12 = x12(2) - x12(1);
y12 = x12.^2.*(16 - x12 - 8);
I12 = (h12/3) * (y12(1) + 4*sum(y12(2:2:end-1)) + 2*sum(y12(3:2:end-2)) + y12(end));
Ix1 = I11 - I12;
fprintf("Ix(first) = %.4f\n",Ix1);

a2 = 0;
b2 = 8;
x21 = linspace(a2,b2,N+1);
h21 = x21(2) - x21(1);
y21 = x21.^2.*(x21 + 8 - x21.^2/16);
I21 = (h21/3) * (y21(1) + 4*sum(y21(2:2:end-1)) + 2*sum(y21(3:2:end-2)) + y21(end));
x22 = linspace(b2,b2*2,N+1);
h22 = x22(2) - x22(1);
y22 = x22.^2.*(16 - x22.^2/16);
I22 = (h22/3) * (y22(1) + 4*sum(y22(2:2:end-1)) + 2*sum(y22(3:2:end-2)) + y22(end));
Ix2 = I21 + I22;
fprintf("Ix(second) = %.4f",Ix2);
