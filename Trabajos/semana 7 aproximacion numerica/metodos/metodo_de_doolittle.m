function [vector_resultados_final]=metodo_de_doolittle(simbolos,sistema_ecuaciones, vector_resultados)
    
    disp ("Datos de entrada: ");
    fprintf("\n");
    disp("Sitema de ecuaciones:")
    for i=1:size(sistema_ecuaciones)
        fprintf("%s = %f \n",sistema_ecuaciones(i),vector_resultados(i));
    end
    
    fprintf("\n");

    [Matriz_de_coeficientes,matriz_extendida]=obtencion_de_matrices_escenciales(sistema_ecuaciones, simbolos,vector_resultados);
    
    fprintf("Matriz extendida del sistema de ecuaciones\n");
    disp("=================================");
    disp(matriz_extendida);
        
    [Matriz_L,Matriz_U] = Descomposicion_L_U_Doolittle(Matriz_de_coeficientes);
    vector_independeinte_original = metodo_triangular_inferior(Matriz_L,vector_resultados);    
    vector_resultados_final = metodo_triangular_superior(Matriz_U,vector_independeinte_original');
    fprintf("Resultados: \n");
    disp("===============")
    
    for i=1:size(simbolos)
        fprintf("Simbolo: %s = %f \n",simbolos(i),vector_resultados_final(i));
    end 
end