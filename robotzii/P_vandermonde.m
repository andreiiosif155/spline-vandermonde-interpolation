function y_interp = P_vandermonde (coef, x_interp)
    % P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
    % coef = [a0, a1, a2, ..., an]'
    % y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
    m = length(x_interp); % numarul d epuncte
    n = length(coef); % gradul + 1 (numarul de elemente) al polinomului
    A = ones(m, n); % Initializam matricea sistemului

    % Construim matricea sistemului
    % Fiecare coloana j contine x_interp^(j-1)
    for j = 2:n
        A(:, j) = x_interp.^(j - 1);
    end

    y_interp = A * coef;
end
