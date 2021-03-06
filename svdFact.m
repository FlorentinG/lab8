function [p,x] = svdFact(beta,r,perturb)
%SVDFACT 

N = 60;
h = 6/N;
x = h:h:6-h;
y = linspace(1/6,6-1/6,36);
A = zeros(36,N-1);

%Building of the A-matrix
for i = 1:36
    for j = 1:(N-1)
        A(i,j) = K(h*j,y(i),beta);
    end
end
A = h*A;%spy(A);

%SVD Decomposition
[U,S,V] = svd(A);
F = data(beta,y)+perturb;
d = U'*F;
s = diag(S);
z = [d(1:r)./s(1:r) ; zeros(59-r,1)];

p = V*z;
end

function F = data(beta,y)
%Generates the data (we will consider the integration done by Matlab as
%"exact" and thus generating the data f_i)
%
%beta is the parameter for the kernel function
%y contains the points where we take the data 
m = length(y);
F = zeros(m,1);

for i = 1:m
    F(i) = integral(@(x) f(x,y(i),beta),max(0,y(i)-beta),min(6,y(i)+beta));
end
end

function inte = f(x,y,beta)
%Defines the function to integrate (for "exact" integration)
inte = (0.8*cos(pi*x/6)-0.4*cos(pi*x/2)+1).*K(x,y,beta);
end

function kern = K(x,y,beta)
%Defines the kernel function
if abs(y-x)<beta
    kern = (1+cos(pi*(y-x)./beta))/(2*beta);
else
    kern = 0;
end
end
