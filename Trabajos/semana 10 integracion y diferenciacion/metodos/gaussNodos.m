%FUNCION DE APOYO A GaussCuad 
% Calcula abcisas nodales x y pesos A de
% cuadratura del punto n de Gauss-Legendre.
% tol = tolerancia de error (default = 1.0e4*eps).
function [x,A] = gaussNodos (n,tol)

  if nargin < 2; 
    tol = 1.0e4*eps; 
  end
  A = zeros(n,1); 
  x = zeros(n,1);
  nRoots = fix(n + 1)/2; % Número de raíces no-neg.
  for i = 1:n
    t = cos(pi*(i - 0.25)/(n + 0.5)); % raíces aproximadas
    for j = i:30 
      [p,dp] = Leg(t,n); % método de Newton
      dt = -p/dp; 
      t = t + dt; % búsqueda de raíz
      if abs(dt) < tol 
        x(i) = t; 
        x(n-i+1) = -t;
        A(i) = 2/(1-t^2)/dp^2; 
        A(n-i+1) = A(i);
      end
    end
  end
endfunction
