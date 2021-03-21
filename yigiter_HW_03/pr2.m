clc;
clear all;
close all;

x = 0:0.00001:20;
y = (30./(1+x)) + (20*((x + x.^2)./(1 + 5*x.^2))) + (40*sin(x).*exp((-0.25)*x));

yAve = mean(y);

counter = 0;
for i = 1:length(x)
   if(y(i)<=yAve+0.00002 && y(i)>= yAve-0.00001)
       counter = 1 + counter;
       yroot(counter) = y(i);
       xroot(counter) = x(i);
   end
end

figure(2)
plot(x,y,'b-',xroot,yroot,'ro','linewidth',2)
grid on;
xlabel('X');
ylabel('Y');
legend('y(x)','Satisfying points')
title({['X1 = ',num2str(xroot(1)),'  X2 = ',num2str(xroot(2)),'  X3 = ',num2str(xroot(3))]});