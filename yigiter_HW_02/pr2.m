clc;
clear all;
close all;

t= 0:0.01:40;
vbval = 0:0.01:100;
vr=0:5:15;
colors = ['g-','y-','c-','m-'];
for i = 1:length(vr)
    for j = 1:length(vbval)
        y = (vbval(j)/cosd(60))*sind(t) - (vbval(j)/sind(60))*cosd(t) + (vr(i)/sind(60));
        
        yref = y(1);
        for z = 2:length(t)
            if ((y(z)*yref) <= 0)
                troot(i,j) = t(z);
                break
            end
        end
    end
    figure(2)
    plot(vbval,troot(i,:),colors(i),'linewidth',2);
    hold on;
    grid on;
    xlabel('Vboat[km/hr]');
    ylabel('Theta');
    legend('Vriver = 0','Vriver = 5','Vriver = 10','Vriver = 15','Location','SouthEast');
end
hold off