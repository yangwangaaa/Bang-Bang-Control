tF = 4;
t = 0:0.025:1;
u = 0.01* ones(length(t),1);
u(end+1) = tF;
%% Optimization
lb = -0.5 * ones(length(t),1);
ub = 0.5 * ones(length(t),1);
lb(end+1) = 1;
ub(end+1) = 10;
options = optimset('Display', 'iter', 'TolCon', 1e-5,'TolFun', 1e-5, 'PlotFcns','optimplotx', 'MaxFunEvals', 4700);
[yF,cost] = fmincon('p1c_cost',u,[],[],[],[],lb,ub,'p1c_constraint',options);
%% Plotting
tF = yF(end)
[tout,yout] = sim('bangBang3',1,[],[t' yF(1:end-1)]);
figure;
plot(t*tF,[yout(:,1),yout(:,2),yout(:,3)]);
legend('x1','x2','x3'); title('State time history');
grid;
figure;
plot(t*tF,yF(1:end-1))
title('Control time history')

