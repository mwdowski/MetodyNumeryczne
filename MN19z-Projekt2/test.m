% skrypt z testami
% 1. testy w_cz
disp('START TESTOW')

disp('test z sumą liczb naturalncyh:')
w_cz([1, 1, 1, 1, 1], 1)

disp('test z miejscami zerowymi:')
w_cz([0, 0, 0, 0, 1], [cos(pi/5), cos(2*pi/5), cos(3*pi/5), cos(4*pi/5)])

disp('test z większą sumą:')
test_x = [1, 0, -1, 1.3, 0.3, -0.7];
y1 = w_cz([2, 1, 3, 7, 4, 2, 0, 6, 9], test_x);
y2 = polyval([2304, 768, -4032, -1088, 2224, 472, -396, -62, 12], test_x);
y1-y2

eps = [10e-6, 10e-7, 10e-8, 10e-9, 10e-10, 10e-11, 10e-12, 10e-13, 10e-14, 10e-15, 10e-16, 10e-17, 10e-18];
r = zeros(1, 13);
x = zeros(1, 13);

for i=1:13
    [x(i), r(i)] = metoda_parabol(@test_w, -1, 0.1, 1, eps(i), 100);
end

r
x
y = test_w(x)
Wyniki = [eps; r; x; y]'

disp('KONIEC TESTOW')