function vector_resultados = metodo_triangular_superior(matriz_coeficientes_triangular_superior, resultados_trinagulados_superiormente)    
    if(tipo_de_consistencia_de_sistema(matriz_coeficientes_triangular_superior,[matriz_coeficientes_triangular_superior resultados_trinagulados_superiormente])==1)
        if(isMatrizTriangularSuperior(matriz_coeficientes_triangular_superior))
            vector_resultados = 1: size(matriz_coeficientes_triangular_superior,2);
            for i = size(matriz_coeficientes_triangular_superior,1):-1:1
                acumulador=0;
                for j=i+1:size(matriz_coeficientes_triangular_superior,2)
                	acumulador= acumulador + matriz_coeficientes_triangular_superior(i,j)*vector_resultados(j);
                end
                vector_resultados(i)=(resultados_trinagulados_superiormente(i)-acumulador)/matriz_coeficientes_triangular_superior(i,i);
            end
        else
            disp("la matriz no es de tipo triangular superior");
        end
        
    elseif(tipo_de_consistencia_de_sistema(matriz_coeficientes_triangular_superior,[matriz_coeficientes_triangular_superior resultados_trinagulados_superiormente])==2)
        disp("el sistema tiene varias soluciones");
    elseif(tipo_de_consistencia_de_sistema(matriz_coeficientes_triangular_superior,[matriz_coeficientes_triangular_superior resultados_trinagulados_superiormente])==3)
        disp("el sistema no es consistente");
    end    
end