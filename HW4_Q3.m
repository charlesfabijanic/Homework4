%%Explicit Euler Solution y=exp(i*t)
clc
clearvars
y0=1;
t0=0;
h=0.1;
t_max=20;
t=t0;
y=y0;
z=complex(0,1);
for i=2:t_max/h
    t(i)=t(i-1)+h;
    f=y(i-1)*z;
    y(i)=y(i-1)+h*f;
end
hold on
plot(t,y,'ko','LineWidth',2)


%% 2nd order Runge Kutta h=0.1

clc
clearvars
y0=1;
t0=0;
h=0.1;
t_max=20;
t=t0;
y=y0;
z=complex(0,1);
for i=2:t_max/h
    t(i)=t(i-1)+h;
    f=y(i-1)*z;
    k1=h*f;
    ynew=y(i-1)+k1*h/2;
    f2=ynew*z;
    k2=h*f2;
    y(i)=y(i-1)+(k1+k2)/2;
end

plot(t,y,'b*','LineWidth',2)

%% 4th order Runge Kutta h=0.1

clc
clearvars
y0=1;
t0=0;
h=0.1;
t_max=20;
t=t0;
y=y0;
z=complex(0,1);
for i=2:t_max/h
    t(i)=t(i-1)+h;
    f=y(i-1)*z;
    k1=h*f;
    ynew=y(i-1)+k1*h/2;
    f2=ynew*z;
    k2=h*f2;
    ynew=y(i-1)+k2*h/2;
    f3=ynew*z;
    k3=h*f3;
    ynew=y(i-1)+k1*h;
    f4=ynew*z;
    k4=h*f4;
    y(i)=y(i-1)+(k1+2*k2+2*k3+k4)/6;
end

plot(t,y,'gs','LineWidth',2)

%% Leapfrog

clc
clearvars
y0=1;
t0=0;
h=0.1;
t_max=20;
t=t0;
z=complex(0,1);
y=y0;
y(2)=y0+h*(y(1)*z);
for i=2:t_max/h-1
    t(i)=t(i-1)+h;
    y(i+1)=y(i-1)+2*h*(y(i)*z);
end

plot(linspace(0,20,200),real(y),'--y','LineWidth',2)

%% Adams Bashforth Method

clc
clearvars
y0=1;
t0=0;
h=0.1;
t_max=20;
t=t0;
y=y0;
z=complex(0,1);
f=y(1)*z;
y(2)=y(1)+h*f;
for i=3:t_max/h
    f2=y(i-1)*z;
    f1=y(i-2)*z;
    y(i)=y(i-1)+1.5*h*f2-0.5*h*f1;
end

plot(linspace(0,20,200),y,'rd','LineWidth',2)
t=linspace(0,20,200);
y_act=exp(z*t);
plot(t,y_act,'m.','LineWidth',2)
legend('Explicit Euler','2nd Order RK','4th Order RK','Leapfrog','Adams Bashforth','Exact Solution')
saveas(gcf,'Q3.jpg')