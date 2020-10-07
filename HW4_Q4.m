%% Analytical Solution
y0=-1e-5;
h=0.2;
t=0:h:1;
y1=-log(exp(-y0)+exp(-t)-1);
%plot(t,y1,'LineWidth',2)
%% Implicit Euler
y=-1e-5;
y0=y;
h=0.2;
t=0:h:1;
y1=-log(exp(-y0)+exp(-t)-1);
for i=2:6
    t(i)=t(i-1)+h;
    y_new=y(i-1)+h*exp(y(i-1)-t(i));
    y(i)=y(i-1)+h*(exp(y_new-t(i)));
end
figure(2)
plot(t,y,'--bo','LineWidth',2)
hold on 
plot(t,y1,'--kd','LineWidth',2)
hold off
title('Implicit Euler, y_0=-1e-5')
legend('Euler','Exact')
saveas(gcf,'Linearized_1.jpg')
error1=abs(y-y1);
figure(3)
plot(t,error1,'LineWidth',2)
title('Implicit Euler, y_0=-1e-5')
saveas(gcf,'Error_Linearized_1.jpg')
%% Implicit Euler y=-1
y=-1;
y0=y;
h=0.2;
t=0:h:1;
y1=-log(exp(-y0)+exp(-t)-1);
for i=2:6
    t(i)=t(i-1)+h;
    y_new=y(i-1)+h*exp(y(i-1)-t(i));
    y(i)=y(i-1)+h*(exp(y_new-t(i)));
end
figure(4)

plot(t,y,'--bo','LineWidth',2)
hold on 
plot(t,y1,'--kd','LineWidth',2)
hold off
title('Implicit Euler, y_0=-1')
legend('Euler','Exact')
saveas(gcf,'Linearized_2.jpg')
error2=abs(y-y1);
figure(5)

plot(t,error2,'LineWidth',2)
title('Implicit Euler, y_0=-1')
saveas(gcf,'Error_Linearized_2.jpg')
%% Linearized Implicit Euler y=-1e-5
y=-1e-5;
h=0.2;
t=0:h:1;
y0=y;
y1=-log(exp(-y0)+exp(-t)-1);
for i=2:6
    f=exp(y(i-1)-t(i-1));
    f1=exp(y(i-1)-t(i));
    df=exp(y(i-1)-t(i));
    y(i)=(y(i-1)+h*(f1+df))/(1-h*df);
end
figure(6)

plot(t,y,'--bo','LineWidth',2)
hold on 
plot(t,y1,'--kd','LineWidth',2)
hold off
title('Linearized Implicit Euler, y_0=-1e-5')

legend('Euler','Exact')
saveas(gcf,'Linearized_3.jpg')
error3=abs(y-y1);
figure(7)

plot(t,error3,'LineWidth',2)
title('Linearized Implicit Euler Error, y_0=-1e-5')
saveas(gcf,'Error_Linearized_3.jpg')
%% Linearized Implicit Euler y=-1
y=-1;
h=0.2;
t=0:h:1;
y0=y;
y1=-log(exp(-y0)+exp(-t)-1);
for i=2:6
    f=exp(y(i-1)-t(i-1));
    f1=exp(y(i-1)-t(i));
    df=exp(y(i-1)-t(i));
    y(i)=(y(i-1)+h*(f1+df))/(1-h*df);
end
figure(8)

plot(t,y,'--bo','LineWidth',2)
hold on 
plot(t,y1,'--kd','LineWidth',2)
hold off
title('Linearized Implicit Euler, y_0=-1')
legend('Euler','Exact')
saveas(gcf,'Linearized_4.jpg')
error4=abs(y-y1);

figure(9)

plot(t,error4,'LineWidth',2)
title('Linearized Implicit Euler Error, y_0=-1')
saveas(gcf,'Error_Linearized_4.jpg')