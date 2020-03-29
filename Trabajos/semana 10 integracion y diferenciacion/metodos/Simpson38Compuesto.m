%METOD0 DE SIMPSON 3/8 COMPUESTO
% Este tipo de integracion se usa caundo el area debajo de la 
% parabola ya se encuentra dividida en "n" divisiones
% todas de la misma anchura
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

function Simpson38Compuesto 
  fprintf('\t\tFORMULA DE SIMPSON 3/8 COMPUESTO\n\n')
  funcion=input('ingrese la funcion  f(x)= ','s');
  b=input('ingrese el limite superior de la integral: ');
  a=input('ingrese el limite inferior de la integral: ');
  n=input('ingrese el numero de intervalos: ');
  h=(b-a)/(2*n);
  f=0;
  for i=1:n-1
    x=a+h*(2*i);
    f=f+eval(funcion);
  endfor
  f1=0;
  for i=1:n
    x=a+h*(2*i-1);
    f1=f1+eval(funcion);
  endfor
    f=2*f+4*f1;
    f=f+eval(funcion)+eval(funcion);
  %Aproximamos la Integral
  f=(h/3)*f;
  %mostramos en la pantalla(con 3 decimales)
  fprintf('\nAproximacion a la integral= %12.5f \n\n',f);
endfunction
