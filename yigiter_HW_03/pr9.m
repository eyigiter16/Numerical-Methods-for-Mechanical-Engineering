clc;
clear all;
close all;

X = [1 0]';
b = 0:0.0001:1;
for j = 1:length(b)
    err = 1;
    i = 0;
    while err > 0.0001
        x = X(1); y = X(2);
        F = [((5+b(j))*x^2-x*y/(2+b(j))-4);
            (4*x*y + b(j)*x + y - 1)];
        J = [2*x*(5+b(j))-(1/(2+b(j)))*y -(1/(2+b(j)))*x;
            4*y+b(j) 4*x+1];
        Xnew = X - J\F;
        err = norm(Xnew-X);
        X = Xnew;
        x = X(1); y = X(2);
        i = i+1;
    end
    xroot(j) = x;
    yroot(j) = y;
end
figure(9)
plot(b,xroot,'m-',b,yroot,'g-','linewidth',1)
xlabel('b')
ylabel('X  Y')
legend('x','y')
grid on