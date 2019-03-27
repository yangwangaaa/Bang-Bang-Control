tF = 4;
mu = 5;
t = 0:0.02:1;
u = 0.05* ones(length(t),1);
u(end+1) = tF;
%% Optimization

lb = -10 * ones(length(t),1);
ub = 10 * ones(length(t),1);
lb(end+1) = 0.2;
ub(end+1) = 30;

options = optimset('Display','iter','TolCon',1e-4,'TolFun',1e-4,'PlotFcns','optimplotx', 'MaxFunEvals',5000,'Algorithm','interior-point');
[yF,cost] = fmincon('VDP_cost',u,[],[],[],[],lb,ub,'VDP_constraint',options);


%% Plotting
tF = yF(end)
[tout,yout] = sim('VDP1',1,[],[t' yF(1:end-1)]);

figure;
plot(yout(:,1),yout(:,2));title('Phase plane plot');grid on;
figure;
plot((1:201)*tF,yout);title('State time history');legend('x1','x2');grid on;
figure;
plot(t*tF,yF(1:end-1))
title('Control time history');