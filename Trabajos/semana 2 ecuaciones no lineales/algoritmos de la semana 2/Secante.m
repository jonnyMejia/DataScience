function x_k_plus_1=Secante(f,x_k,x_k_minus_1, it, err_limite)
    %                Metodo de la secante
    %
    %   function Secante(f,x_k,x_k_minus_1, it, err_limite)
    %
    %   Debido a que el metodo de Newton Rapshon utiliza una derivada, este
    %   metodo cubre la falencia de utilizarla y la reemplaza por un punto
    %   adicionar para encontrar, a partir de una recta secante, el punto de
    %   iteracion x su i+1,f
    %   Esta funcion necesita los siguientes parametros:
    %       x_k_minus_1: primer valor de x en el instante 0;
    %       x_k: segundo valor de x en el instante 1;
    %       f: funcion que permite hallar los valores posterior de x
    %       it: cantidad de operaciones
    %       err: Limite de error
    bandera_inicial=true;
    contador=0;
    while(true)
        %Se obtiene los valores de los puntos
        x = x_k_minus_1;
        fx0=eval(f);
        x = x_k;
        fx1=eval(f);
        %Se calcula el valor de x_k_plus_1
        x_k_plus_1=x_k - fx1.*(x_k-x_k_minus_1)/(fx1-fx0);

        %Se calcula el valor del error de la iteracion actual:
        if(bandera_inicial)
            error_porcentual = 0;
           %Se muestra la primera parte de la tabla junto con la iteracion 0:
            fprintf("La tabla de iteraciones para la funcion ''%s'' es la siguiente\n",f);
            disp("    N°de Iteracion        Valor de x-1        Valor de x        Valor de x+1        error relativo    \n");
            disp("================================================================================\n");
            fprintf("          %d                   %f                  %f                  %f                %f         \n",contador,x_k_minus_1,x_k,0,error_porcentual);
            bandera_inicial=false;
        else
            % se actualiza el valor error porcentual
            error_porcentual=abs((x_k_plus_1 - x_k)/ x_k_plus_1)*100;
            
            % se muestra el valor del la iteracion actual
            fprintf("          %d                   %f                  %f                  %f                %f         \n",contador,x_k_minus_1,x_k,x_k_plus_1,error_porcentual);
            
            % se actualiza el valor actual y anterior de x
            x_k_minus_1 =x_k; 
            x_k = x_k_plus_1;
        end

        %condicion de salida de la funcion
        if(contador~=0&&(err_limite>error_porcentual||contador>=it))
            break;         
        end

        %Aumento del contador
        contador=contador+1;

    end
end