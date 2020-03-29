function norma_1=hallar_norma_1(matriz)
    norma_1 = 0;
    
    n=size(matriz,1);
    m=size(matriz,2);
    
    for i=1:n
        for j=1:m
            norma_1=norma_1+matriz(i,j);
        end
    end
end