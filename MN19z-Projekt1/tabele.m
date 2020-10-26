tabela_losowe = [wyniki_losowe(:, 1), wyniki_losowe(:, 5), abs(wyniki_losowe(:, 1) - wyniki_losowe(:, 5))./wyniki_losowe(:, 5), wyniki_losowe(:, 4), wyniki_losowe(:, 6), abs(wyniki_losowe(:, 4) - wyniki_losowe(:, 6))./wyniki_losowe(:, 6), wyniki_losowe(:, 2), wyniki_losowe(:, 3);  ];

tabela_hilbert = [wyniki_hilbert(:, 1), wyniki_hilbert(:, 5), abs(wyniki_hilbert(:, 1) - wyniki_hilbert(:, 5))./wyniki_hilbert(:, 5), wyniki_hilbert(:, 4), wyniki_hilbert(:, 6), abs(wyniki_hilbert(:, 4) - wyniki_hilbert(:, 6))./wyniki_hilbert(:, 6), wyniki_hilbert(:, 2), wyniki_hilbert(:, 3);  ];
tabela_lehmer = [wyniki_lehmer(:, 1), wyniki_lehmer(:, 5), abs(wyniki_lehmer(:, 1) - wyniki_lehmer(:, 5))./wyniki_lehmer(:, 5), wyniki_lehmer(:, 4), wyniki_lehmer(:, 6), abs(wyniki_lehmer(:, 4) - wyniki_lehmer(:, 6))./wyniki_lehmer(:, 6), wyniki_lehmer(:, 2), wyniki_lehmer(:, 3);  ];

matrix2latex([rozmiary', tabela_losowe], "tabela_losowe.tex")
matrix2latex([rozmiary', tabela_hilbert], "tabela_hilbert.tex")
matrix2latex([rozmiary', tabela_lehmer], "tabela_lehmer.tex")