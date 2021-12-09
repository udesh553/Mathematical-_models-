function[minTcost,b,c]=leastcost(A,sup,dem)
%input:TransportationcostA,supplysup,
%demanddem
%output:minimumtransportationcost
%minTcost,basicmatrixb,costmatrixc
[m,n]=size(A);
sum=0;
rf=zeros;
cf=zeros;
b=zeros(m,n);
c=zeros(m,n);
for I=1:m
rf(I,1)=0;
for J=1:n
cf(1,J)=0;
end
end
f=m;

d=n;
while 1#f&gt;0&amp;&amp;d&gt;0
min=Inf;
for I=1:m
if rf(I,1)~=1
for J=1:n
if cf(1,J)~=1
if min&gt;A(I,J)
min=A(I,J);
p=I;
q=J;
end
end
end
end
end
if sup(p,1)&lt;dem(1,q)
b(p,q)=1;
c(p,q)=sup(p,1);
disp(c);
sum=sum+A(p,q)*sup(p,1);
x=sprintf('x(%d,%d)=%d',p,q,sup(p,1));
disp(x);
dem(1,q)=dem(1,q)*sup(p,1);
sup(p,1)=0;
disp('sup');
disp(sup);
disp('dem');
disp(dem);
rf(p,1)=1;
f=f-1;
else
if sup(p,1)&gt;dem(1,q)
b(p,q)=1;
c(p,q)=dem(1,q);
disp(c);
sum=sum+A(p,q)*dem(1,q);
x=sprintf('x(%d,%d)=%d',p,q,dem(1,q));
disp(x);
sup(p,1)=sup(p,1)-dem(1,q);
dem(1,q)=0;
disp('sup');
disp(sup);
disp('dem');
disp(dem);
cf(1,q)=1;
d=d-1;
else
if sup(p,1)==dem(1,q)
b(p,q)=1;
c(p,q)=sup(p,1);
disp(c);
sum=sum+A(p,q)*sup(p,1);
x=sprintf('x(%d,%d)=%d',p,q,sup(p,1));
sup(p,1)=0;
dem(1,q)=0;
disp('sup');
disp(sup);
disp('dem');
disp(dem);
disp(x);
rf(p,1)=1;
cf(1,q)=1;
f=f-1;
d=d-1;
end
end
end
end
minTcost=sum;