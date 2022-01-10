function golden(a,b)
##warning('off','all'); ##miss warnings 
 

delta=b-a;
n=0;


##f=@(x)3*x;

 disp("##-----------------Golden Method----------------##\n\n ")
 disp(["    n         XL       XR        delta   "  ])
while delta >0.1;
  x1=b-((sqrt(5)-1)/2)*(b-a);
  x2=a+((sqrt(5)-1)/2)*(b-a);
  
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
  
  new_del=b-a;
  
  delta=new_del;
  n++;
  p(n)=delta;
  disp([n,a,b,delta])
  
endwhile

endfunction