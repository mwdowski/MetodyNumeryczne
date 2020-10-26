function [x, r] = metoda_parabol(f, x_0, x_1, x_2, eps, n)
% Funkcja metoda_parabol wyznacza pewne miejsce zerowe x funkcji f
% za pomoca metody parabol (metody Mullera)
% Wejscie:
% - f - funkcja z miejscem zerowym w zakresie wyznaczonym przez x_0, x_1 i x_2
%     - ten warunek nie musi byc spelniony, ale wtedy metoda
%         moze nie znalezc miejsca zerowego
% - x_0, x_1, x_2 - liczby rzeczywiste - poczatkowe przyblizenia x
% - eps - maksymalny blad przyblizenia x
% - n - maksymalna liczba iteracji przy szukaniu x
% Wyjscie:
% - x - miejsce zerowe f z dokladniscia do eps
% - r - liczba iteracji, ktora byla potrzebna do znalezienia x

% licznik iteracji
r = 0;

% wartosci funkcji w dla poczatkowych argumentow
fx_0 = f(x_0);
fx_1 = f(x_1);
fx_2 = f(x_2);

% wartosci ilorazow roznicowych dla podanych argumentow
fc01 = (fx_0 - fx_1)/(x_0 - x_1);
fc12 = (fx_2 - fx_1)/(x_2 - x_1);
fc02 = (fx_2 - fx_0)/(x_2 - x_0);

% petla wykonuje sie do momentu az spelniony bedzie jeden z warunkow
% 1) wartosc funckji dla ostatniego przyblizenia jest blizej 0 niz eps
% 2) dwa ostatnie przyblizenia sa blizej siebie niz eps
% 3) przekroczono podana maksymalna liczbe iteracji
while (abs(fx_2) > eps & abs(x_1 - x_2) > eps & r <= n)
    % wyznaczenie potrzebnych wartosci do wyliczenia nastepnego przyblizenia
    w = fc12 + fc02 - fc01;
    fc012 = (fc12 - fc01)/(x_2 - x_0);
    p = w.*w - 4*fx_2 * fc012;
    r = r+1;
    
    % zapewnienie przeciecia osi OX przez parabole
    if (p <= 0)
        error('blad - delta niedodatnia, parabola nie ma miejsca zerowego pojedynczego');
    end
    
    % wybranie nowego przyblizenia jak najblizej poprzedniego
    sqrtp = sqrt(p);
    x_3a = x_2 - 2.*fx_2 ./ (w + sqrtp);
    x_3b = x_2 - 2.*fx_2 ./ (w - sqrtp);
    if (abs(x_3a - x_2) < abs(x_3b - x_2))
        x_3 = x_3a;
    else
        x_3 = x_3b;
    end
    
    % przepisanie nowych wartosci
    x_0 = x_1;
    x_1 = x_2;
    x_2 = x_3;
    fx_0 = fx_1;
    fx_1 = fx_2;
    fx_2 = f(x_2);
    fc01 = fc12;
    fc12 = (fx_2 - fx_1)/(x_2 - x_1);
    fc02 = (fx_2 - fx_0)/(x_2 - x_0);
end

if r > n
    error('przekroczono limit iteracji');
end

x = x_2;

end