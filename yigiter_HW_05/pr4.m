clc
clear all
close all

N = 11001;
X = [0 10 20 30 40 50 60 70 80 90 100]';
Y = [200 205 213 220 225 226 221 211 198 183 170]';
C = [X.^0 X X.^2 X.^3 X.^4];
u = (C'*C)\(C'*Y);
A = u(1);
B = u(2);
D = u(3);
E = u(4);
F = u(5);
xx = linspace(X(1), X(end), N);
yy = A + B*xx+ D*xx.^2+ E*xx.^3+ F*xx.^4;

h = xx(2) - xx(1);
yp = zeros(1,N);
yp(1) = (-yy(3) + 4*yy(2) - 3*yy(1)) / (2*h);
yp(N) = -(-yy(N-2) + 4*yy(N-1) - 3*yy(N)) / (2*h);
for i = 2:1:N-1
   yp(i) = (yy(i+1) - yy(i-1)) / (2*h);
end

subplot(2,1,1), plot(xx,yy,'r-','linewidth',1);
grid on
xlabel('x'), ylabel('y');
subplot(2,1,2), plot(xx,yp,'m-','linewidth',1);
grid on
xlabel('x'), ylabel('dy/dx');

I = (h/3) * (yy(1) + 4*sum(yy(2:2:end-1)) + 2*sum(yy(3:2:end-2)) + yy(end));
fprintf("Integral between 0 and 100 = %.4f\n",I);
