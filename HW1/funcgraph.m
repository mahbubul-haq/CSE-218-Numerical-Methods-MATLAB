function val = funcgraph (x)

  val=(x.^1./(1-x.^1)).*sqrt(2*3./(2+x.^1))-0.05;

endfunction
