%% Part 1... y(t)=1/(e^t+1)

h=[1,0.1,0.01,0.001,0.0001,0.00001];
for j=1:length(h)
    t=0:h(j):1;
    y=0.5;
    for i=1:length(t)-1
        y(i+1)=y(i)-(h(j)/2)*(2*(y(i)*(1-y(i))))/(1-(h(j)/2)*(1-2*y(i)));
    end
    if j==2
        y1=y;
    end
    plot(t,y);
    hold on
end
yy=1./(exp(t)+1);
plot(t,yy)
legend('h=1','h=0.1','h=0.01','h=0.001','h=0.0001','h=0.00001')
hold off
saveas(gcf,'Q2_P1.jpg')


%% Part 2

h=[1,0.1,0.01,0.001,0.0001,0.00001];
for j=1:length(h)
    t=0:h(j):1;
    y=0.5;
    for i=1:length(t)-1
        y_new=y(i)+h(j)*(-y(i)*(1-y(i)));
        y(i+1)=y(i)+(h(j)/2)*(-y_new*(1-y_new)-y(i)*(1-y(i)));
    end
    if j==2
        y2=y;
    end
    plot(t,y);
    hold on
end
yy=1./(exp(t)+1);
plot(t,yy)
legend
legend('h=1','h=0.1','h=0.01','h=0.001','h=0.0001','h=0.00001')
hold off
saveas(gcf,'Q2_P2.jpg')

%% Part 3
close all 
figure(1)
t=linspace(0,1,11);
hold on
plot(t,y1,'--kd','LineWidth',2)
plot(t,y2,'--bo','LineWidth',2)
plot(linspace(0,1,length(yy)),yy,'--r.','LineWidth',2)
hold off
legend('Linearlized Trapezoidal', 'Direct Trapezoidal')
saveas(gcf,'Q2_P3.jpg')