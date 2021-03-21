clc;
clear all;
close all;

x = 0:0.01:10;
b = 0:0.1:4;

for i = 1:length(b)
    counter=0;
    y = 15*cos((2+b(i))*x).*exp(-0.2*x)+10;
    yref = y(1);
    for j = 2:length(x)
        if ((y(j)*yref) <= 0)
            counter = counter + 1;
            yref = -yref;
        end
    end
    count(i) = counter;
end

plot(b,count,'b.')
xlabel('b')
ylabel('The number of roots')
grid on
axis equal
