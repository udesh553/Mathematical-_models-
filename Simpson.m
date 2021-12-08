function area=Simpson(f,a,b,n)
  h = (b-a)/(2*n);              
x = a:h:b;                     
y = f(x);                    
i = 0:2*n;
coif = 3+(-1).^(i+1);  ##make alternative seris for change coifficients     
coif(1)=1; coif(end)=1; ##make first and last coiffs as 1
area = h/3 * sum(coif.*y);   
 
  endfunction