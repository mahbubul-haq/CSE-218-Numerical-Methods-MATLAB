function fvalue = falsePositinMethod (func,lowerbound,upperbound,es,maxi)
  
  i=0;
  xrv= 0.5 ;
  fvalue=0;
  while(i<maxi)
    upval=func(upperbound);
    loval=func(lowerbound);
  
    xr=upperbound-(upval*(lowerbound-upperbound)/(loval-upval));
    xrval=func(xr);
    
    if((xrval*loval)==0)
      fvalue=xr;
      break
    end
    
    if((xrval*loval)<0)
      upperbound=xr;
    end
    
    if((xrval*loval)>0)
      lowerbound=xr;
    end
    
    err=abs((xr-xrv)/(xr)*100);
    if(err<es)
      fvalue=xr;
      break
    end
    
    i=i+1;
    fvalue=xr;
    xrv=xr;
  end
  
  fvalue
  err
  i

endfunction
