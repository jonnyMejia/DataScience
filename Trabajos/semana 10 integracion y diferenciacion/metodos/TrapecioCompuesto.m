%METOD DEL TRAPECIO COMPUESTO
% una forma de mejorar la precision de la regla del trapecio 
% consiste en dividir el intervalo lo de integracion de a a b
% en varios segmentos. Las areas de los segmentos se suman
% despues para obtener la integral en todo el intervalo.
% Hay n+1 puntos igualmente espaciados. 
% En consecuencia, existen n segmentos del mismo ancho(h)
%DATOS DE INGRESO
%   -funcion es la funcion de integración
%   -b Limite superior de la integracion
%   -a Limite superio de la integral
%   -n numero de segmentos igualmente espaciados
%RESULTADOS
%    -f la integral
function TrapecioCompuesto 
  fprintf('\t\tTRAPECIO COMPUESTO\n\n')
  funcion=input('ingrese la funcion  f(x)= ','s');
  b=input('ingrese el limite superior de la integral: ');
  a=input('ingrese el limite inferior de la integral: ');
  n=input('ingrese el numero de intervalos: ');
  h=(b-a)/n;
  f=0;
  for k=1:n-1
    x=a+h*k;
    f=f+eval(funcion);
  end
  f=2*f;
  x=a; 
  f=f+eval(funcion); 
  x=b; f=f+eval(funcion);
  f=(h/2)*(f);
  fprintf('El valor aproximado es: %10.15f\n\n',f)
endfunction
