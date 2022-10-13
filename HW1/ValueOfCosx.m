function y = ValueOfCosx (x,n)
  
  val=1;
  sign=1;
  
  i=1;
  while (i<n)
    sign=sign*(-1);
    val=val+(sign*(x.^(i*2))/factorial(i*2));
    i=i+1;
  end
  
  y=val;

endfunction
