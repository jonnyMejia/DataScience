%METODo DEL SIMPSON 1/3 COMPUESTO
% De manera completamente analoga a para el metodo de los trapecios
% es posible generalizar el metodo de Simpson 1/3 por medio de la
% division del intervalo dado en otros mas reducidos.
%DATOS DE INGRESO
%   -funcion es la funcion de integración
%   -b Limite superior de la integracion
%   -a Limite superio de la integral
%   -n numero de segmentos igualmente espaciados
%RESULTADOS
%    -f la integral
function Simpson13Compuesto 
  fprintf('\t\tFORMULA DE SIMPSON COMPUESTO\n\n')
  funcion=input('ingrese la funcion  f(x)= ','s');
  b=input('ingrese el limite superior de la integral: ');
  a=input('ingrese el limite inferior de la integral: ');
  n=input('ingrese el numero de intervalos: ');
  h=(b-a)/(2*n);
  f=0;
  for k=1:n-1
    x=a+h*(2*k);
    f=f+eval(funcion);
  end
  f1=0;
  for k=1:n
    x=a+h*(2*k-1);
    f1=f1+eval(funcion);
  end
  f=2*f+4*f1;
  x=a; 
  f=f+eval(funcion);
  x=b; 
  f=f+eval(funcion);
  f=(h/3)*f;
  fprintf('el valor aproximado de la integral es: %10.15f\n\n',f)
endfunction
