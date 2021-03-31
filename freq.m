w = logspace(-1,6,1000);
s = i*w;
G = 1./(s.^(1/2) + 10);
gh = figure(7,'paperposition',size);
subplot(2,1,1);
semilogx(w,20*log10(abs(G)),'linewidth',2);
ylabel('$\left| G(\iu \omega) \right|$')
grid on;
subplot(2,1,2)
semilogx(w,180*angle(G)/pi,'linewidth',2);
grid on;
xlabel('$\omega$');
ylabel('$\angle G(\iu \omega)$');
print('fracfreqex1.tex','-depslatex');

