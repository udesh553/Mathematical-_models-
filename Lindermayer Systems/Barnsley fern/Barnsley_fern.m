function Barnsley_fern(k0,n,alpha,delta);
 

##-------------- Barnsley fern---------------------------##  

## Created  by Udesh Senevirathne
## Function for Barnsley fern  using lindmayer systems
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
## tree plot 

##-------------------------------------------------------------------------------##
##k0="X";        
pF="FF";
##alpha=pi/3;
##delta=(25/180)*pi;

pG="GG";      ##change of G
PX="F+[[X]-X]-F[-FX]+X";   ##change of X
Pplus="+";   ##change of +
Pminus="-";  ##change of -
d=2.5;




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
        elseif k00(j)=="X" 
          ##replace PX 
          k(q+1:q+length(PX))=PX;
          q+=length(PX);
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
z=0;
p=[[x,y,z]]; ##make change in z when use 

saves=[[0,0,0,0]];

  for i=1:length(k)
   
    if k(i)=="F"
      x=x+(d*(cos(alpha)));
      y=y+(d*(sin(alpha)));
       z=z+(d*(cos(alpha+3*pi/2)));
      p=[p;[x,y,z]];
    elseif k(i)=="G"
      x=x+(d*(cos(-alpha)));
      y=y+(d*(sin(-alpha)));
      z=z+(d*(cos(-alpha+3*pi/2)));
      p=[p;[x,y,z]];
    elseif k(i)== "+"
     alpha=alpha+delta;
   elseif k(i)=="-"  
     alpha=alpha-delta;  
   elseif k(i)=="["
      saves=[saves;[x,y,z,alpha]];
       
   elseif k(i)=="]"
       x=saves(end,1);
       y=saves(end,2);
       z=saves(end,3);
       alpha=saves(end,4);
       p=[p;[x,y,z]];
       
       saves(end,:)=[];
       
   elseif k(i)=="X"  ##not update 
     continue 
    else    ##not updated
      continue
    endif
  
  endfor 
p;



plot(p(:,1),p(:,2),"-r")
##chngX=((max(p(:,1))-min(p(:,1)))/4);
##chngY=((max(p(:,2))-min(p(:,2)))/4);
##
##xlim([(min(p(:,1)))+1-chngX ,max(p(:,1))+chngX])
##ylim([min(p(:,2))-chngY ,max(p(:,2))+chngY])

endfunction