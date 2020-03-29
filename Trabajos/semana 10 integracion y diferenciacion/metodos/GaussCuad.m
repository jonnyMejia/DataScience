%METODO DE LA CUADRATURA DE GAUSS
% Este metodo se basa en muestrear el integrando de la
% funcion cuya integral se desea encontrar,
% a los valores que representan raices de polinomios 
% ortogonales. lo mas populares de estos son los
% POLINOMIOS DE LEGENDRE.
% Pala lograr el objetivo se hara uso de dos 
% funciones adiciones como apoyo en el calculo
% gaussNodos y este a su vez hace uso de la funcion Leg
  
% Cuadratura de Gauss-Legendre.
  % USAR I = GaussCuad(func,a,b,n)
% Ingreso:
  % func =  function a integrar.
  % a,b = límites de integración.
  % n = orden de integración.
% Salida:
  % I = integral
function I= GaussCuad (func,a,b,n)

  c1 = (b + a)/2; c2 = (b - a)/2; % constants de mapeo 
 [x,A] = gaussNodos(n); % pesos y abcisas nodales
  sum = 0;
  for i = 1:length(x)
    y = feval(func,c1 + c2*x(i)); % Función en nodo i
    sum = sum + A(i)*y;
  end
  I = c2*sum;
endfunction
