%                Funcion newton rhapson modificado 'sucesivo'
%   El metodo de newton raphson modificado cubre una 'falencia' que posee
%   el metodo de newton raphson multivariable, es decir no necesita obtener
%   el jacobiano extendido y obtener de la seccion de coeficientes su forma
%   identidad para luego extraer la columna h_p; sino trata cada ecuacion
%   como si se realizara el metodo de newton raphson prara ecuaciones no
%   lineales, solo que no realiza derivada cotidicana, sino una derivada
%   parcial para la primera variable y asi sucesivamente para las demas
%   variables en conjunto a su respectiva ecuacion de turno.
%
%   newton_raphson_modificado(funcion_f1,funcion_f2,valor_tanteado_x,valor_tanteado_y,margen_error,cantidad_iteraciones)
%   
%   funcion_f1: primera funcion del sistema de ecuacion no lineal
%   funcion_f2: segunda funcion del sistema de ecuacion no lineal
%   valor_tanteado_x: es el valor incial para x
%   valor_tanteado_y: es el valor incial para y
%   margen_error: es el margen de error limite para la funcion
%   cantidad_iteraciones:  cuantas iteraciones debe tener

function newton_raphson_modificado(funcion_f1,funcion_f2,valor_tanteado_x,valor_tanteado_y,margen_error,cantidad_iteraciones)

    %Se inicializa los valores presentes y futuros de 'x' y 'y', asi como el contador, margen de error y una bandera (tipo booleano)
    contador=0;
    bandera_inicial=true;
    x_k=valor_tanteado_x;
    y_k=valor_tanteado_y;
    x_k_plus_1=0;
    y_k_plus_1=0;
    error_porcentual=0;
    
    %Bucle de las iteraciones
    while(true)
        if(bandera_inicial)
            %Se coloca el encabezado de la tabla de iteraciones
            fprintf("Las iteraciondes de la funciones %s y %s se muestran en la siguiente tabla: \n\n",funcion_f1,funcion_f2);
            disp("    N° de Iteracion        Valor de x_k       Valor de x_k_plus_1        Valor de y_k        Valor de y_k_plus_1        Error Porcentual(%)    ");
            disp("============================================================================================================================================");
            fprintf("         %d                  %f                  %f                  %f                  %f                  %f         \n",contador,x_k,x_k_plus_1,y_k,y_k_plus_1,error_porcentual);
            bandera_inicial=false;
        else
            %Se calcula el valor de las derivadas parciales
            syms x y
            %se las derivada parcial de 'x' y 'y' para las ecuaciones 1 y 2 respectivamente.
                                   
            dfx=diff(str2sym(funcion_f1),x);
            dfy=diff((str2sym(funcion_f2)),y);

            x = x_k;
            y = y_k;
            
                                    
            fx = eval(funcion_f1);
            %fy = eval(funcion_f2);
            
            dx = eval(dfx);
            %dy= eval(dfy);
                     
            %Se calcula los valores iniciales de x_k_plus_1 y y_k_plus_1
            x_k_plus_1=x_k-(fx/dx);
            
            x = x_k_plus_1;
            y = y_k;
            fy = eval(funcion_f2);
            dy= eval(dfy);

            y_k_plus_1=y_k-(fy/dy);

            %Se calcula el error porcentual
            error_porcentual=sqrt(power((x_k_plus_1-x_k),2)+power((y_k_plus_1-y_k),2))/sqrt(power(x_k_plus_1,2)+power(y_k_plus_1,2))*100;

            %la iteracion actual
            fprintf("         %d                  %f                  %f                  %f                  %f                  %f         \n",contador,x_k,x_k_plus_1,y_k,y_k_plus_1,error_porcentual);


            %en caso de no cumplirse alguna restriccion, se termina la iteración
            if(cantidad_iteraciones<=contador||margen_error>error_porcentual)
                break;
            end

            %Se actualiza los valores pasados de 'x' y 'y' con los alores actuales de llos mismos para la siguiente iteracion               
            x_k = x_k_plus_1;
            y_k = y_k_plus_1;
        end
        %se aunmenta el contador
        contador=contador+1;
    end

    
   



end