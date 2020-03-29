%CODIGO PARA RESOLVER ECUACIONES CUADRATICAS Y 
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
input("  ");
d=b^2-4*a*c;
if d>0
    x1=(-b+sqrt(d))/(2*a);
    x2=(-b-sqrt(d))/(2*a);
    disp(' EL valor positivo de la raiz ')
    input("  ");
elseif d==0
    x1=-b/(2*a);
    x2=-b/(2*a);
    disp('La raiz vale 0 ')
    input("  ");
else 
    x1=(-b+i*sqrt(-d))/(2*a);
    x2=(-b-i*sqrt(-d))/(2*a);
    disp(' La raiz es negativa ')
    input("  ");
end
disp('Valores de la ecuación de segundo grado:')
x1 , x2

