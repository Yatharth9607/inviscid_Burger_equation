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
    figure(k)
    plot(x,u)
    hold on
    n = (T/dt);
    C = dt/dx;
    for i = 1:n
        E(:,1) = (u(:,1).^2)/2;
        for j = 2:N
        u1(j,1) = u(j,1) - C*(E(j,1) - E(j-1,1));
        end
        u = u1;
        u(1,1) = 1;
        u(N,1) = 0;

        time = dt*i;
        if time == 2 || time == 4 || time == 6
            plot(x,u)
            hold on
        end
    end
    title(['First order Upwind scheme (FTBS) Solution (C = ',num2str(C),')'])
    xlabel('x')
    ylabel('u')
    legend({'t = 0','t = 2','t = 4','t = 6'},'Location','southwest')
    hold off
    k = k + 1;
end