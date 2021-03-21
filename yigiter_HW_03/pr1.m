clc;
clear all;
close all;

x = 0:0.0001:10;
y = 100*exp((-0.1)*x).*cos(4*x+pi).*sin(x+4);

counter = 0;
yref = y(1);
disp('        Root #  |  x ');
disp('--------------------------------------');
for i = 2:length(x)
    if ((y(i)*yref) <= 0)
        counter = counter + 1;
        xroot(counter) = x(i);
        yroot(counter) = y(i);
        yref = -yref;
        if(counter<10)
            fprintf('          %.0f     |  %.4f \n',counter,x(i));
        else
            fprintf('          %.0f    |  %.4f \n',counter,x(i));
        end
    end
end

figure(1)
plot(x,y,'b-',xroot,yroot,'ro','linewidth',2)
grid on;
xlabel('X');
ylabel('Y');
legend('y(x)','Roots')