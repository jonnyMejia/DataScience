function [matriz_coeficiente_reordenada, resultados_reordenada]=reordenar_matriz_coeficientes(matriz_coeficiente, resultados)
    n=size(matriz_coeficiente,1);
   	matriz_coeficiente_reordenada = zeros(n,n);
    resultados_reordenada= zeros(n,1);
    i=1;
    vector_bandera = zeros(n,1);
    for k=1:n
        vector_bandera(k)=true;
    end
    while(i~=n+1)
        dato =round(rand*n+0.5);      
        if(dato~=0&&vector_bandera(dato))
            vector_bandera(dato)=false;
            for j=1:n
                matriz_coeficiente_reordenada(i,j)= matriz_coeficiente(dato,j);
                resultados_reordenada(i)=resultados(dato);
            end
            i=i+1;
        end
    end
    disp("Reordenamiento de la filas de la matriz extendida por incapacidad del metodo");
    disp("escogido debido a la disposicion de las filas del sistema de ecuaciones")
    disp([matriz_coeficiente_reordenada resultados_reordenada])
    
end