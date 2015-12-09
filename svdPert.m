function [] = svdPert()
%SVDPERT Plots when adding perturbations
close all;

r = [1 10 20 30];
beta = 1.5;
N = 60;
h = 6/N;
x = h:h:6-h;
P = zeros(length(x),length(r));

%With perturbations
perturb = 0.01*randn(36,1);
for i = 1:length(r)
    [P(:,i),~] = svdFact(beta,r(i),perturb);
end

figure;
for i = 1:length(r)
subplot(2,2,i)
plot(x,P(:,i),x,(0.8*cos(pi*x/6)-0.4*cos(pi*x/2)+1),'k--');
str = sprintf('r = %d', r(i));
title(str);
end

%Plot for "optimal" rank
[p,x] = svdFact(beta,7,perturb);
figure;
plot(x,p,x,(0.8*cos(pi*x/6)-0.4*cos(pi*x/2)+1),'k--');
str = sprintf('Approximation for r=%d',7);title(str);


end

