function y_array = runge_kutta(funcname, y0, a, b, step)
    % Runge-Kutta method of 4 order for solving linear differential equation
    % y' = f(x, y) on the section [a, b]
    
    % :param funcname: name of matlab function that realises f(x, y)
    % :param y0: y(a)
    % :param a: float number, left side of the section
    % :param b: float number, right side of the section
    % :param step: difference between x_i and x_i+1
    % :return: array of values of y on [a:step:b] 
    x_array = a:step:b;    
    y_array = a:step:b;     
    y_array(1) = y0;
    for i = 1:length(x_array) - 1
        
        % it's just realization of the algorithm from the book 
        % feval calls function `funcname` with given parameters
        k1 = feval(funcname, x_array(i), y_array(i));
        k2 = feval(funcname, x_array(i) + step / 2, y_array(i) + step * k1 / 2);
        k3 = feval(funcname, x_array(i) + step / 2, y_array(i) + step * k2 / 2);
        k4 = feval(funcname, x_array(i) + step / 2, y_array(i) + step * k3 / 2);
        delta = step * (k1 + 2 * k2 + 2 * k3 + k4) / 6;
        y_array(i+1) = y_array(i) + delta;
    end
