function [x, t] = miln(a, b, n, x0)
    % Miln method for solving the differential equations
    
    % param a: left bound of solution
    % param b: right bound of solution
    % param n: amount of points
    % param x0: start condition
    h = (b - a) / n;
    x(1) = x0; 
    xp(1) = x(1);
    t = 1:n+1;
    for i = 1:n+1 % create t_i
        t(i) = a + (i-1)*h;
    end
    
    % method Runge-Kutta for the first 4 points
    for i = 2:4
        K1 = g(t(i-1), x(i - 1));
        K2 = g(t(i-1) + h/2, x(i-1) + h/2 * K1);
        K3 = g(t(i-1) + h/2, x(i-1) + h/2 * K2);
        K4 = g(t(i-1) + h, x(i-1) + h * K3);
        
        delta = h/6 * (K1 + 2*K2 + 2*K3 + K4);
        x(i) = x(i-1) + delta;
        xp(i) = x(i);
    end
    
    % Main loop
    for i = 4:n 
        % Adams
        xp(i+1) = x(i-3) + 4*h/3 * (2*g(t(i-2), x(i-2)) - g(t(i-1), ...
            x(i-1)) + g(t(i), x(i)));
        
        % parametr
        m = xp(i+1) + 28/29 * (x(i) - xp(i));
        
        % corrector
        x(i+1) = x(i-1) + h/3 * (g(t(i-1), x(i-1)) + 4*g(t(i), ...
            x(i)) + g(t(i+1), m));
    end
end