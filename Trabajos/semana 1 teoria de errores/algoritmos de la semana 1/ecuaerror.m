%CODIGO PARA RESOLVER ECUACIONES CUADRATICAS CON CIERTO ERROR
% DATOS DE ENTRADA
%   a:coeficiente cuadratico
%   b:coeficiente lineal
%   c:coeficiente inpendiente
% DATOS DE CALCULO
%   d: discriminante
% DATOS DE SALIDA
%   x1: primera raiz
%   x2: segunda raiz 
clear;
clc;
fprintf("\t\t********SOLUCION DE ECUACIONES CUADRATICAS********\n\n");
a=input('Ingrese el valor de a: ');
b=input('Ingrese el valor de b: ');
c=input('Ingrese el valor de c: ');
e=input('Ingrese el valor deL ERROR: ');
input("  ");
d=b^2-4*a*c;
if d>0
    x1=(-b+sqrt(d))/(2*a);
    x2=(-b-sqrt(d))/(2*a);
    x1error=x1+e;
    x2error=x2+e;
    disp(' EL valor positivo de la raiz ')
   
elseif d==0
    x1=-b/(2*a);
    x2=-b/(2*a);
    disp('La raiz vale 0 ')
    x1error=x1+e;
    x2error=x2+e;
    input("  ");
else 
    x1=(-b+i*sqrt(-d))/(2*a);
    x2=(-b-i*sqrt(-d))/(2*a);
    disp(' La raiz es negativa ')
    x1error=x1+e;
    x2error=x2+e;
end

    disp('Valores de la ecuacion de segundo grado:')
    x1 , x2
    disp('Valores de la ecuacion de segundo grado:')
    x1error , x2error

    
 

