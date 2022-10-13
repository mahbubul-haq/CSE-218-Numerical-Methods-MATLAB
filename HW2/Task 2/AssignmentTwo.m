FileName='shampoo.csv';
ShampooData=csvread(FileName,1,0);
x=ShampooData(:,1);
y=ShampooData(:,2);
linsx=x;
linsy=y;

%%TASK1..........***************************
plot(x,y,'o');
tempy=y;

j=1;
jj=1;
for i=1:36
  
  if y(i)~=0
    xx(j)=x(i);
    
    yy(j)=y(i);
    
    if i<=10
      xxxx(j)=x(i);
      yyyy(j)=y(i);
    endif
    
    j=j+1;  
    
  else
    missingvalues(jj)=x(i);
    jj=jj+1;
  
endif
  
endfor

%%Lagrange Polinomial Completed...**************************************

printf("Lagrange polynomial missing values: \n");

lax=9:0.01:26;

lsize=size(lax)(2);

for ii=1:lsize
  
  lay(ii)=Lagrange(xx,yy,lax(ii));
  
endfor 

figure;
plot(lax,lay);
hold on;

for i=9:26
  
  if tempy(i)==0
    y(i)=Lagrange(xx,yy,x(i));
    plot(x(i),y(i),'MarkerSize',20);
    printf("%f %f\n",x(i),y(i));
  endif
  
endfor



%%NewtonPolynomial Completed...********************************

printf("Newton polynomial missing values: \n");

b=Newton(xx,yy);

yyy=b(1);
nn=size(xx)(2);
for i=2:nn
  
  value=b(i);
  for k=1:i-1
    value=value.*(xx-xx(k));
  endfor
  yyy=yyy+value;
  
endfor


figure;
hold on;
newxx=9:.01:26;
newn=size(newxx)(2);

for i=1:newn
    temp=b(1);
   for j=2:31
     
     value=b(j);
     for k=1:j-1
       
       value=value.*(newxx(i)-xx(k));
       
     endfor
     
     temp=temp+value;
     
   endfor 
   
   newyy(i)=temp;

endfor
plot(newxx,newyy);

for i=9:26
  if tempy(i)==0
temp=b(1);
for j=2:31
  
  value=b(j);
   for k=1:j-1
    value=value.*(x(i)-xx(k));
  endfor
  temp=temp+value;
  
endfor
printf("%f %f\n",x(i),temp);
plot(x(i),temp,'MarkerSize',20);
endif
endfor


%%%Linear spline Completed.....****************************

j=1;
for i=1:36
  
  if linsy(i)~=0
    linsxx(j)=linsx(i);
    linsyy(j)=linsy(i);
    j=j+1;  
  endif
  
endfor

size1=size(linsxx)(2);

for i=2:size1
  
  slope(i-1)=(linsyy(i)-linsyy(i-1))/(linsxx(i)-linsxx(i-1));
  
endfor

figure;
hold on;

for i=1: size1-1
  
  lx=linsxx(i):.2:linsxx(i+1);
  
  ly=linsyy(i) + slope(i)*(lx - linsxx(i));
  plot(lx,ly);

endfor

count=0;
printf("Linear spline missing values: \n");
for i=1:36
  
  if linsy(i)==0
    
    lly=linsy(i-1)+slope(i-1-count)*(linsx(i)-linsx(i-1));
    count=count+1;
    plot(linsx(i),lly,'MarkerSize',20);
    printf("%f %f\n",linsx(i),lly);
    
  endif
  
endfor

%%Quadratic spline completed....**************************************
printf("Quadratic spline missing values: \n");
x   =   xx;
y   =   yy;
N   =   length(x)-1;

V   =   [0;zeros(2*N,1);zeros(N-1,1)];
Z   =   zeros(length(V),length(V));
j=1;
f=1;
for i=2:2:2*N    
    Z(i,f:f+2)          =   [x(j)^2 x(j) 1];
    V(i)                =   y(j);
    j                   =   j+1;
    Z(i+1,f:f+2)        =   [x(j)^2 x(j) 1];  
    V(i+1)              =   y(j);
    f                   =   f+3;
end



j=1;
l=2;
for i=2*N+2:3*N
    
    Z(i,j:j+1)            =   [2*x(l) 1];
    Z(i,j+3:j+4)          =   [-2*x(l) -1];
    j                     =   j+3;
    l                     =   l+1;
end



Z(1,1)=1;

Coeff       =       Z\V;
j=1;
index=1;
figure;
hold on;
for i=1:N
    curve=@(l) Coeff(j)*l.^2+Coeff(j+1)*l+Coeff(j+2);
    fplot(curve,[x(i),x(i+1)]);
    if(index<=count && missingvalues(index)>=x(i) && missingvalues(index)<=x(i+1))
    missingy=curve(missingvalues(index));
    printf("%f: ",missingvalues(index));
    printf("%f",missingy);
    printf("\n");
    plot(missingvalues(index),missingy,'MarkerSize',20);
    index++;
    end;
    hndl=get(gca,'Children');
    set(hndl,'LineWidth',2);
    hold on;
    j=j+3;
end

xlim([1 36]);











