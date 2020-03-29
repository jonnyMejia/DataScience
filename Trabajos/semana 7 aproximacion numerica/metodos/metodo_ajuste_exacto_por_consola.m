function [resultado]= metodo_ajuste_exacto_por_consola()
    clc;
    %
    %                  Metodo General aproximacion e interpolacion lineal simple
    %
    %   En el Presente algoritmo utilizara una tabla de de puntos, que contienen los 
    %   valores de x y fx; dicha tabla se evalua para poder generar un sistema de 
    %   ecuaciones lineales y a partir de la matriz se obtiene los coeficientes del 
    %   polinomio aproximado, es decir hallar la funcion aproximada, y a partir de dicha
    %   funcion con un valor a evaluar se obtiene  el valor interpolado, y con el valor 
    %   real de dato se calcula el error.
    %   
    %   Datos a necesitar: 
    %       
    %       Tabla de puntos con los valores de s y fx
    %       simbolos:  los coeficientes 
    %       valor_buscado_x: valor que se evalua en la funcion aproximada
    %       f_valor_real: valor real fx para el valor que se evaluara.                 
    %
    
    
    %   Se obtiene los valores de la tabla
    [n,vector_valores_x,vector_valores_fx, valor_x_buscado,valor_real,bandera] = obntenerDatosXConsola();
    
    if(bandera)
        %Declaracion de los coeficientes del sistema de ecuaciones lineales
        simbolos = string(zeros(n,1));
        for i =1:n+1
           simbolos(i)= "a"+(i-1);
        end

        disp ("=========Resolucion por el metodo de ajuste exacto=========");
        fprintf("\n");
        
        %Se declara el sistema de ecuacion lineal
        sistema_de_ecuaciones =string(zeros(size(simbolos,1),1));
        
        %Se genere el sistema de ecuaciones lineales
        for i=1:size(simbolos,1)
            acumulador="";
            for j=1:size(simbolos,1)
                if(j~=size(simbolos,1))
                   acumulador=acumulador+simbolos(j)+".*"+power(vector_valores_x(i),j-1)+"+ "; 
                else
                    acumulador=acumulador+simbolos(j)+".*"+power(vector_valores_x(i),j-1);
                end
            end
            sistema_de_ecuaciones(i,1)=acumulador;
        end

        %Se usa el metodo de dolittle para obtener los resultados de los coeficientes del polinomio aproximado
        vector_resultados_cociente =metodo_de_doolittle(simbolos,sistema_de_ecuaciones, vector_valores_fx);
        
        %Se muestra el polinomio hallado
        fprintf("\npolinomio hallado:\n==================\n")
        fprintf("p%d(x)=",size(simbolos,1)-1);

        for i=1:size(simbolos,1)
            if(i~=size(simbolos,1))
                fprintf(" %s.*x.^ %d +",simbolos(i),i-1);
            else
                fprintf(" %s.*x.^ %d \n",simbolos(i),i-1);
            end

        end
        
        %Se halla el valor interpolado a partir del valor de x solicitado
        resultado=0;
        
        for i=1:size(simbolos,1)
            resultado=resultado+power(valor_x_buscado,i-1)*vector_resultados_cociente(i);
        end

        %Se halla el error del valor interpolado con el valor real solicitado
        fprintf("\nResultado para x=%f, f(%f)=%f\n\n",valor_x_buscado,valor_x_buscado,resultado);
        obtener_los_tres_tipos_de_errores("x",resultado,valor_real);

    end
end