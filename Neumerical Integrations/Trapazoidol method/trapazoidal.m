 function area = trapazoidal( f, a, b, n )
 h = (b-a)/(n);               
x = a:h:b;                     
y = f(x);                    
i = 0:n;
coif = 2*(1).^(i+1);       
coif(1)=1; coif(end)=1; 
area = h/2 * sum(coif.*y)
 endfunction
 