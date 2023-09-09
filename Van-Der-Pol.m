

[t1, x1] = ode45(@(t,x) func_xdot(t,x,1), [0,100], [1,0]);
[t01, x01] = ode45(@(t,x) func_xdot(t,x,0.1), [0,100], [1,0]);

t45 = tic();
[t100, x100] = ode45(@(t,x) func_xdot(t,x,100), [0,1000], [1,0]);
t45_end = toc(t45)

t15 = tic();
[t100_15, x100_15] = ode15s(@(t,x) func_xdot(t,x,100), [0,1000], [1,0]);
t15_end = toc(t15)

figure
subplot(2,3,1)
plot(t1,x1(:,1))
title('Time response for mu = 1')
subplot(2,3,2)
plot(t01,x01(:,1))
title('Time response for mu = 0.1')
subplot(2,3,3)
plot(t100,x100(:,1))
title('Time response for mu = 100')

subplot(2,3,4)
plot(x1(:,1),x1(:,2))
title('Phase Plane Plot for mu = 1')
subplot(2,3,5)
plot(x01(:,1),x01(:,2))
title('Phase Plane Plot for mu = 0.1')
subplot(2,3,6)
plot(x100(:,1),x100(:,2))
title('Phase Plane Plot for mu = 100')

function xdot = func_xdot(t,x,mu)
xdot(1) = mu*x(2);
xdot(2) = mu*(1-x(1)^2)*x(2) - x(1)/mu;
xdot = xdot';
end
