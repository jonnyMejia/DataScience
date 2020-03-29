function norma_euclidiana=hallar_norma_eucliiana(matriz)
    norma_euclidiana = 0;
    
    n=size(matriz,1);
    m=size(matriz,2);
    
    for i=1:n
        for j=1:m
            norma_euclidiana=norma_euclidiana + power(matriz(i,j),2);
        end
    end
    norma_euclidiana=power(norma_euclidiana,0.5);
end