clc;
clear all;
close all;

x = 0:0.001:2.5;
colors = ['r','g','y','c','m'];
for k = 1:1:5
    for f = 0:1:20000
        kval = k*100;
        fval(f+1) = f/100;
        y = 4*kval*x.*(sqrt(9+x.^2)-3)-fval(f+1).*sqrt(9+x.^2);
        
        yref = y(1);
        for i = 2:length(x)
            if ((y(i)*yref) <= 0 || (y(i)*yref) == 0)
                xroot(k,f+1)=x(i);
                break
            end
        end
    end
    figure(1)
    plot(fval,xroot(k,:),colors(k),'linewidth',2);
    hold on;
    grid on;
    xlabel('F[N]');
    ylabel('X[m]');
    legend('k=100N/m','k=200N/m','k=300N/m','k=400N/m','k=500N/m','Location','SouthEast');
end
hold off