function [X] = inverse_L(L)
% Funkcja odwraca macierz trojkatna gorna z rozkladu LU

[n, n] = size(L);
X = eye(n);

for i=1:(n-1)
    
    % Operacje wierszowe, tak jak na dopisanej macierzy jednostkowej
    k = (i+1):n;
    X(k, :) = X(k, :) - L(k, i)*X(i, :)/L(i, i);
    % X(i, :) = X(i, :)/L(i, i);
    
end

X = X./diag(L);

end