function v = variance(M, target)
% References
%   Qian Du, Hsuan Ren, and Chein-I Cheng. A Comparative Study of 
% Orthogonal Subspace Projection and Constrained Energy Minimization.  
% IEEE TGRS. Volume 41. Number 6. June 2003.
[~,N] = size(M);
R_hat = (M*M.')/N; 
Rinv = inv(R_hat);

tmp = target'*Rinv*target;
v = 1./tmp;
end