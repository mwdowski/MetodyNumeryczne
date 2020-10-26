function [y] = w_cz(a, x)
% Funkcja w_cz wyznacza wartosc wielomianu z bazy wielomianow
% Czebyszewa II-go rodzaju: w_cz(a, x) = a_0*U_0(x) + ... + a_n*U_n(x)
% Wejscie:
% - a - wektor z wartosciami wspolczynnikow przy kolejnych skladnikach
%     - pierwszy element jest wspolczynnikiem dla U_0, a ostatni - U_(n-1)
%     - rozmiar a musi byc wiekszy niz 1
% - x - argument przy wyliczaniu
% Wyjscie:
% - y - wartosc w_cz w punkcie x

% wartosci poczatkowych U_i oraz limit iteratora
n = length(a);
if n < 2
    error('zbyt krotki rozmiar wektora a')
end

U_0 = 1;
U_1 = 2.*x;
y = a(1) + U_1 .* a(2);

for i = 3:n
    % wyliczenie kolejnego U_i z rekurencyjnej definicji
    U_2 = 2.*x.*U_1 - U_0;
    
    % zwiekszenie wartosci o nowy element
    y = y + U_2 .* a(i);
    
    % przepisanie nowych wartosci
    U_0 = U_1;
    U_1 = U_2;
end

end