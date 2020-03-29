%                                   Funcion punto multivariable
%   Aqui ya se empiezan a tratar resolver sistemas de ecuaciones no
%   lineales, por ello el punto fijo evoluciona a punto fijo multivariable
%   para resolver estas necesidades, es parecido a su version anterior solo
%   que una funcion es para la resolucion el valor proximo y siguiente de x 
%   y la otra funcion es para el valor proximo y siguiente de y
%
%   punto_fijo_multivarialble_simultanea(funcion_g1,funcion_g2,valor_tanteado_x,valor_tanteado_y,margen_error,cantidad_iteraciones)
%   funcion_g1: escribir una la funcion g1
%   funcion_g2: escribir una la funcion g2
%   valor_tanteado_x: es el valor incial para x
%   valor_tanteado_y: es el valor incial para y
%   margen_error: es el margen de error limite para la funcion
%   cantidad_iteraciones:  cuantas iteraciones debe tener
%
%   

function punto_fijo_multivariable_simultanea(funcion_g1,funcion_g2,valor_tanteado_x,valor_tanteado_y,margen_error,cantidad_iteraciones);
    %Se inicializa los valores presentes y futuros de 'x' y 'y', asi como el contador, margen de error y una bandera (tipo booleano)
    contador=0;
    bandera_inicial=true;
    x_k=valor_tanteado_x;
    y_k=valor_tanteado_y;
    x_k_plus_1=0;
    y_k_plus_1=0;
    error_porcentual=0;
    
    %Se calcula el criterio de convergencia
    syms x y
    dx_1 = diff(str2sym(funcion_g1),x);
    dx_2 = diff(str2sym(funcion_g2),x);
    dy_1 = diff((str2sym(funcion_g1)),y);
    dy_2 = diff((str2sym(funcion_g2)),y);
    
    x = valor_tanteado_x;
    y = valor_tanteado_y;
    criterio_x = eval(dx_1 +dx_2);
    criterio_y = eval(dy_1 +dy_2);
    if(criterio_x<1&&criterio_y<1)
        %Bucle de las iteraciones
        while(true)
            if(bandera_inicial)
                %Se coloca el encabezado de la tabla de iteraciones
                fprintf("Las iteraciondes de la funciones %s y %s se muestran en la siguiente tabla: \n\n",funcion_g1,funcion_g2);
                disp("    N° de Iteracion        Valor de x_k       Valor de x_k_plus_1        Valor de y_k        Valor de y_k_plus_1        Error Porcentual(%)    ");
                disp("============================================================================================================================================");
                fprintf("         %d                  %f                  %f                  %f                  %f                  %f         \n",contador,x_k,x_k_plus_1,y_k,y_k_plus_1,error_porcentual);
                bandera_inicial=false;
            else
                
                %Se calcula los valores iniciales de x_k_plus_1 y y_k_plus_1
                x=x_k;
                y=y_k;
                x_k_plus_1=eval(funcion_g1);
                y_k_plus_1=eval(funcion_g2);

                %Se calcula el error porcentual
                error_porcentual=sqrt(power((x_k_plus_1-x_k),2)+power((y_k_plus_1-y_k),2))/sqrt(power(x_k_plus_1,2)+power(y_k_plus_1,2))*100;
                
                %la iteracion actual
                fprintf("         %d                  %f                  %f                  %f                  %f                  %f         \n",contador,x_k,x_k_plus_1,y_k,y_k_plus_1,error_porcentual);

                
                %en caso de no cumplirse alguna restriccion, se termina la iteración
                if(cantidad_iteraciones<=contador||margen_error>error_porcentual)
                    break;
                end
                
                %Se actualiza los valores pasados de 'x' y 'y' con los alores actuales de llos mismos para la siguiente iteracion               
                x_k= x_k_plus_1;
                y_k=y_k_plus_1;
            end
            %se aunmenta el contador
            contador=contador+1;
        end
    else
        fprintf("Los criterio de convergencia (%f,%f) son mayores que 1, por ende, con lo valores entregados, la funcion nunca va a poder converger\n",criterio_x,criterio_y);
    end
    
   
end
