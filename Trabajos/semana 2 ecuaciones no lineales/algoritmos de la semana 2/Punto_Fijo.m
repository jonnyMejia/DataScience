%                                   Funcion punto
%
%   punto_fijo(funcion_g1,funcion_g2,valor_tanteado,margen_error,cantidad_iteraciones)
%   funcion_g1: escribir una la funcion g1
%   funcion_g2: escribir una la funcion g2
%   valor_tanteado: es el valor incial
%   margen_error: es el margen de error limite para la funcion
%   cantidad_iteraciones:  cuantas iteraciones debe tener
%
%   Se guarda en funcion la primera funcion ingresada
%   en x se guarda en el valor tanteado o inicial
%   en x1 se grada en 

function x1=Punto_Fijo(funcion_g1,valor_tanteado,margen_error,cantidad_iteraciones)
    
    %Se inicializa los valores
    x_k=valor_tanteado;
    x1=0;
    contador=0;
    bandera_inicial=true;
    while(true)
        if(bandera_inicial)
            error=abs((x_k-x1)/x_k)*100;
            disp("    Iteracion       Funcion             x[i]             x[i+1]          error      ");
            fprintf("         %d         %s       %f           %f         %f\n", contador,funcion_g1,x_k,x1,error);
            bandera_inicial=false;
        else
            x=x_k;
            x1=eval(funcion_g1);
            error=abs((x_k-x1)/x_k)*100;
            fprintf("         %d         %s       %f           %f         %f\n", contador,funcion_g1,x_k,x1,error);          
            if(contador>=cantidad_iteraciones||error<margen_error)
                break;
            end
            %Se actualiza el valor de x_k_plus
            x_k = x1;
        end
        %Se aunmenta el contador
        contador=contador+1;
    end
end
