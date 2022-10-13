function  b = Newton (xx, yy)
  n = length(xx);
  vec = zeros(n);
  for i = 2 : n
    vec(i, i-1) = (yy(i) - yy(i-1)) / (xx(i) - xx(i-1));
  end
  
  for i = 2 : n-1
    for j = i+1 : n
      vec(j,j-i) = (vec(j, j-i+1) - vec(j-1,j-i)) / (xx(j) - xx(j-i));
    end
  end
  
  b(1) = yy(1);
  for i = 2 : n
    b(i) = vec(i, 1);
  end

endfunction
