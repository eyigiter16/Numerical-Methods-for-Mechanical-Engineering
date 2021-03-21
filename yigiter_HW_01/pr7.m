clc;
clear all;
close all;
disp('Problem 7:');

x = 0:0.0001:4;
b = 0:0.00005:2;

i = 0;

fmax = zeros(1,40001);
fmin = zeros(1,40001);

for b1 = 0:0.0001:2
    i = i + 1;
f2 = (sin(b1*x)).*((b1*(x.^2))-(2*x)+10);

fmax(i) = max(f2);
fmin(i) = min(f2);

end

figure(7)
plot(b,fmin,'k-','linewidth',2);
grid on;
xlabel('b');
ylabel('fmin(x)');
figure(8)
plot(b,fmax,'b-','linewidth',2);
grid on;
xlabel('b');
ylabel('fmax(x)');
