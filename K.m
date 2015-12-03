function k  = K(x,y)
beta = 1.5;
k = zeros(size(y));
k(abs(y-x)<beta) = 0.5*(1+cos(pi*(y-x)/beta))/beta; 
end



