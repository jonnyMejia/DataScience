%METOD DEL SIMPSON 1/3 SIMPLE
%   La regla de Simpson 1/3 consiste en la aproximacion del calculo
%   pdel area plana bajo una curva utilizando trapecios curvilineos 
%   apartir una interpolacion con una funcion cuadratica.
%   Simple debido a que utiliza tan solo un polinomio
%   requiere de 3 puntos equiespaciados.
%DATOS DE INGRESO
%   -funcion es la funcion de integración
%   -b Limite superior de la integracion
%   -a Limite superio de la integral
%RESULTADOS
%    -f la integral
function Simpson13Simple
  fprintf('\t\tFORMULA DE SIMPSON SIMPLE\n\n')
  funcion=input('ingrese la funcion  f(x)= ','s');
  b=input('ingrese el limite superior de la funcion: ');
  a=input('ingrese el limite inferior de la integral: ');
  h=(b-a)/2;
  x=a; 
  f=eval(funcion); 
  x=b; 
  f=f+eval(funcion);
  x=a+h; 
  f=f+ 4*(eval(funcion));
  f=(h/3)*f;
  fprintf('El valor aproximado de la integral es: %10.15f\n\n',f)
endfunction
