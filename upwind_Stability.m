clear
L = 4;
dx = 0.05;
x = (0:dx:L);
N = (L/dx)+1;
T = 6;

for dt = [0.01,0.025,0.05,0.0625]
    unitstep1 = x<0.25;
    unitstep2 = x<=1.25;
    u(:,1) = unitstep1 + ((1.25 - x).*(unitstep2 - unitstep1));

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
        if time == 2
            figure(1)
            plot(x,u)
            hold on
        end
    end
end
title('First order Upwind scheme (FTBS) Solution - effect of Courant Number at t = 2 sec')
grid on
xlabel('x')
ylabel('u')
ylim([-0.2,1.2])
legend({'C = 0.2','C = 0.5','C = 1','C = 1.25'},'Location','southwest')
hold off