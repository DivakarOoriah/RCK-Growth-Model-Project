% Coding Question:
% Part 1: Setting up the parameters and functions
%% 1.
K_0 = 411.7;
L_0 = 115.3;
H = 100;
rho = 0.05;
n = 0.025;
g = 0.02;
alpha = 1/3;
para_vec = [K_0,L_0,H,rho,n,g,alpha]
%% 4.
k_star = fzero(@(k) c_growth(k,rho,g,alpha),10);
%% 6.
c_star = k_locus(k_star,alpha,n,g)
%% 7.
fplot(@(k) k_locus(k,alpha,n,g),[0,20]);
hold on;
xline(k_star);
hold off
%% 
% Part 2: Dynamics of c and k
%% 2.
% First trial:
[k_vec_1t,c_vec_1t,distance_1t]= Path_ck(5,1.4,10,k_star,c_star,rho,n,g,alpha);
% Based on the first trial, at c_0 = 1.4 and T = 10, it can be observed that 
% the k_vec first increase until T = 3, and the c_vec always increases, meaning
% that the economy first starts at the region where both k_dot and c_dot are
% greater than 0. However starting from T = 4, the k_vec starts decreasing and
% c_vec still increases, meaning that from this point the economy converges
% to the region where k_dot is smaller than 0 and c_dot is greater than 0.
% So our first c_0 is 1.4 and T = 10.

% Second trial:
[k_vec_2t,c_vec_2t,distance_2t]= Path_ck(5,0.4,10,k_star,c_star,rho,n,g,alpha);

% Based on the second trial, at c_0 = 0.4 and T = 10, it can be observed that 
% the c_vec first increase until T = 6, and the k_vec always increases, meaning
% that the economy first starts at the region where both k_dot and c_dot are
% greater than 0. However starting from T = 7, the c_vec starts decreasing and
% k_vec still increases, meaning that from this point the economy converges
% to the region where c_dot is smaller than 0 and k_dot is greater than 0.
% So our second c_0 is 0.4 and T = 10.

%% 3.
fplot(@(k) k_locus(k,alpha,n,g),[0,20])
xline(k_star);
hold on;
plot(k_vec_1t,c_vec_1t);
hold on;
plot(k_vec_2t,c_vec_2t);
hold off
%% 4.

fplot(@(k) k_locus(k,alpha,n,g),[0,20])
xline(k_star);
hold on;
plot(k_vec_1t,c_vec_1t);
hold on;
plot(k_vec_2t,c_vec_2t);
hold off


%% Rough work
k_0 = 5;

%%
fplot(@(k) k_locus(k,alpha,n,g), [0,20]);
hold on
xline(k_star)
hold on
plot(a,b);
hold off
k_0 = 5
%%
c_0 = find_initial_c(k_0, k_star, c_star, 40, 0.001, rho, n, g, alpha);
%%
[a,b,c]= Path_ck(5,c_0,10,k_star,c_star,rho,n,g,alpha);