function c0 = find_initial_c(k_0, k_star, c_star, rho, n, g, alpha)
    % Define function to compute distance to BGP
    distance_to_bgp = @(k, c) sqrt((k - k_star)^2 + (c - c_star)^2);
    
    % Initialize parameters
    epsilon = 0.00001; % Tolerance for distance to BGP
    
    % Iterate over different initial consumption values
    for c0 = 0:c_star
        % Simulate path with current c0
        [k_path, c_path, ~] = Path_ck(k_0, c0, 100, k_star, c_star, rho, n, g, alpha);
        
        % Compute distance to BGP for the last point
        distance = distance_to_bgp(k_path(end), c_path(end));
        
        % Check if conditions are satisfied
        if c_growth(k_path(end), rho, g, alpha) > 0 && k_dot(k_path(end), g, alpha, n, c_path(end)) > 0 && distance == 0
            % Found the exact initial consumption
            return;
        end
    end
    
    % If no exact initial consumption is found, raise an error
    error('Exact initial consumption not found within the specified range.');
end
