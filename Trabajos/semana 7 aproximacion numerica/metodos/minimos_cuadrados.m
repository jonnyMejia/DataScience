function minimos_cuadrados()
    clc; 
    [n,m,vector_valores_x,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obntenerDatosXConsolaPlusGrado();
     
     if(bandera)
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
        
        %Se crea el sistema de ecuaciones de minimos cuadrados
        
        sistema_de_ecuaciones_de_minimos_cuadrados =string(zeros(n,n));
        polinomio_aproximado =string(zeros(n,1));

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
        
        disp ("Datos de entrada: ");
        fprintf("\n");
        disp("Sitema de ecuaciones:")
        for i=1:size(polinomio_aproximado)
            fprintf("%s = %f \n",polinomio_aproximado(i),vector_sumatoria_fx_product_potencias_x(i));
        end
        
        vector_resultados_cociente =metodo_de_doolittle_por_matriz(simbolos,sistema_de_ecuaciones_de_minimos_cuadrados, vector_sumatoria_fx_product_potencias_x);
        
        %se declara el polinomio aproximado
        fprintf("\npolinomio hallado:\n==================\n")
        Titulo="p"+(size(simbolos,1)-1)+"(x)=";
        fprintf("p%d(x)=",size(simbolos,1)-1);
        
        %Se halla y muestra el polinomio aproximado
        for i=1:size(simbolos,1)
            if(i~=size(simbolos,1))
                fprintf(" %s.*x.^ %d +",polinomio_aproximado(i),i-1);
                Titulo = Titulo +" " +simbolos(i)+"*x^"+(i-1)+" +";
            else
                fprintf(" %s.*x.^ %d \n",simbolos(i),i-1);
                Titulo = Titulo +" " +polinomio_aproximado(i)+"*x^"+(i-1);
            end

        end
        
        resultado=0;

        for i=1:size(simbolos,1)
            resultado=resultado+power(valor_buscado_x,i-1)*vector_resultados_cociente(i);
        end
        
        %se grafica el polinomio
        
        %primero se define el dominio de x
        dominio_x=vector_valores_x(1):0.001:vector_valores_x(size(vector_valores_x,1));

        %luego se define los puntos de la funcion a partir del dominio de x
        vector_funcional=polyval(fliplr(vector_resultados_cociente),dominio_x);
        
        %se realiza las configuraciones para graficar la funcion
        plot(dominio_x,vector_funcional),title(Titulo),xlabel('x'),ylabel('y'),grid;
        
        %se muestra y halla los errores entre el valor real pedido y el
        %valor interpolado obtenido de fx
        fprintf("\nResultado para x=%f, f(%f)=%f\n\n",valor_buscado_x,valor_buscado_x,resultado);

        obtener_los_tres_tipos_de_errores("x",resultado,f_valor_real);
        
     end
end