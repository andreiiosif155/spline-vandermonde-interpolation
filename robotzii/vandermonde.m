function coef = vandermonde(x, y)
    n = length(x); % numar de puncte
    A = ones(n,n); % Initializam atricea sistemului

    % Construim matricea sistemului
    % Fiecare coloana j reprezinta exponentii lui x la puterea j-1
    % A(i, j) = x(i)^(j-1)
    for j = 2:n 
        A(:, j)=x.^(j-1); % Completam coloana j 
    end

    coef = A \ y;
end
