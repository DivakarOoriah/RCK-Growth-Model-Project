function df_k = RCK_df(k,alpha)
% Derivative of the production function
df_k = alpha * (k.^ (alpha - 1));
end