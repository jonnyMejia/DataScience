function [Matriz_L,Matriz_U] = Descomposicion_L_U_Crout(Matriz_de_coeficientes)

    fprintf("Matriz de coeficientes a descomponer por el metodo de Crout: \n");
    disp("============================================================")
    disp(Matriz_de_coeficientes);
    Matriz_L = zeros(size(Matriz_de_coeficientes));
    Matriz_U = eye(size(Matriz_de_coeficientes));
    for i =1:size(Matriz_de_coeficientes)
       for j = 1:size(Matriz_de_coeficientes)
           if(i<j)
               Matriz_U(i,j)=Matriz_de_coeficientes(i,j);
               for k = 1:i-1
                   Matriz_U(i,j)=Matriz_U(i,j) - Matriz_L(i,k)* Matriz_U(k,j);
               end 
               Matriz_U(i,j) = Matriz_U(i,j)/Matriz_L(i,i);
           else
               Matriz_L(i,j) = Matriz_de_coeficientes(i,j);
               for k=1:j-1
                   Matriz_L(i,j)=Matriz_L(i,j) - Matriz_L(i,k)* Matriz_U(k,j);
               end
           end
       end 
    end
   
    fprintf("Despues de la descomposicion de Crout:\n\n");

    fprintf("Matriz L: \n");
    disp("==========")
    disp(Matriz_L)
    
    fprintf("\n");
    
    fprintf("Matriz U: \n");
    disp("==========")
    disp(Matriz_U)
end