function aproximacion_lagrange_por_consola()
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
    %   Datos Necesarios: 
    %       n = Grado del polinomio  
    %       Tabla de puntos con los valorews de x y fx
    %       valor_buscado_x: valor que se evalua en la funcion aproximada
    %       f_valor_real: valor real fx para el valor que se evaluara.
    
    %   aqui se obtiene los valores de la tabla
    [n,vector_valores_x,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obntenerDatosXConsola();
    
    %Se verifica que minimo se genere ecuaciones lineales a partir de los datos suministrados
    if(bandera)
        
        %Se declara el vector donde se almacenara la funcion polimial aproximada
        funcion_aproximada=zeros(1,size(vector_valores_x,1));
        
        %Se halla la la funcion polinomial
        for i=1:size(vector_valores_x,1)
            funcion_aproximada=funcion_aproximada+vector_valores_fx(i)*hallar_coeficiente_lagrange(i,vector_valores_x(i),vector_valores_x);
        end

        %Se muestra la funcion polinomial
        fprintf("\nEl polinomio aproximado es: ");
        polinomio = "";
        valor_fx_aproximado=0;

        for i = 1:n
            if(i~=n)
                polinomio = polinomio + funcion_aproximada(i)+".*x"+".^"+(n-i)+" + ";
            else
                polinomio = polinomio + funcion_aproximada(i)+".*x"+".^"+(n-i);
            end
            
            %Se halla el valor interpolado a partir del valor de x solicitado
            valor_fx_aproximado = valor_fx_aproximado+ funcion_aproximada(i)*power(valor_buscado_x,n-i);
        end
        fprintf(polinomio+"\n");

        %Se halla y muestra el error del valor interpolado con respecto al valor real de fx
        fprintf("\nReemplazando el dato '%.0d' en el polinomio de grado %.0d da como resultado: %f\n",valor_buscado_x,n,valor_fx_aproximado);
        obtener_los_tres_tipos_de_errores("x",valor_fx_aproximado,f_valor_real);

    end
end