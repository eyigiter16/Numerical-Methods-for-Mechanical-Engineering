clc;
clear all;
close all;

theta = 0:0.0001:2*pi;
r = [40 30 0 20]';
colors = ['g','y','c','m'];
for R = 1:4
    for i = 1:length(theta)
        A = [6+R*sin(theta(i)) 1 1 0;
            1 6+R*cos(theta(i)) 0 1;
            1 -1 6-R*sin(theta(i)) 1;
            2 1 -1 6-R*cos(theta(i))];
        M(:,i) = A\r;
        deter(i)=det(A);
    end
    figure(2)
    plot(theta,deter,colors(R),'linewidth',1);
    xlabel('Theta');
    ylabel('Det(A)');
    hold on
    legend('R=1','R=2','R=3','R=4','Location','SouthEast');
    for j = 1:4
        figure(1)
        subplot(2,2,R);
        plot(theta,M(j,:),colors(j),'linewidth',1);
        grid on;
        hold on;
        title(['R = ',num2str(R)]);
        xlabel('Theta');
        ylabel('X Y Z U');
        legend('X','Y','Z','U','Location','SouthEast');
    end
end
hold off
hold off