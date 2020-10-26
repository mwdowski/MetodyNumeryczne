function [x] = my_colnorm(A)
% Funckja zwraca norme kolumnowa macierzy A
% Norma kolumnowa to maksymalna suma modulow elementow z kolumn

n = length(A);
A = abs(A);
A = cumsum(A);
x = max(A(n, :));

end