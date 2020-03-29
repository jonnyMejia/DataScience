function [vector_resultados_final]=metodo_de_doolittle_sin_comentarios(Matriz_de_coeficientes,vector_resultados)
    
        
    [Matriz_L,Matriz_U] = Descomposicion_L_U_Doolittle(Matriz_de_coeficientes);
    vector_independeinte_original = metodo_triangular_inferior(Matriz_L,vector_resultados);    
    vector_resultados_final = metodo_triangular_superior(Matriz_U,vector_independeinte_original');


end