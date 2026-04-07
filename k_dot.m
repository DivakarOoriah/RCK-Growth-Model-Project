function k_dt = k_dot(k,g,alpha,n,c)
% Function of k_dot
k_dt = RCK_f(k,alpha) - c - (n+g)*k;
end