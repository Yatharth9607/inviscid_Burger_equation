clear
L = 4;
dx = 0.05;
x = (0:dx:L);
N = (L/dx)+1;
T = 6;

k = 1;
for dt = [0.01,0.025,0.04,0.05]
    unitstep1 = x<0.25;
    unitstep2 = x<=1.25;
    u(:,1) = unitstep1 + ((1.25 - x).*(unitstep2 - unitstep1));
    u1 = u;
    figure(k)
    plot(x,u)
    hold on
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
        if time == 2 || time == 4 || time == 6
            plot(x,u)
            hold on
        end
    end
    title(['Fourth Order Runge-Kutta method (C = ',num2str(C),')'])
    grid on
    xlabel('x')
    ylabel('u')
    legend({'t = 0','t = 2','t = 4','t = 6'},'Location','southwest')
    hold off
    k = k + 1;
end