function [] = svdPlot(r)
%SVDPLOT Plots the approximation for different ranks
close all;

beta = 1.5;
N = 60;
h = 6/N;
x = h:h:6-h;
P = zeros(length(x),length(r));

perturb = 0.01*rand(36,1);

for i = 1:length(r)
    [P(:,i),~] = svdFact(beta,r(i),perturb);
end

figure;
plot(x,P,x,(0.8*cos(pi*x/6)-0.4*cos(pi*x/2)+1),'k--');

end

