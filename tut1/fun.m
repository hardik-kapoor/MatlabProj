function [out] = fun(x,y,z)
out=[x.^2+sin(z)-log(y);y*z+cos(x)-exp(y);x*x*y*z+x*sin(y)];
end
