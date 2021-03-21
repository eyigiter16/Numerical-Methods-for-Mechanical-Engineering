clc;
clear all;
close all;

x = 0:0.0001:26;
b = 3.5:0.001:5;
for i = 1:length(b)
y = 20 + (100*sin(x/2).*exp(-0.1*b(i)*x))/sqrt(1+b(i));
if(max(y)<=35.00 && max(y)>=34.99)
    break
end
end

figure(3)
plot(x,y,'linewidth',2)
grid on;
xlabel('X');
ylabel('Y');
b(i)