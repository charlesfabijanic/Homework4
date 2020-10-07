%%Explicit Euler_h=1

y0=1;
t0=0;
h=1.0;
t_max=20;
t=t0;
y=y0;
for i=1:t_max/h+1
    t(i+1)=t(i)+h;
    y(i+1)=y(i)+h*(-0.5*y(i));
end
hold on
figure(1)
plot(t,y,'--y.','LineWidth',2)


%% Explicit Euler h=4.2

%%Explicit Euler_h=1

y0=1;
t0=0;
h=4.2;
t_max=20;
t=t0;
y=y0;
for i=1:t_max/h+1
    t(i+1)=t(i)+h;
    y(i+1)=y(i)+h*(-0.5*y(i));
end

plot(t,y,'--ko','LineWidth',2)

%% Implicit Euler h=1.0

y0=1;
t0=0;
h=1;
t_max=20;
t=t0;
y=y0;

for i=1:t_max/h+1
    t(i+1)=t(i)+h;
    y(i+1)=y(i)/(0.5*h+1);
end
plot(t,y,'--r*','LineWidth',2)

%% Implicity Euler h=4.2

y0=1;
t0=0;
h=4.2;
t_max=20;
t=t0;
y=y0;
f=@(t,y)(-0.5*y+0*t);
for i=1:t_max/h+1
    t(i+1)=t(i)+h;
    y(i+1)=y(i)/(0.5*h+1);
end
tt=linspace(0,20,100);
y_exact=exp(-0.5*tt);
plot(t,y,'--bd','LineWidth',2)
plot(tt,y_exact,'--gs','linewidth',2)
legend('Explicit Euler h=1.0','Explicit Euler h=4.2','Implicit Euler h=1.0','Implicit Euler h=4.2','Exact')
hold off
saveas(gcf,'Q1.jpg')
