clc
clear all
close all

a = 0;
b = 10;
N = 10001;
x = linspace(a,b,N);
h = x(2) - x(1);
y = 20 + 10*sin(2*x).*exp(-0.1*x)./sqrt(1+3*x);
yp = zeros(1,N);
yp(1) = (-y(3) + 4*y(2) - 3*y(1)) / (2*h);
yp(N) = -(-y(N-2) + 4*y(N-1) - 3*y(N)) / (2*h);
for i = 2:1:N-1
   yp(i) = (y(i+1) - y(i-1)) / (2*h);
end

subplot(2,1,1), plot(x,y,'r-','linewidth',1);
grid on
xlabel('x'), ylabel('y');
subplot(2,1,2), plot(x,yp,'m-','linewidth',1);
grid on
xlabel('x'), ylabel('dy/dx');

I = (h/3) * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
fprintf("Integral between 0 and 10 = %.4f\n",I);

c = 0;
I80 = 0;
while(I80<79.9999)
x = linspace(a,c,N+1);
h = x(2) - x(1);
y = 100*(1-exp(-0.1*x).*cos(4*x+pi).*sin(x+4));
I80 = (h/3) * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
c = c+0.00001;
end
fprintf("With %d many small intervals, the b value must be b = %.5f for the Integral to be 80.",N-1,c);

