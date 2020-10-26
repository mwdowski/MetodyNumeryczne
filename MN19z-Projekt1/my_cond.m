function [x, r_R, r_L] = my_cond(A)
% Funkcja zwraca wskaznik uwarunkowania macierzy A

[B, r_R, r_L] = inverse_A(A);

x = my_colnorm(B)*my_colnorm(A);

end