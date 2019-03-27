tF = 6;
t = 0:0.025:1;
u = 0.01* ones(length(t),1);
u(end+1) = tF;
%% Optimization
lb = -1.0 * ones(length(t),1);
ub = 1.0 * ones(length(t),1);
lb(end+1) = 1;
ub(end+1) = 10;
options = optimset('Display', 'iter', 'TolCon', 1e-5,'TolFun', 1e-5, 'PlotFcns','optimplotx', 'MaxFunEvals', 4400);
[yF,cost] = fmincon('p1d_cost',u,[],[],[],[],lb,ub,'p1d_constraint',options);
%% Plotting
tF = yF(end)
[tout,yout] = sim('bangBangD',1,[],[t' yF(1:end-1)]);

figure;
plot(t*tF,[yout(:,1),yout(:,2),yout(:,3)]);
legend('x1','x2','x3'); title('State time history');
grid;
figure;
plot(t*tF,yF(1:end-1))
title('Control time history')

