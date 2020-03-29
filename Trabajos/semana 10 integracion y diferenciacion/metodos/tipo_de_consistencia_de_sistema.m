function [valor_de_consistencia] = tipo_de_consistencia_de_sistema(matriz_de_coeficientes,matriz_extendida)

if(rank(matriz_de_coeficientes)==rank(matriz_extendida))
    if(rank(matriz_de_coeficientes)==size(matriz_de_coeficientes,1))
        valor_de_consistencia=1;
    else 
         valor_de_consistencia=2;
    end
    
else
     valor_de_consistencia=3;
end


end