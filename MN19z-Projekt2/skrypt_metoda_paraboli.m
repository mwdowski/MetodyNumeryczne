x_0 = 0.5;
x_1 = 0.55;
x_2 = 0.6;
fx_0 = testf(x_0);
fx_1 = testf(x_1);
fx_2 = testf(x_2);
fc01 = ( fx_0 - fx_1 )/(x_0 - x_1);
fc12 = ( fx_2 - fx_1 )/(x_2 - x_1);
fc02 = ( fx_2 - fx_0 )/(x_2 - x_0);

eps = 0.00000001;

disp('start')
while (abs(fx_2) > eps & abs(x_1 - x_2) > eps )
    w = fc12 + fc02 - fc01;
    fc012 = (fc12 - fc01)/(x_2 - x_0);
    p = w.*w - 4*fx_2 * fc012;
    if (p <= 0)
        disp('blad - delta ujemna, parabola nie ma miejsca zerowego pojedynczego');
    end
    sqrtp = sqrt(p);
    x_3a = x_2 - 2.*fx_2 ./ (w + sqrtp);
    x_3b = x_2 - 2.*fx_2 ./ (w - sqrtp);
    if (abs(x_3a - x_2) < abs(x_3b - x_2))
        x_3 = x_3a;
    else
        x_3 = x_3b;
    end
    x_0 = x_1;
    x_1 = x_2;
    x_2 = x_3;
    fx_0 = fx_1;
    fx_1 = fx_2;
    fx_2 = testf(x_2);
    fc01 = fc12;
    fc12 = ( fx_2 - fx_1 )/(x_2 - x_1);
    fc02 = ( fx_2 - fx_0 )/(x_2 - x_0);
end

x_3