function aproximacion_lagrange(vector_valores_x,vector_valores_fx, valor_buscado_x,f_valor_real)
clc
    %                  Metodo Aproximacion de lagrange
    %
    %   En el Presente algoritmo utilizara a partir par ordenado de datos (xi,f(xi))                    
    %   el cual i viene pertenece al intervalo [1,n]; este conjunto de pares ordenados  
    %   es la tabla que evaluamos para poder generar un sistema de ecuaciones lineales
    %   y a apartir de este serie de pares obtener el polinomio que vendra a la funcion
    %   aproximada, y a partir de dicha funcion con un valor a evaluar se obtiene  el
    %   valor interpolado, y con el valor real de dato se calcula el error.
    %
    %   Datos: 
    %          
    %       vector_valores_x:  fila de valores de x
    %       vector_valores_fx: fila de valores de fx
    %       valor_buscado_x: valor que se evalua en la funcion aproximada
    %       f_valor_real: valor real fx para el valor que se evaluara.
    
    funcion_aproximada=zeros(1,size(vector_valores_x,1));
    for i=1:size(vector_valores_x,1)
        funcion_aproximada=funcion_aproximada+vector_valores_fx(i)*hallar_coeficiente_lagrange(i,vector_valores_x(i),vector_valores_x);
    end

    fprintf("El polinomio aproximado es: ");
    polinomio = "";
    valor_fx_aproximado=0;
    
    for i = 1:size(vector_valores_x,1)
        if(i~=size(vector_valores_x,1))
            polinomio = polinomio + funcion_aproximada(i)+".*x"+".^"+(size(vector_valores_x,1)-i)+" + ";
        else
            polinomio = polinomio + funcion_aproximada(i)+".*x"+".^"+(size(vector_valores_x,1)-i);
        end
        
        valor_fx_aproximado = valor_fx_aproximado+ funcion_aproximada(i)*power(valor_buscado_x,(size(vector_valores_x,1)-i));
    end
    fprintf(polinomio+"\n");
        
    fprintf("Reemplazando el dato %d en el polinomio da como resultado: %f\n",valor_buscado_x,valor_fx_aproximado);
    
    obtener_los_tres_tipos_de_errores("x",valor_fx_aproximado,f_valor_real);

    
end