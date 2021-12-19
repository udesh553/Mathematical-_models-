
function sierpinski_tri(k0,n,alpha,delta=(2*pi)/3)
 
##-------------------------------------------------------------------------------##
## Created  by Udesh Senevirathne
## Function for sierpinski_triangle  using lindmayer systems
##
##inputs
##
## k0-initial input 
## n- number of iterations
## alpha- initial starting angle 
## delta-changing angle 
##
## output 
##
## triangle plot 

##-------------------------------------------------------------------------------##
  

pF="F-G+F+G-F";  ##change of F
pG="GG";      ##change of G
Pplus="+";   ##change of +
Pminus="-";  ##change of -
d=1;




##looping for changing
q=0;
k00=k0;
for i=1:n;
 
  for j =1:length(k00);
    
      if k00(j)=="F";
       ##replace F 
       k(q+1:q+length(pF))=pF;
       q+=length(pF);
       elseif k00(j)=="G";
       ##replace G 
       k(q+1:q+length(pG))=pG;
       q+=length(pG);
      elseif k00(j)=="+" 
         ##replace Pplus 
        k(q+1:q+length(Pplus))=Pplus;
        q+=length(Pplus);
        
        elseif k00(j)=="-" 
          ##replace Pminus 
          k(q+1:q+length(Pminus))=Pminus;
         
          q+=length(Pminus);
       
       else
         k(q+1)=k00(j);
         q+=1;
     endif
      endfor
   q=0;
   k00=k;
   k00;
endfor

 k=k00;
## printf("%s\n",k)

 

 



##drawing part
x=0;
y=0;

p=[[x,y]];

saves=[[0,0,0]];

  for i=1:length(k)
   
    if k(i)=="F"
      x=x+(d*(cos(alpha)));
      y=y+(d*(sin(alpha)));
      p=[p;[x,y]];
    elseif k(i)=="G"
      x=x+(d*(cos(-alpha)));
      y=y+(d*(sin(-alpha)));
      p=[p;[x,y]];
    elseif k(i)== "+"
     alpha=alpha+delta;
   elseif k(i)=="-"  
     alpha=alpha-delta;  
   
    else    ##not updated
    disp("not_updated")
      continue
    endif
  
  endfor 
p;



plot(p(:,1),p(:,2),"-r")

##if want to change the limits
  
chngX=((max(p(:,1))-min(p(:,1)))/4);
chngY=((max(p(:,2))-min(p(:,2)))/4);

xlim([(min(p(:,1)))+1-chngX ,max(p(:,1))+chngX])
ylim([min(p(:,2))-chngY ,max(p(:,2))+chngY])


endfunction

