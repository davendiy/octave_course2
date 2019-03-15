% main script

% y' = y / (3x - y^2)
% question 7: Does this equation have any bounded solutions on the R?
% answer: y = 0;

A = 1;       % params for variant 7
B = 2;
Y0 = 1;
STEP = 0.001;
EPSILON = 0.00001;

X = A:STEP:B;       % array of x-s

% solve by written functions
Y1 = runge_kutta('lab2_var7_1', Y0, A, B, STEP);
Y2 = kutte_merson('lab2_var7_1', Y0, A, B, STEP, EPSILON);

% solve by built-in functions
[X3, Y3] = ode23(@(x, y) y / (3 * x - y ^ 2), [A, B], Y0);
[X4, Y4] = ode45(@(x, y) y / (3 * x - y ^ 2), [A, B], Y0);

% plotting of all the graphs on 2 different sheets
subplot(2, 1, 1)
plot(X, Y1, 'b-.', X, Y2, 'r--', X, sqrt(X), 'g--');
legend('runge-kutte', 'kutte-merson', 'exact solution')

subplot(2, 1, 2)
plot(X3, Y3, 'b-.', X4, Y4, 'r.', X, sqrt(X), 'g--');
legend('ode23', 'ode45', 'exact solution')
