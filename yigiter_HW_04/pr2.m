clc;
clear all;
close all;

X = [0 1 2 3 4 5 6 7]';
Y = [1250 1700 1945 2160 2370 2545 2710 2890]';
C = [X.^0 sqrt(X) X];
u = (C'*C)\(C'*Y);
A = u(1);
B = u(2);
D = u(3);
xx = linspace(X(1), X(end)+1, 8001);
yy = A + B*sqrt(xx)+ D*xx;
i = find(xx == 8.0);
fprintf('A = %.4f  B = %.4f  C = %.4f  y(8.0) = %.4f\n',A,B,D,yy(i));
plot(X,Y,'ro',xx,yy,'b-');