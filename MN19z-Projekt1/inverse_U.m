function [X] = inverse_U(U)
% Funkcja odwraca macierz trojkatna dolna z rozkladu LU
% Uzywamy wczesniej napisanej funkcji inverse_L

X = inverse_L(U')';

end