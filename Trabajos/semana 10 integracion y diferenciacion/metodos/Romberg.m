%METOD0 DE ROMBERG
% El método de extrapolación de Richardson 
% combina dos aproximaciones de integración numérica, 
% para obtener un tercer valor más exacto.
% El algoritmo más eficiente dentro de éste método,
% se llama Integración de Romberg, la cual es una
% fórmula recursiva.

%DATOS DE INGRESO
%   -funcion es la funcion de integración
%   -b Limite superior de la integracion
%   -a Limite superio de la integral
%   -n numero de segmentos igualmente espaciados
%RESULTADOS
%    -R la aproximacion de  la integral buscada

function Romberg 
  fprintf('\t\tINTEGRACION DE ROMBERG\n\n')
  funcion=input('ingrese la funcion  f(x)=','s');
  b= input('ingrese el limite superior de la integral: ');
  a= input('ingrese el limite inferior de la integral: ');
  n= input('ingrese el numero de intervalos: ');
  h=(b-a);
  M=1;
  J=0;
  R=zeros(n,n);
  x=a;
  f1=eval(funcion);
  x=b;
  f2=eval(funcion);
  R(1,1)=h*(f1+f2)/2;
  while (J<(n-1))
    J=J+1;
    h=h/2;
    s=0;
    for p=1:M
      x=a+h*(2*p-1);
      f3=eval(funcion);
      s=s+f3;
    end
    R(J+1,1)=(1/2)*(R(J,1))+h*s;
    M=2*M;
    for k =1:J
      R(J+1,k+1)=R(J+1,k)+(R(J+1,k)-R(J,k))/(4^k-1);
    end
  end
  R
  fprintf('La aproximacion buscada es: %10.15f\n\n', R(J+1,J+1))
endfunction
