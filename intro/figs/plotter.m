clear all;
close all;
more off;

figure;
hold on;
colors = ["b";"r";"g";"k";"c","m";"y";"r";"r";"r"];
for gen=3:2:9
  gen
  eval(
      sprintf("load tree_gen%d.mat",gen)
    );
  eval(
      sprintf("plot(t,x(:,2^(gen-1)),'%s;generations = %d;',\"linewidth\",2)",colors(gen),gen)
    )
endfor

load tree_lastgen_andfrac.mat;

eval(
    sprintf("plot(t,xlast,'%s;fractional;',\"linewidth\",2)",colors(gen+1))
  )

xlabel("$t$");
ylabel("$x_{last}$");
axis([0 20 0 4]);
figdim = 0.9*[0, 0, 3.04, 2.128];
set (gcf, "paperposition",figdim);
%print("converge.tex","-depslatex","-color");

mytimes = endtime - starttime;

fractionaltimes = ones(1,11)*mytimes(12);

figure;
semilogy(3:9,mytimes(3:9),'-xr;full solution;',"linewidth",2,"markersize",2);
hold on;
semilogy(3:9,fractionaltimes(3:9),'-ob;fractional;',"linewidth",2,"markersize",2);
xlabel("generations");
ylabel("computation time (s)");

axis([2 10 0.1 10000]);

figdim = 0.9*[0, 0, 3.04, 2.128];
set (gcf, "paperposition",figdim);
print("computationtime.tex","-depslatex","-color");


