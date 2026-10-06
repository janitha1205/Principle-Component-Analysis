



function []=pca()
  x=[4, 8, 13, 7, 6, 5, 12;11, 4, 5, 14, 2, 8, 3];
  x1=x(1,:)
  x2=x(2,:)
  [covx12,xm1,xm2]=findcov(x1,x2);
  [covx11,xm1,xm1]=findcov(x1,x1);
  [covx22,xm2,xm2]=findcov(x2,x2);
  covm=[covx11, covx12;covx12,covx22]
  [V,D]=eig(covm)
  mverify=covm*V-V*D% very close to zero
  val=[]
  for i=1:size(x,1)%row: 1, column: 2
    val=[val,D(i,i)]
  endfor
  [value,index]=max(val)
  vect_lag_eigen_valve=[];
  for k =1:size(x,1)
     vect_lag_eigen_valve=[vect_lag_eigen_valve,V(index,k)];
  endfor
  vect_lag_eigen_valve%vector belogs to largest eigen valve
  P1=[]
  for k=1:size(x,2)
    val=vect_lag_eigen_valve*[x(1,k)-xm1;x(2,k)-xm2]
    P1=[P1,val]
  endfor





endfunction

function [covx,xm1,xm2]=findcov(x1,x2)
   covx=0;
   xm1=mean(x1);
   xm2=mean(x2);
   for i=1:length(x1)
     covx+=(1/(length(x1)-1))*(x1(i)-xm1)*(x2(i)-xm2);
   endfor

endfunction
