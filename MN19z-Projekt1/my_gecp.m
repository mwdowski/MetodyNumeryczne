function [L, U, P, Q] = my_gecp(A)
% Funkcja dokonuje rozkladu LU uzywajac metody GECP
% W wyniku otrzymujemy macierze:
% L - trojkatna dolna
% U - trojkatna gorna
% P i Q - macierze permutacji wierszy i kolumn
% wynikowe macierze spelniaja rownanie: P*A*Q = L*U

% znalezienie wymiarow macierzy i zapewnienie, ze A jest kwadratowa
[n, m] = size(A);
if(n ~= m)
    error("Macierz musi byc kwadratowa")
end

% stworzenie wektorow permutacji wierszy i kolumn
p = 1:n;
q = 1:n;

% czesc wlasciwa metody GECP
% petla wykonuje sie dla kazdej podmacierzy A o wymiarach (n-i)x(n-i)
for i=1:(n-1)
    % znalezienie elementu wiodacego - w
    % znalezienie w podmacierzy (n-i)x(n-i) najwiekszego co do modulu elementu
    subA = A(i:n, i:n);
    [w , w_idx] = max(abs(subA(:)));
    
    % znalezienie pozycji elementu wiodacego w macierzy A
    [w_sub_x, w_sub_y] = ind2sub(size(subA), w_idx);
    w_x = w_sub_x + (i-1);
    w_y = w_sub_y + (i-1);
    
    % zamiana kolumn i wierszy
    A( [i, w_x], : ) = A( [w_x, i], : );
    A( :, [i, w_y] ) = A( :, [w_y, i] );
    
    % zapisanie tych zmian w wektorach permutacji
    p([i, w_x]) = p([w_x, i]);
    q([i, w_y]) = q([w_y, i]);
    
    % sprawdzenie czy element wiadacy nie jest zerem
    if A(i,i) == 0
        error("Macierz musi byc nieosobliwa")
    end
    
    % zapisanie wspolczynnikow do L
    k = (i+1):n;
    A(k, i) = A(k, i) / A(i, i);
    
    % operacje wierszowe
    A(k, k) = A(k, k) - A(k, i) * A(i, k);
end

L = tril(A,-1) + eye(n);
U = triu(A);
P = eye(n);
P = P(p, :);
Q = eye(n);
Q = Q(:, q);

end