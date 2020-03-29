function vector_resultados = metodo_triangular_inferior(matriz_coeficientes_triangular_inferior, resultados_trinagulados_inferiormente)
    if(tipo_de_consistencia_de_sistema(matriz_coeficientes_triangular_inferior,[matriz_coeficientes_triangular_inferior resultados_trinagulados_inferiormente])==1)
        if(isMatrizTriangularInferior(matriz_coeficientes_triangular_inferior))
            vector_resultados = 1: size(matriz_coeficientes_triangular_inferior,2);
            for i = 1:size(matriz_coeficientes_triangular_inferior,1)
                acumulador=0;
                for j=1:i-1
                	acumulador= acumulador + matriz_coeficientes_triangular_inferior(i,j)*vector_resultados(j);
                end
                vector_resultados(i)=(resultados_trinagulados_inferiormente(i)-acumulador)/matriz_coeficientes_triangular_inferior(i,i);
            end
        else
            disp("la matriz no es de tipo triangular inferior");
        end
        
    elseif(tipo_de_consistencia_de_sistema(matriz_coeficientes_triangular_inferior,[matriz_coeficientes_triangular_inferior resultados_trinagulados_inferiormente])==2)
        disp("el sistema tiene varias soluciones");
    elseif(tipo_de_consistencia_de_sistema(matriz_coeficientes_triangular_inferior,[matriz_coeficientes_triangular_inferior resultados_trinagulados_inferiormente])==3)
        disp("el sistema no es consistente");
    end    
end