function [X, r_R, r_L] = inverse_A(A)
% Funkcja zwraca odwrotnosc macierzy A
% Wykorzystuje ona metode rozkladu LU - GECP

[n, n] = size(A);
[L, U, P, Q] = my_gecp(A);

% Wyliczenie macierzy odwrotnej ze wzoru
X = Q * inverse_U(U) * inverse_L(L) * P;

% Wyliczenie r_R i r_L
r_R = norm( A*X - eye(n) ) / norm(A) / norm(X);
r_L = norm( X*A - eye(n) ) / norm(A) / norm(X);

end