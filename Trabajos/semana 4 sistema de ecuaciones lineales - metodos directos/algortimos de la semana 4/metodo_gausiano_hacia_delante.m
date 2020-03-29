function [vector_resultados_final, matriz_extendida_final]= metodo_gausiano_hacia_delante(sistema_ecuaciones, simbolos,vector_resultados)
    clc
    disp ("=========Metodo Gaussiano hacia delante=========");
    fprintf("\n");

    disp ("Datos de entrada: ");
    fprintf("\n");
    disp("Sitema de ecuaciones:")
    for i=1:size(sistema_ecuaciones)
        fprintf("%s = %f \n",sistema_ecuaciones(i),vector_resultados(i));
    end
    
    fprintf("\n");
    fprintf("\n");

    [matriz_coeficiente,matriz_extendida_final]=obtencion_de_matrices_escenciales(sistema_ecuaciones, simbolos,vector_resultados);
    
    disp("Matriz_extendida antes de la triangulacion superior");
    disp(matriz_extendida_final);
    
    [matriz_cociente_triangular_superior,resutados_trianfulados_superiormente] =triangular_superiormente_matriz(matriz_coeficiente, vector_resultados);
    
    
    matriz_extendida_final = [matriz_cociente_triangular_superior resutados_trianfulados_superiormente];
    
    disp("Matriz_extendida despues de la triangulacion superior");
    disp(matriz_extendida_final);
    
    vector_resultados_final = metodo_triangular_superior(matriz_cociente_triangular_superior,resutados_trianfulados_superiormente);
    
    disp("Resolviendo la matriz por el metodo de triangulacion superior: ");
    disp("==============================================================");
    disp("")
    for i=1:size(simbolos)
        fprintf("Simbolo: %s = %f \n",simbolos(i),vector_resultados_final(i));
    end 
end