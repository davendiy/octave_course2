tmp = 0;

function y_deriv = variant7(x, y)
  y_deriv = 2 * x * y + x * y ^ 2;
end

function y_array = methodOyler(func, y0, a, b, step)
  % Oyler's method for solving differential equations
  % like y' = f(x, y)   (*)
  
  %:param func: string - name of function that will be used 
  %             instead f(x, y) in (*)
  %:param y0: value of the needed function in a
  %:param a: left boundary of the section
  %:param step: distance between x_i and x_i+1 in the splitting of [a, b]
  %:return y_array: array of the values of the function on [a, b] 
  x_array = [a:step:b];
  y_array = [a:step:b];
  y_array(1) = y0;
  for i = 1 : length(x_array) - 1
    y_array(i+1) = y_array(i) + step * feval(func, y_array(i), x_array(i));
  end  
end


function y_array = methodOylerModified(func, y0, a, b, step)
  % Modified Oyler's method for solving differential equations
  % like y' = f(x, y)   (*)
  
  %:param func: string - name of function that will be used 
  %             instead f(x, y) in (*)
  %:param y0: value of the needed function in a
  %:param a: left boundary of the section
  %:param step: distance between x_i and x_i+1 in the splitting of [a, b]
  %:return y_array: array of the values of the function on [a, b] 
  x_array = [a:step:b];
  y_array = [a:step:b];
  y_array(1) = y0;
  for i = 1 : length(x_array) - 1
    tmp_x = x_array(i) + step/2;
    tmp_y = y_array(i) + step/2 * feval(func, x_array(i), y_array(i));
    y_array(i+1) = y_array(i) + step * feval(func, tmp_x, tmp_y);
  end
  
end

  
function y_array = methodHoin(func, y0, a, b, step)
  % Hoin's method for solving differential equations
  % like y' = f(x, y)   (*)
  
  %:param func: string - name of function that will be used 
  %             instead f(x, y) in (*)
  %:param y0: value of the needed function in a
  %:param a: left boundary of the section
  %:param step: distance between x_i and x_i+1 in the splitting of [a, b]
  %:return y_array: array of the values of the function on [a, b] 
  x_array = [a:step:b];
  y_array = [a:step:b];
  y_array(1) = y0;
  for i = 1 : length(x_array) - 1
    y_array(i+1) = y_array(i) + step/2 *(feval(func, x_array(i), y_array(i)) + feval(func, x_array(i) + step, y_array(i) + step * feval(func, x_array(i), y_array(i))));
  end
  
end
