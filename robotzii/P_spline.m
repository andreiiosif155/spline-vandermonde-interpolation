function y_interp = P_spline (coef, x, x_interp)

    n = length(x) - 1; % numarul de intervale
    m = length(x_interp); % numarul de puncte
 
    y_interp = sparse(m, 1); % alocare rezultate

    for i = 1:m

        % 1) gasim intervalul [x_j, x_j+1] in care cade x_interp(i)
        if x_interp(i) <= x(1)
            j = 1; % sub x0 => folosim primul interval
        elseif x_interp(i) >= x(n+1)
            j = n; % peste xn => folosim ultimul interval
        else
            % Cautare lineara a celui mai apropiat punct din stanga
            minim = x_interp(i); % initializam minim ca distanta pana la primul punct
            j = 1;

            % Parcurgem toate punctele 
            for k = 2:n
                dif = x_interp(i) - x(k);
                % daca x(k) este in stanga lui x_interp(i) (dif>=0)
                % si mai apropiat decat punctul curent (dif < minim)
                if dif >= 0 && dif <= minim
                    minim = dif; % actualizam distanta minima
                    j = k; % retinem indexul punctului
                end

            end

        end

        % Calculam distanta
        h = x_interp(i) - x(j);

        % Extragem coeficientii polinomului s_j
        l = 4 * (j - 1);
        a = coef(l + 1);
        b = coef(l + 2);
        c = coef(l + 3);
        d = coef(l + 4);

        % Evaluam polinomul cubic s_j(x_interp(i))
        y_interp(i) = a + b * h + c * h^2 + d * h^3;
    end

end
