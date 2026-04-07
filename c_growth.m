function c_grwth = c_growth(k,rho,g,alpha)
% Growth rate of c
c_grwth = RCK_df(k,alpha) - rho - g;
end