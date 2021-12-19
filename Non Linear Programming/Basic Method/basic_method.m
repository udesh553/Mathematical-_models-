 
 
function [k]=basic_method()
a=0;
b=3;

delta1=0.1;
delta=b-a;
n=0;


##f=@(x)3*x;

##p=[0,0]; 

disp("##-----------------Basic Method----------------##\n\n ")
disp(["    n         XL       XR        delta   "  ])
while delta >=0.1;
  x1=0.5*(a+b-delta1);
  x2=0.5*(a+b+delta1);
  
  if x1>0 && x1<=2; 
f=@(x)3*x;
elseif x1>2 && x1<3;
f=@(x)(20-x)/3;
endif

if x2>0 && x2<=2; 
f=@(x)3*x;
elseif x2>2 && x2<3;
f=@(x)(20-x)/3;
 endif

  
  if f(x1)>f(x2)
    b=x2;
    
   elseif f(x1)<f(x2)
    a=x1;
  else f(x1)==f(x2);
    a=x1;
    b=x2;
   endif
  
  delta=b-a;
  p(n+1)=delta;
  n++;
  
  disp([n,a,b,delta])
  if n==15;
    break
   else 
    continue
  endif
  
  endwhile
   
 
 
 k=p;
 endfunction
 