clc;
clear all;
close all;
disp('Problem 5:');

a = [1, 10, 100];
x = 0:0.0001:2;
b = 0;
figure(5)
for i = 1:3
    for j =1:3
        b=b+1;
        y = sin(a(j)*x/10).*cos(a(i)*x/10);
        subplot(3,3,b);
        plot(x,y,'k-','linewidth',1);
        grid on;
        title(['a=',num2str(a(j)),' b=',num2str(a(i))]);
        xlabel('x');
        ylabel('y');
        axis equal;
        axis([0 2 -1 1])
    end
end