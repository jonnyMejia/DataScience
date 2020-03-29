function vector = metodo_de_las_diagonales(arreglo_de_funciones,simbolos, resultados)
    [m_c,m_ex]= obtencion_de_matrices_escenciales(arreglo_de_funciones,simbolos, resultados);
    if(tipo_de_consistencia_de_sistema(m_c,m_ex)==1)
        if(isMatrizDiagonal(m_c))
            vector = 1: size(m_c,2);
            for i = 1:size(m_c,1)
                vector(i)= resultados(i)/m_c(i,i);
            end
        else
            disp("la matriz no es de tipo diagonal");
        end
        
    elseif(tipo_de_consistencia_de_sistema(m_c,m_ex)==2)
        disp("el sistema tiene varias soluciones");
    elseif(tipo_de_consistencia_de_sistema(m_c,m_ex)==3)
        disp("el sistema no es consistente");
    end    
end