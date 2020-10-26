disp("start")

rozmiary = [5, 10, 15, 20, 25, 30, 50, 75, 100, 150, 200, 250, 300, 400, 500, 600, 700, 800, 900, 1000];
n = length(rozmiary);

wyniki_losowe = zeros(20, 6);
wyniki_hilbert = zeros(20, 6);
wyniki_lehmer = zeros(20, 6);

for i=1:n
    disp(i)
    A = rand(rozmiary(i), rozmiary(i));
    B = hilb(rozmiary(i));
    C = gallery('lehmer', rozmiary(i));
    
    % losowe
    tic
    [wyniki_losowe(i, 1), wyniki_losowe(i, 2), wyniki_losowe(i, 3)] = my_cond(A);
    wyniki_losowe(i, 4) = toc;

    tic
    wyniki_losowe(i, 5) = cond(A, 1);
    wyniki_losowe(i, 6) = toc;
    
    % hilbert
    tic
    [wyniki_hilbert(i, 1), wyniki_hilbert(i, 2), wyniki_hilbert(i, 3)] = my_cond(B);
    wyniki_hilbert(i, 4) = toc;

    tic
    wyniki_hilbert(i, 5) = cond(B, 1);
    wyniki_hilbert(i, 6) = toc;
    
    % lehmer
    tic
    [wyniki_lehmer(i, 1), wyniki_lehmer(i, 2), wyniki_lehmer(i, 3)] = my_cond(C);
    wyniki_lehmer(i, 4) = toc;

    tic
    wyniki_lehmer(i, 5) = cond(C, 1);
    wyniki_lehmer(i, 6) = toc;
end

disp("end")