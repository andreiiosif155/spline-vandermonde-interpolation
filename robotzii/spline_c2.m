function coef = spline_c2 (x, y)

    n = length(x) - 1; % numar de intervale
    A = sparse(4 * n, 4 * n); % matricea sistemului
    s = sparse(4 * n, 1); % vectorul termenilor liberi

    for i = 1:n
        j = 4 * (i - 1) +1; % pozitia lui ai  in vectorul coef
        A(i, j) = 1;
        s(i) = y(i);
    end

    h = x(n + 1) - x(n); % lungimea ultimului interval
    j = 4 * (n - 1);

    for k = 1:4
        A(n + 1, j + k) = h^(k - 1); % valoarea lui s_n-1(xn)
    end

    s(n + 1) = y(n + 1);

    for i = 1:(n - 1)
        k = n + 1 + i;
        h = x(i + 1) - x(i);

        % si(x_i+1)
        j = 4 * (i - 1);
        for l = 1:4
            A(k, j + l) = h^(l - 1);
        end

         % minus s_i+1(x_i+1)
        j = 4 * i + 1;
        A(k, j)=-1;

        s(k) = 0;

    end

    for i = 1:(n - 1)
        k = 2 * n + i;
        h = x(i + 1) - x(i);
        j = 4 * (i - 1);

        % derivata si'(x_i+1) = bi + 2*ci*h + 3*di*h^2
        for l = 2:4
            A(k, j + l) = (l - 1) * (h^(l - 2));
        end

        % minus derivata s_(i+1)'(x_i+1)
        j = 4 * i + 2;
        A(k, j)=-1;
        s(k) = 0;
    end

    for i = 1:(n - 1)

        k = 3 * n -1 +i;
        h = x(i + 1) - x(i);
        j = 4 * (i - 1) + 3;
    
        % si''(x_i+1) = 2*ci +6*di*h
        A(k, j) = 2;
        A(k, j + 1) = 6 * h;

        % minus s_(i+1)''(x_i+1)
        A(k, j + 4)= -2;

        s(k) = 0;
    end

    A(4 * n - 1, 3) = 2;
    s(4 * n - 1) = 0;

    h = x(n + 1) - x(n);
    A(4 * n, 4 * (n - 1) + 3) = 2;
    A(4 * n, 4 * (n - 1) + 4) = 6 * h;

    s(4 * n) = 0;
    % Solve the system of equations
    coef = A \ s;
end
