
function [cineq, ceq] = p1d_constraint(p)
cineq = [];
assignin('base', 'tF', p(end));
t=[0:0.025:1]';
u=[p(1:end-1)];
[tout,yout]=sim('bangBangD',1,[],[t u]);
ceq(1) = yout(end,1) ;
ceq(2) = yout(end,2) ;
ceq(3) = yout(end,3) ;
end