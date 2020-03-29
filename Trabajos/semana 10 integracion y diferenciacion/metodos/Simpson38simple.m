%METODO DE SIMPSON 3/8
% Determina o aproxima el area bajo una funcion de tercer grado
% que conecta 4 puntos sobre una curva dad una integral cubica
%METODO DE SIMPSON 3/8 SIMPLE
% Debemos dividir el intervalo de la integral en 4 partes
% iguales delimitadas por los limites de la integral que son a y b;
% si estos valores no existen este metodo no podra ser utilizado
% La regla de 3/8 es util cuando el numero de segmentos es impar

%DATOS DE INGRESO
%   -funcion es la funcion de integración
%   -b Limite superior de la integracion
%   -a Limite superio de la integral
%RESULTADOS
%    -f la integral 
function Simpson38simple 
  fprintf('\t\tFORMULA DE LOS TRES OCTAVOS DE SIMPSON\n\n')
  funcion=input('ingrese la funcion f(x)= ','s');
  b=input('ingrese el limite superior de la funcion: ');
  a=input('ingrese el limite inferior de la integral: ');
    
  %hallar h
  % "a" y "b" limites de la integral y "n" sera el
  % numero de divisiones que debe tener el intervalo
  % el cual simpre sera 3
  h=(b-a)/3;
  x=a;
  f=eval(funcion);
  x=a+h; 
  f=f+3*(eval(funcion));
  x=a+2*h; 
  f=f+3*(eval(funcion));
  x=b;
  f=f+eval(funcion);
  f=(3*h/8)*f;
  fprintf('El valor aproximado de la integral es:  %10.15f\n\n',f)
endfunction
