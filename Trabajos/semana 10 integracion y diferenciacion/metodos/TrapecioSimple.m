%METOD DEL TRAPECIO SIMPLE
% la regla del trapecio es la primera de las FORMULAS CERRADAS DE NEWTON COOTES
% Geometricamente es equivalente a aproximar el area del trapecio bajo la linea
% que une funcio(a) y funcion(b)
%
%DATOS DE INGRESO
%   -funcion es la funcion de integración
%   -b Limite superior de la integracion
%   -a Limite superio de la integral
%RESULTADOS
%    -f la integral
function TrapecioSimple 

  fprintf('\t\tTRAPECIO SIMPLE\n\n')
  funcion=input('ingrese la funcion  f(x)= ','s');
  b=input('ingrese el limite superior de la integral: ');
  a=input('ingrese el limite inferior de la integral: ');
  h=b-a;
  x=a;
  f=eval(funcion); 
  x=b;
  f=(f+eval(funcion))*(h/2);
  fprintf('El valor aproximado es: %10.15f\n\n',f)
endfunction
