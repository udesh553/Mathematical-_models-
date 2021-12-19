clc
clear all
clc
supply=[6;1;10];
demand=[7,5,3,2];

mat=[2,3,1,4;1,0,6,1;5,8,15,9];

##check the banced of the problem

if sum(supply)==sum(demand)
n_mat=[[mat;demand],[supply;sum(supply)]];
else 

disp("this is not a balanced  transportation")
end
n_mat


dem=demand;
sup=supply;
p=mat;

for i=1:size(n_mat,1)-1
  for j=1:size(n_mat,2)-1
    ##get the  minimum
    h=min(p(:))
    [r_ind,c_ind]=find(h==p);
    sizes=size(r_ind);
    
    if (size(r_ind))==[1,1];
      h;
      
##    minn=min(supply(r_ind),demand(c_ind));
##    k(r_ind,c_ind)=minn;
##    supply(r_ind)-=minn;
##    demand(c_ind)-=minn;
  ##  p(r_ind,c_ind)=inf;
    
  ## elseif sizes > [1,1];
  ## disp("##")
##     for i=1:length(r_ind)
##       h=min(p(:));
##      [r_ind,c_ind]=find(h==p);
##      bad=(max(dem(c_ind)));##get the maximum
##      max_r_index=find(bad==dem);## find column index
##      c_ind_pos=find(c_ind==max_r_index); ##get column index
##      ii=r_ind(c_ind_pos);
##     jj=c_ind(c_ind_pos);
##     ##get the minimum of row 2 and column 1
##     nm=min(sup(ii),dem(jj));
##     k(ii,jj)=nm;
##     supply(ii)-=nm;
##     demand(jj)-=nm;
##     p(ii,jj)=inf
     
##   endfor  
   
 endif
  p(r_ind,c_ind)=inf;
  end
  
 
  end