function bandera = isSimetrica(Matriz_coeficiente)
    bandera=true;
    if(size(Matriz_coeficiente,1)==size(Matriz_coeficiente,2))
        for i = 1:size(Matriz_coeficiente,1)
            for j = 1:size(Matriz_coeficiente,2)
                if(~(Matriz_coeficiente(i,j)==Matriz_coeficiente(j,i)))
                    bandera=false;
                    disp("La matriz no es simetrica");
                    break;
                end
            end
            if(~bandera)
               break ;
            end
            
        end
    else
        disp("La matriz no es cuadrada");
        bandera=false;
    end
    
    
end