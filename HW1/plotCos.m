x=-2*pi:0.2:2*pi;
y=cos(x);
plot(x,y);
hold on;
y=ValueOfCosx(x,1);
plot(x,y);
y=ValueOfCosx(x,3);
plot(x,y);
y=ValueOfCosx(x,5);
plot(x,y);
y=ValueOfCosx(x,20);
plot(x,y);

hold off;
figure;
hold on;

val=1;
i=1;
sign=1;

while(i<51)
  sign=sign*(-1);
  newval=val+(sign*(1.5^(i*2))/factorial(i*2));
  err=((newval-val)/newval)*100;
  err=abs(err);
  plot(i,err,'*');
  i+=1;
  val=newval;
end
  

