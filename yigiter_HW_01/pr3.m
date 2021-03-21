clc;
clear all;
close all;
disp('Problem 3:');

N = 2:2:100;
N1 = 10:10:100;
func = 1./(N.^3+N.^2);
sN=zeros(1,10);
for i = 1:10
sN(i)=sum(func(1:i*5));
end
figure(3)
plot(N1,sN,'b-',N1,sN,'ko','linewidth',2);
grid on
title('Problem 3');
xlabel('N');
ylabel('s(N)');