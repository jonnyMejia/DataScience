function euler()
    %                       metodo euler 
    %
    % Mediante este metodo podremos obtener una funcion a partir de su derivada y
    % un punto inicial (x0,y0), teniendo como grado de exactitud de
    % aproximacion de primer grado.
    %
    % entrada:
    %  valor_x_inicial: valor inicial x0;
    %  valor_fx_inical: valor inicial fx0;
    %  dfx: derivada de la funcion 
    % salida:
    %   fx: funcion polinomial aproximada
    
    %%obtencion de datos inciales
    clc; 
    fprintf('\n \tRESOLUCION DE ECUACIONES DIFERENCIALES POR MEDIO METODO DE EULER\n')
    f=input('\nIngrese la ecuacion diferencial de la forma: dy/dx=f(x,y):','s');
    x0=input('\nIngrese el primer punto x0:');
    x1=input('\nIngrese el segundo punto x1:');
    y0=input('\nIngrese la condicion inicial y(x0):');
    n=input('\nIngrese el numero de pasos n:');
    h=(x1-x0)/n;
    xs=x0:h:x1;
    y1=y0;
    fprintf('\niteracion\t\t x0\t\t   x1\t\t y1');
    for i=1:n
        it=i-1;
        x0=xs(i);
        syms x; syms y;
        x=x0;
        x1=xs(i+1);
        y=y0;
        dy=eval(f);
        y1=y0+h*dy;
        fprintf('\n\t%2.0f\t\t%10.6f%10.6f%10.6f\n',it+1,x0,x1,y1);
        y0=y1;
    end
    fprintf('\n El punto aproximado y(x%i) es = %10.6f\n',n,y1);
end