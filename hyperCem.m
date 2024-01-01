function [ results ] = hyperCem( M,target )
% HYPERCEM Performs constrained energy minimization (CEM) algorithm
%   Performs the constrained energy minimization algorithm for target
% detection.
%
% Inputs
%   M - 2d matrix of HSI data (p x N)
%   target - target of interest (p x 1)
% Outputs
%   results - vector of detector output (N x 1)

% References
%   Qian Du, Hsuan Ren, and Chein-I Cheng. A Comparative Study of 
% Orthogonal Subspace Projection and Constrained Energy Minimization.  
% IEEE TGRS. Volume 41. Number 6. June 2003.
[~,N] = size(M);
% CEM uses the correlation matrix, NOT the covariance matrix. Therefore,
% don't remove the mean from the data.
R_hat = (M*M.')/N;   
Rinv = pinv(R_hat);   
tmp = target'*Rinv*target; 
results = zeros(1,N);
for k = 1:N
    results(k) = (target'*Rinv*M(:,k))/tmp; 
 
end


