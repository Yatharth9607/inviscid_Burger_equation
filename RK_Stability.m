clear
L = 4;
dx = 0.05;
x = (0:dx:L);
N = (L/dx)+1;
T = 6;

for dt = [0.01,0.025,0.05,0.0625,0.08]
    unitstep1 = x<0.25;
    unitstep2 = x<=1.25;
    u(:,1) = unitstep1 + ((1.25 - x).*(unitstep2 - unitstep1));
    u1 = u;
    n = (T/dt);
    C = dt/dx;
    for i = 1:n
        for l = 1:4
            Ex = Exi(u1,N,dx);
            u1(:,1) = u(:,1) - (1/(5-l))*dt*(Ex(:,1));
        end
        u1(:,1) = u1(:,1) + Damp(u,N,0,0.1);        
        u = u1;
        u(1,1) = 1;
        u(N,1) = 0;
        
        time = dt*i;
        if time == 2
            figure(1)
            plot(x,u)
            hold on
        end
    end
end
grid on
title('Fourth Order Runge-Kutta method - effect of Courant Number at t = 2 sec')
xlabel('x')
ylabel('u')
legend({'C = 0.2','C = 0.5','C = 1','C = 1.25','C = 1.6'},'Location','southwest')
hold off