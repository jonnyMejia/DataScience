function metodo_simpson_compuesto_auto_generado()
    %                       metodo simpson compuesto 2 en 2
    %
    % Mediante este metodo podremos calcular y graficar el area bajo la curva
    % de un polinomio mediante los puntos de x y fx solicitados,
    %
    % entrada:
    %   vector_valores_x: vector de valores de x;
    %   vector_valores_fx: vector de valores de fx;
    %
    % salida:
    %   area: area aproximada del polinomio

    clc; 
    [n,m,vector_valores_x,vector_valores_fx,bandera] = obntenerDatosXConsolaPlusGrado();
    
    if(bandera)
        %Se halla el polinomio a partir de los puntos dados como apoya a la
        %grafica 
        
        %Se crea los simbolos de los coeficientes del polinomio a generar
        
        simbolos = string(zeros(n,1));
        for i =1:n
           simbolos(i)= "a"+(i-1);
        end
        
        disp ("=========Resolucion por minimos cuadrados=========");
        
        %se obtiene las sumatorias
        vector_sumatorias_potencias_x=zeros((n-1).*2+1,1);
        
        for i=1:size(vector_sumatorias_potencias_x,1)
            for j=1:m
                vector_sumatorias_potencias_x(i)=vector_sumatorias_potencias_x(i)+vector_valores_x(j).^(i-1);
            end
        end
        
        vector_sumatoria_fx_product_potencias_x=zeros(n,1);
        
        for i=1:n
            for j=1:m
                vector_sumatoria_fx_product_potencias_x(i)=vector_sumatoria_fx_product_potencias_x(i)+vector_valores_fx(j)*vector_valores_x(j).^(i-1);
            end
        end
        
        %Se declara el sistema de ecuaciones minimos cuadraos
        sistema_de_ecuaciones_de_minimos_cuadrados =string(zeros(n,n));
        polinomio_aproximado =string(zeros(n,1));
    
        %Se halla el sistema de ecuaciones sobre minimos cuadrados
        for i=1:n
            acumulador="";
            for j=1:n
                if(j~=n)
                   acumulador=acumulador+simbolos(j)+".*"+vector_sumatorias_potencias_x((j-1)+(i-1)+1)+"+ ";
                else
                    acumulador=acumulador+simbolos(j)+".*"+vector_sumatorias_potencias_x((j-1)+(i-1)+1);
                end
                sistema_de_ecuaciones_de_minimos_cuadrados(i,j)=vector_sumatorias_potencias_x((j-1)+(i-1)+1);
            end
            polinomio_aproximado(i,1)=acumulador;
        end
        
        
        disp("Sitema de ecuaciones:")
        for i=1:size(polinomio_aproximado)
            fprintf("%s = %f \n",polinomio_aproximado(i),vector_sumatoria_fx_product_potencias_x(i));
        end
        
        vector_resultados_cociente =metodo_de_doolittle_por_matriz(simbolos,sistema_de_ecuaciones_de_minimos_cuadrados, vector_sumatoria_fx_product_potencias_x);
        
        %se declara el polinomio aproximado
        Titulo="Polinomi Hallado: p_"+(size(simbolos,1)-1)+"(x)=";
        
        %Se halla y muestra el polinomio aproximado
        for i=1:size(simbolos,1)
            if(i~=size(simbolos,1))
                Titulo = Titulo +" " +vector_resultados_cociente(i)+"*x^"+(i-1)+" +";
            else
                Titulo = Titulo +" " +vector_resultados_cociente(i)+"*x^"+(i-1);
            end

        end
        %% obtencion de los puntos aproximados a partir de la valor de la distancia fija de los intervalos a obtener (h)
        
        %hallar el valor de h
        [t]=input('Cual es el cantidad de intervalos a obtener(t): ');
        
        %hallar la cantidad de intervalos
        h=(vector_valores_x(size(vector_valores_x,1))-vector_valores_x(1))/t;
        
        %declaracion de los nuevos vector de valores de x y de fx 
        nuevo_vector_valores_x=zeros(t+1,1);
        nuevo_vector_valores_x(1)=vector_valores_x(1);
        nuevo_vector_valores_fx=zeros(t+1,1);
        nuevo_vector_valores_fx(1)=vector_valores_fx(1);
        for i=1:t 
            nuevo_vector_valores_x(i+1)=vector_valores_x(1)+(h*i);
            nuevo_vector_valores_fx(i+1)=resulmetodo_calculo_del_valor_puntual_de_fx_polinomial(vector_resultados_cociente',vector_valores_x(1)+(h*i));
        end 
        
        %% metodo simpson - calculo del area
      
        if(mod(t+1,2)==0)%si la cantidad de puntos ingresados es par
            %Se separa un vector con los dos ultimos para hallar el valor del
            %area con el metodo del trapecio
            vector_valor_x_trapecio=nuevo_vector_valores_x(t:t+1,:);
            vector_valores_fx_trapecio=nuevo_vector_valores_fx(t:t+1,:);
            area_simpson=0;
            area_trapecio = metodo_trapecio(2,vector_valor_x_trapecio,vector_valores_fx_trapecio);
        
            if(t+1>2) 
                %De haber mas de dos puntos se halla el area restante con el
                %metodo de simpson usando los m-1 primeros puntos
                vector_valor_x_simpson=nuevo_vector_valores_x(1:t,:);
                vector_valores_fx_simpson=nuevo_vector_valores_fx(1:t,:);
                area_simpson=metodo_simpson(t,vector_valor_x_simpson,vector_valores_fx_simpson);
            end
        
            %se realiza la suma del area de simpson mas el area del trapecio
            area=area_simpson+area_trapecio;
        else
            %caso contrario se halla el  area con el metodo del trapecio 
            area = metodo_simpson(t+1,nuevo_vector_valores_x,nuevo_vector_valores_fx);
        end
      
        %Se muestra el area calculada
      
        fprintf("El area del polinomio: '%s' mediante el metodo simpson compuesto de grado 2 es = %f, usando %d intervalos\n",Titulo, area,t);
      
        %% Se grafica el polinomio
        
        %primero se define el dominio de x
        dominio_x=vector_valores_x(1):0.001:vector_valores_x(size(vector_valores_x,1));

        %luego se define los puntos de la funcion a partir del dominio de x
        vector_funcional=polyval(fliplr(vector_resultados_cociente),dominio_x);
        
        %se realiza las configuraciones para graficar la funcion
        plot(dominio_x,vector_funcional),title(Titulo),xlabel('x'),ylabel('y'),grid;
        hold on;
        
        %% Se grafica el area bajo la curva
        
        if(mod(t+1,2)==0)%si la cantidad de puntos ingresados es par
            %a partir de los vectores encontrados se grafica el sub-polinomio
            for i = 1:size(vector_valor_x_trapecio,1)-1
                %primero se define el dominio de x
                dominio_x=vector_valor_x_trapecio(i)-0.2*(vector_valor_x_trapecio(i+1)-vector_valor_x_trapecio(i)):0.001:vector_valor_x_trapecio(i+1)+0.2*(vector_valor_x_trapecio(i+1)-vector_valor_x_trapecio(i));
                
                %luego se define los puntos de la funcion a partir del dominio de x
                vector_funcional=polyval(minimos_cuadrados_parametrada(1,2,vector_valor_x_trapecio(i:i+1,:),vector_valores_fx_trapecio(i:i+1,:)),dominio_x);
                
                %se realiza las configuraciones para graficar la funcion
                plot(dominio_x,vector_funcional);
                hold on;
                
            end
        
            if(t+1>2) 
                for i = 1:2:size(vector_valor_x_simpson,1)-2
                    %primero se define el dominio de x
                    dominio_x=vector_valor_x_simpson(i)-0.2*(vector_valor_x_simpson(i+2)-vector_valor_x_simpson(i)):0.001:vector_valor_x_simpson(i+2)+0.2*(vector_valor_x_simpson(i+2)-vector_valor_x_simpson(i));

                    %luego se define los puntos de la funcion a partir del dominio de x
                    vector_funcional=polyval(minimos_cuadrados_parametrada(2,3,vector_valor_x_simpson(i:i+2,:),vector_valores_fx_simpson(i:i+2,:)),dominio_x);

                    %se realiza las configuraciones para graficar la funcion
                    plot(dominio_x,vector_funcional);
                    hold on;
                end
            end

        else
            disp([nuevo_vector_valores_x  nuevo_vector_valores_fx]);
            disp(size(nuevo_vector_valores_x,1));
            for i = 1:2:size(nuevo_vector_valores_x,1)-2
                    %primero se define el dominio de x
                    dominio_x=nuevo_vector_valores_x(i)-0.2*(nuevo_vector_valores_x(i+2)-nuevo_vector_valores_x(i)):0.001:nuevo_vector_valores_x(i+2)+0.2*(nuevo_vector_valores_x(i+2)-nuevo_vector_valores_x(i));

                    %luego se define los puntos de la funcion a partir del dominio de xvector_valores_x,vector_valores_fx,
                    vector_funcional=polyval(minimos_cuadrados_parametrada(2,3,nuevo_vector_valores_x(i:i+2,:),nuevo_vector_valores_fx(i:i+2,:)),dominio_x);

                    %se realiza las configuraciones para graficar la funcion
                    plot(dominio_x,vector_funcional);
                    hold on;
            end
        
        end
    end
end