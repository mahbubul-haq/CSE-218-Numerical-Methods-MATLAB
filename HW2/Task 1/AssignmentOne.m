%%Assignment 1

%%First Task...
FileName = 'train.csv';
TrainData = csvread(FileName,1,0);

x1 = TrainData(:,1);

x2 = TrainData(:,2);
size = TrainData(:,5);
color = TrainData(:,7);

figure
plot1 = scatter(x1,x2,size.*0.1,color,'filled');
plot1_c = colorbar;
colormap('jet');

%%Second Task...

x3=TrainData(:,3);

x4=TrainData(:,4);
x5=TrainData(:,5);
x6=TrainData(:,6);
x7=TrainData(:,7);

Mat=zeros(7,7);
Mat(1,1)=800;
Mat(1,2)=sum(x1);
Mat(2,1)=sum(x1);
Mat(1,3)=sum(x2);
Mat(3,1)=sum(x2);
Mat(1,4)=Mat(4,1)=sum(x3);
Mat(1,5)=Mat(5,1)=sum(x4);
Mat(1,6)=Mat(6,1)=sum(x5);
Mat(1,7)=Mat(7,1)=sum(x6);
Mat(2,2)=sum(x1.*x1);
Mat(3,3)=sum(x2.*x2);
Mat(4,4)=sum(x3.*x3);
Mat(5,5)=sum(x4.*x4);
Mat(6,6)=sum(x5.*x5);
Mat(7,7)=sum(x6.*x6);
Mat(2,3)=Mat(3,2)=sum(x1.*x2);
Mat(2,4)=Mat(4,2)=sum(x3.*x1);
Mat(2,5)=Mat(5,2)=sum(x4.*x1);
Mat(2,6)=Mat(6,2)=sum(x5.*x1);
Mat(2,7)=Mat(7,2)=sum(x6.*x1);
Mat(3,4)=Mat(4,3)=sum(x3.*x2);
Mat(3,5)=Mat(5,3)=sum(x4.*x2);
Mat(3,6)=Mat(6,3)=sum(x5.*x2);
Mat(3,7)=Mat(7,3)=sum(x6.*x2);
Mat(4,5)=Mat(5,4)=sum(x4.*x3);
Mat(4,6)=Mat(6,4)=sum(x5.*x3);
Mat(4,7)=Mat(7,4)=sum(x6.*x3);
Mat(5,6)=Mat(6,5)=sum(x4.*x5);
Mat(5,7)=Mat(7,5)=sum(x4.*x6);
Mat(6,7)=Mat(7,6)=sum(x5.*x6);

Y=zeros(7,1);
Y(1,1)=sum(x7);
Y(2,1)=sum(x7.*x1);
Y(3,1)=sum(x7.*x2);
Y(4,1)=sum(x7.*x3);
Y(5,1)=sum(x7.*x4);
Y(6,1)=sum(x7.*x5);
Y(7,1)=sum(x7.*x6);

inverse=inv(Mat);
A=inverse*Y;
A
  
  
%%Third task...

%%graph for testdata...

FileName1 = 'test.csv';
TestData = csvread(FileName1,1,0);

x11 = TestData(:,1);

x21 = TestData(:,2);
size1 = TestData(:,5);
color1 = TestData(:,7);

figure
plot11 = scatter(x11,x21,size1.*0.05,color1,'filled');
plot11_c = colorbar;
colormap('jet');

%%RMSE values...

x71=TestData(:,7);
x31=TestData(:,3);
x41=TestData(:,4);
x51=TestData(:,5);
x61=TestData(:,6);

%%test....

RMSEtest=0;
sumOfSquare=0;
for i=1:200
  
  sumOfSquare=sumOfSquare+(x71(i)- A(1) -A(2)*x11(i)-A(3)*x21(i)-A(4)*x31(i)-A(5)*x41(i)-A(6)*x51(i)-A(7)*x61(i))*(x71(i)- A(1) -A(2)*x11(i)-A(3)*x21(i)-A(4)*x31(i)-A(5)*x41(i)-A(6)*x51(i)-A(7)*x61(i));
  
endfor

sumOfSquare=sumOfSquare/200;
RMSEtest=sqrt(sumOfSquare);
RMSEtest

%train...

RMSEtrain=0;
sumOfSquare=0;
for i=1:800
  
  sumOfSquare=sumOfSquare+(x7(i)- A(1) -A(2)*x1(i)-A(3)*x2(i)-A(4)*x3(i)-A(5)*x4(i)-A(6)*x5(i)-A(7)*x6(i))*(x7(i)- A(1) -A(2)*x1(i)-A(3)*x2(i)-A(4)*x3(i)-A(5)*x4(i)-A(6)*x5(i)-A(7)*x6(i));
  
endfor

sumOfSquare=sumOfSquare/200;
RMSEtrain=sqrt(sumOfSquare);
RMSEtrain