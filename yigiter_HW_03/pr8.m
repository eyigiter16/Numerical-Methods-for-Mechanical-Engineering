clc;
clear all;
close all;

X = [2 3]';
err = 1;
i = 0;
while err > 0.0001
    x = X(1); y = X(2);
    F = [(exp(-x)*y + y^2*x - 20);
        (x^2*y - y*exp(-x) - 10)];
    J = [-exp(-x)*y+y^2 exp(-x)+2*x*y
        2*x*y+exp(-x)*y x^2-exp(-x)];
    Xnew = X - J\F;
    err = norm(Xnew-X);
    X = Xnew;
    x = X(1); y = X(2);
    i = i+1;
    fprintf('At step%3.0f x = %3.4f y = %3.4f err = %3.4f \n',i,x,y,err)
end