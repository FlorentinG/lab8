function [] = svdPlot(r)
%SVDPLOT Plots the approximation for different ranks
close all;

beta = 1.5;
N = 60;
h = 6/N;
x = h:h:6-h;
P = zeros(length(x),length(r));

%No perturbations
perturb = 0;
for i = 1:length(r)
    [P(:,i),~] = svdFact(beta,r(i),perturb);
end

figure;
for i = 1:length(r)
subplot(2,2,i);
plot(x,P(:,i),x,(0.8*cos(pi*x/6)-0.4*cos(pi*x/2)+1),'k--');
str = sprintf('r = %d', r(i));
legend('Approximated p', 'Real p');
title(str);
end


end

