
% f es el integrando
% a representa alpha_n y b representa a beta_n
% en la relacion de recurrencia a tres terminos,
% n es el numero de nodos y b0 es el valor de gamma_0
% p nos da los pesos y nd los nodos.
% r nos da el valor de la integral
function r=gaussianas(f,a,b,n,b0)
in=(1:n-1); in1=[0,in];
alfas=feval(a,in1);
betas=sqrt(feval(b,in));
ma=diag(alfas)+diag(betas,1)+diag(betas, -1);
% ma es la matriz de Jacobi simetrica
[v,d]=eig(ma);
nd=diag(d);
p=v(1,:).^2*b0;
ev=feval(f,nd);
r=p*ev;
endfunction