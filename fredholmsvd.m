m = 36; % data points
n = 61; % integration points
a = 0; b = 6;
y = linspace(a,b,m);

% generate f
f = 0.8*cos(pi*y/6)-0.4*cos(pi*y*0.5)+1;
f = f + 0.01*randn(1,length(y));
f = f';

% build A
coeff = 0.5*h*[1 2*ones(1,n-2) 1];
A = zeros(m,n);

% solve with SVD
[U,S,V] = svd(A);







