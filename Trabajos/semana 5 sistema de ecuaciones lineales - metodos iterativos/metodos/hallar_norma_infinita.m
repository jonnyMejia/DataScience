function norma_infinita=hallar_norma_infinita(matriz)
    norma_infinita = 0;
    
    n=size(matriz,1);
    m=size(matriz,2);
    
    for i=1:n
        for j=1:m
            if(norma_infinita<matriz(i,j))
                norma_infinita= matriz(i,j);
            end
        end
    end

end