z = 0.0316; p = 0.01;
G = tf([1 z],[1 p]);
G = G*tf([1 10*z],[1 10*p]);
G = G*tf([1 100*z],[1 100*p]);G = G*tf([1 1000*z],[1 1000*p]);
bode(G);

grid on
