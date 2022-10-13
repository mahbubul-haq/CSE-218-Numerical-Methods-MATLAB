function value = secantValue (func, guessfirst,guesslast,es,maxi)
  
  i=0;
  while(i<maxi)
    guessfirstf=guessfirst;
    guessfirst=guesslast;
    valf=func(guessfirstf);
    valfirst=func(guessfirst);
    guesslast=guessfirst-((guessfirstf-guessfirst)/(valf-valfirst))*valfirst;
    i+=1;
    err=abs(((guesslast-guessfirst)/guesslast)*100);
    if(err<es)
      value=guesslast;
      break end
      
   value=guesslast;
  end
  
  value 
  err
  i

endfunction
