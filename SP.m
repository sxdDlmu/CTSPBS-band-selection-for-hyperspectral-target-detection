%% Subspace partition strategy
% referenced to
% Q. Wang, Q. Li, and X. Li, ¡°Hyperspectral band selection via adaptivesubspace partition strategy,¡± 
% IEEE J. Sel. Topics Appl. Earth Observ.Remote Sens., vol. 12, no. 12, pp. 4940¨C4950, Dec. 2019.

function  P = SP(S, L, K)
P = floor(linspace(1, L, K)); 
for i =  1 : length(P)-2
    for j = P(i):P(i + 2) - 3
        a = [P(i), j+1];  
        sum1 = triu(S(a(1): a(2), a(1): a(2)));
        U1 = sum(sum(sum1)) / nchoosek(a(2) - a(1) + 1, 2); 
        
        b = [j + 2, P(i + 2)];
        sum2 = triu(S(b(1): b(2), b(1): b(2)));
        U2 = sum(sum(sum2)) / nchoosek(b(2) - b(1) + 1, 2);
        
        t = S(a(1): a(2), b(1): b(2));
        t(find(t == 0)) = inf;
        Dinter = max(max(t));  
        bandIndex(j+1) = (U1 + U2)/Dinter; 
    end    
        bandIndex(find(bandIndex == 0)) = inf;
        [~,zy] = min(bandIndex);
        P(i + 1) = zy;
        bandIndex = [];
        a = [];
        b = [];
end

end