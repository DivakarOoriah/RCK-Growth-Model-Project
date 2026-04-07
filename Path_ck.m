function [k_vec,c_vec,distance] = Path_ck(k_0,c_0,T,k_star,c_star,rho,n,g,alpha)
    % Initialize vectors
    k_vec = k_0 * ones(1,T);
    c_vec = c_0 * ones(1,T);
    

    
    % Iterate until convergence or maximum iterations
    for i = 2:T
        % Update k and c vectors
        k_vec(i) = k_vec(i-1) + k_dot(k_vec(i-1),g,alpha,n,c_vec(i-1));
        c_vec(i) = c_vec(i-1) + c_growth(k_vec(i-1),rho,g,alpha) * c_vec(i-1);
        
        % Compute distance from target point
        distance = sqrt((k_vec(i) - k_star)^2 + (c_vec(i) - c_star)^2);
        
     
    end
end