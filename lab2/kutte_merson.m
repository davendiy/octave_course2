function y_array = kutte_merson(funcname, y0, a, b, step, epsilon)
    % Runge-Kutta method for solving linear differential equation
    % y' = f(x, y) on the section [a, b]
    
    % :param funcname: name of matlab function that realises f(x, y)
    % :param y0: y(a)
    % :param a: float number, left side of the section
    % :param b: float number, right side of the section
    % :param step: difference between x_i and x_i+1;
    % :param epsilon: accuracy
    % :return: array of values of y on [a:step:b]
    
    x_array = a:step:b;
    y_array = a:step:b;
    y_array(1) = y0;
    for i = 1 : length(x_array)-1
        tmp_step = step;                % difference for i-th step
        while (1)
            
            % so difficult
            k1 = feval(funcname, x_array(i), y_array(i));
            k2 = feval(funcname, x_array(i) + tmp_step / 3, y_array(i) + (3/2) * k1);
            k3 = feval(funcname, x_array(i) + tmp_step / 3, y_array(i) + (tmp_step / 6) * k1 + (tmp_step / 6) * k2);
            k4 = feval(funcname, x_array(i) + tmp_step / 2, y_array(i) + (tmp_step / 8) * k1 + (3 * tmp_step / 2) * k2);
            k5 = feval(funcname, x_array(i) + tmp_step, y_array(i) + (tmp_step / 2) * k1 - (3 * tmp_step / 2) * k3 + 2 * tmp_step * k4);
            
            approx_y = y_array(i) + (tmp_step / 2) * (k1 - 3*k3 + 4*k4); 
            norm_y = y_array(i) + (tmp_step / 6) * (k1 + 4*k3 + k5);
            r = 0.2 * abs(norm_y - approx_y);
            
            
            % checking accuracy
            if (r >= epsilon) 
                tmp_step = tmp_step / 2;
            else
                % if accuracy is very good we can double the step
                if (r < epsilon / 64)
                    step = step * 2;
                end
                y_array(i+1) = norm_y;
                break
            end
        end
    end
    
                    
                    
                