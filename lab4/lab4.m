% main script

[x1, t1] = miln(0, 1, 100, 0);   % by the Miln method 

% build exact solution
t2 = 0:0.01:1;   
x2 = 2 * exp(t2) - t2 - 2; 
plot(t1, x1, 'b-.', t2, x2, 'r--')
legend('by Miln method', 'exact solution')
