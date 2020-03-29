function metodo_euler_modificado()
    %                       metodo euler modificado
    %
    % Mediante este metodo podremos obtener una funcion a partir de su derivada y
    % un punto inicial (x0,y0), teniendo como grado de exactitud de
    % aproximacion de cuarto grado debido a que el metodo usa 2 veces la
    % primera derivada para no usar las derivadas de segundo orden.
    %
    % entrada:
    %  valor_x_inicial: valor inicial x0;
    %  valor_fx_inical: valor inicial fx0;
    %  dfx: derivada de la funcion 
    % salida:
    %   fx: funcion polinomial aproximada
    
    %%obtencion de datos inciales
    clc; 
    [derivada,valor_inicial_x,valor_inicial_y,n,h] = obtenerDatosParaEcuacionesDiferenciales();
    
    %%declaracion de datos a manejar
    
    syms y; syms x;
    
    %decalracion del vector de valores aproximados fx y respectivos x
    vector_valores_fx= zeros(n+1,1);
    vector_valores_x= zeros(n+1,1);
    vector_valores_k= zeros(n+1,2);
    
    %declaracion de los valores temporales que apoyan al desarrollo
    vector_valores_x(1)= valor_inicial_x;
    vector_valores_fx(1)= valor_inicial_y;
    
    for i= 1:n+1
       % calculo del k1
       x=vector_valores_x(i);
       y=vector_valores_fx(i);
       k1= eval(derivada);
       
       %calculo del k2
       x=vector_valores_x(i)+h/2;
       y=vector_valores_fx(i)+h*k1;
       k2= eval(derivada);
       
     
       %Se almacena los valores de k
       vector_valores_k(i,:)= [k1,k2];
       
       %calculo del punto aproximado de la funcion 
       if i<n+1
           vector_valores_fx(1+i)= vector_valores_fx(i)+(h/2)*(k1+k2);
           vector_valores_x(1+i)=vector_valores_x(i)+h;
       end
    end
    funcion_aproximada=minimos_cuadrados_parametrada(1,n+1,vector_valores_x,vector_valores_fx);
    
    %Se muestra el procedimiento para obtener la funcion
     for j=1:n
         fprintf("Para la iteracion n°%1.0d\n\n",j);
         fprintf("k1 = f(x%1.0d,y%d) = f(%d,%d) = %d\n",j-1,j-1,vector_valores_x(j),vector_valores_fx(j),vector_valores_k(j,1));
         fprintf("k2 = f(x%1.0d +h,y%1.0d+h*k1) = f(%3.4d+%3.4d,%d+%3.4d*%3.4d) = %3.4d\n\n",j-1,j-1,vector_valores_x(j),h,vector_valores_fx(j),h,vector_valores_k(j,1),vector_valores_k(j,2));
         fprintf("valor de y%1.0d a partir de (yi+1=yi+h/2*(k1+k2)) = %3.4d, con un valor x de %3.4d\n\n",j,vector_valores_fx(j+1),vector_valores_x(j+1));
     end
    
    
    %Se halla y muestra el polinomio aproximado
     Funcion_Aproximada="f(x)=";

        for i=1:size(funcion_aproximada',1)
            if(i~=size(funcion_aproximada',1))
                Funcion_Aproximada = Funcion_Aproximada +" " +funcion_aproximada(i)+"*x^"+(i-1)+" +";
            else
                Funcion_Aproximada = Funcion_Aproximada +" " +funcion_aproximada(i)+"*x^"+(i-1);
            end

        end
    
    
    fprintf("la funcion aproximada es mediante ecuaciones diferenciales %s\n",Funcion_Aproximada);
end