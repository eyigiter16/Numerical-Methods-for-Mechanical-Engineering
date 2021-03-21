clc;
clear all;
close all;

X = [10 20 30 40 50]';
Y = [705 926 948 1039 1538]';
C = [X.^0 X.^2 sin(0.1*X)];
u = (C'*C)\(C'*Y);
A = u(1);
B = u(2);
D = u(3);
xx = linspace(X(1)-10, X(end)+10, 60001);
yy = A + B*xx.^2+ D*sin(0.1*xx);
i = find(xx == 0);
fprintf('A = %.4f  B = %.4f  C = %.4f  y(8.0) = %.4f\n',A,B,D,yy(i));
plot(X,Y,'ro',xx,yy,'b-');