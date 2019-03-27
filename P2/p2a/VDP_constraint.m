function [cineq, ceq] = VDP_constraint(p)

cineq = [];
assignin('base', 'tF', p(end));

tau=[0:0.02:1]';
u=[p(1:end-1)];

[tout,yout]=sim('VDP1',1,[],[tau u]);

ceq(1) = yout(end,1)-3 ;
ceq(2) = yout(end,2) ;

end