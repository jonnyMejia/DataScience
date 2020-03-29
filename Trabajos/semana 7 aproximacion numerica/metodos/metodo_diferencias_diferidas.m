function [resultado]= metodo_diferencias_diferidas()
    clc;
    %                 metodos de diferencias divididas 
    %
    %   En el Presente algoritmo utilizara a partir par ordenado de datos (xi,f(xi))                    
    %   el cual i viene pertenece al intervalo [1,n]; este conjunto de pares ordenados  
    %   es la tabla que evaluamos para poder generar un sistema de ecuaciones lineales
    %   y a apartir de este serie de pares obtener el polinomio que vendra a la funcion
    %   aproximada, y a partir de dicha funcion con un valor a evaluar se obtiene  el
    %   valor interpolado, y con el valor real de dato se calcula el error.
    %
    %   Datos a necesitar: 
    %          
    %       vector_valores_x:  fila de valores de x
    %       vector_valores_fx: fila de valores de fx
    %       simbolos:  los coeficientes 
    %       valor_buscado_x: valor que se evalua en la funcion aproximada
    %       f_valor_real: valor real fx para el valor que se evaluara.   
    
    %   aqui se obtiene los valores de la tabla
    [n,vector_valores_x,vector_valores_fx, valor_x_buscado,valor_real,bandera] = obntenerDatosXConsola();
    
    if(bandera)
        simbolos = string(zeros(n,1));
        for i =1:n+1
           simbolos(i)= "a"+(i-1);
        end

        disp ("=========Resolucion por el metodo de ajuste exacto=========");
        fprintf("\n");

        vector_polinomios =string(zeros(size(simbolos,1),1));

        for i=1:size(simbolos,1)
            acumulador="";
            for j=1:size(simbolos,1)
                if(j~=size(simbolos,1))
                   acumulador=acumulador+simbolos(j)+".*"+power(vector_valores_x(i),j-1)+"+ "; 
                else
                    acumulador=acumulador+simbolos(j)+".*"+power(vector_valores_x(i),j-1);
                end
            end
            vector_polinomios(i,1)=acumulador;
        end

        vector_resultados_cociente =metodo_de_doolittle(simbolos,vector_polinomios, vector_valores_fx);

        fprintf("\npolinomio hallado:\n==================\n")

        fprintf("p%d(x)=",size(simbolos,1)-1);

        for i=1:size(simbolos,1)
            if(i~=size(simbolos,1))
                fprintf(" %s.*x.^ %d +",simbolos(i),i-1);
            else
                fprintf(" %s.*x.^ %d \n",simbolos(i),i-1);
            end

        end

        resultado=0;

        for i=1:size(simbolos,1)
            resultado=resultado+power(valor_x_buscado,i-1)*vector_resultados_cociente(i);
        end

        fprintf("\nResultado para x=%f, f(%f)=%f\n\n",valor_x_buscado,valor_x_buscado,resultado);

        obtener_los_tres_tipos_de_errores("x",resultado,valor_real);

    end
end