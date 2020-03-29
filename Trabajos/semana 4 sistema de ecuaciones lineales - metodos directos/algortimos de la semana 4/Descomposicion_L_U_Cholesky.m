function [Matriz_L,bandera] = Descomposicion_L_U_Cholesky(Matriz_de_coeficientes)
    fprintf("Matriz de coeficientes a descomponer por el metodo de Cholesky: \n");
    disp("============================================================")
    disp(Matriz_de_coeficientes);
    
    Matriz_L = zeros(size(Matriz_de_coeficientes,1));
    if(isSimetrica(Matriz_de_coeficientes)&&isPositiva(Matriz_de_coeficientes))
        for i =1:size(Matriz_de_coeficientes,1)
            for j = 1:i
                Matriz_L(i,j) = Matriz_de_coeficientes(i,j);
                for k=1:j-1
                    Matriz_L(i,j) = Matriz_L(i,j) - Matriz_L(i,k) * Matriz_L(j,k);
                end
                if (i==j)
                    Matriz_L(i,j) = power(Matriz_L(i,j),0.5);
                else
                    Matriz_L(i,j) = Matriz_L(i,j) / Matriz_L(j,j);
                end
            end
        end
        fprintf("Despues de la descomposicion de Cholesky:\n\n");
        
        fprintf("Matriz L: \n");
        disp("==========")
        disp(Matriz_L)
        bandera=true;
    else
        bandera=false;
    end
      
end