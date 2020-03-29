function vector_resultados_cociente=minimos_cuadrados_parametrada(n,m,vector_valores_x,vector_valores_fx)      
        %Se crea los simbolos de los coeficientes del polinomio a generar
        n=n+1;
        simbolos = string(zeros(n,1));
        for i =1:n
           simbolos(i)= "a"+(i-1);
        end
        
        
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
              
        vector_resultados_cociente =fliplr((metodo_de_doolittle_sin_comentarios(sistema_de_ecuaciones_de_minimos_cuadrados, vector_sumatoria_fx_product_potencias_x)));
end