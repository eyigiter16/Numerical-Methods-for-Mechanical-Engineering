clc;
clear all;
close all;
X = [1 1 1]';
err = 1;
i = 0;
while err > 0.0001
    x = X(1); y = X(2); z = X(3);
    F = [(3*x^2 - 2*x*y + z^3 -3);
        (6*x + 3*y^2 - 2*x*y*z - 6);
        (2*x*z + y^2 - x*y*z^2 - 2)];
    J = [6*x-2*y -2*x 3*z^2;
        6-2*y*z 6*y-2*x*z -2*x*y;
        2*z-y*z^2 2*y-x*z^2 2*x-2*x*y*z];
    Xnew = X - J\F;
    err = norm(Xnew-X);
    X = Xnew;
    x = X(1); y = X(2); z = X(3);
    i = i+1;
    fprintf('At step%3.0f x = %3.4f y = %3.4f z = %3.4f err = %3.4f \n',i,x,y,z,err)
end