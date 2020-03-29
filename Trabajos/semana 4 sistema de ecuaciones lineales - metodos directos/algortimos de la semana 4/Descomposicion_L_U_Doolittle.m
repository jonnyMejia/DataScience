function [Matriz_L,Matriz_U] = Descomposicion_L_U_Doolittle(Matriz_de_coeficientes)

    fprintf("Matriz de coeficientes a descomponer por el metodo de Doolittle: \n");
    disp("================================================================")
    disp(Matriz_de_coeficientes);
    n=size(Matriz_de_coeficientes);
    Matriz_L = eye(n);
    Matriz_U = zeros(n);
    for i =1:n
       for j = 1:n
           if(i<=j)
               Matriz_U(i,j)=Matriz_de_coeficientes(i,j);
               for k = 1:i-1
                   Matriz_U(i,j)=Matriz_U(i,j) - Matriz_L(i,k)* Matriz_U(k,j);
               end               
           else
               Matriz_L(i,j) = Matriz_de_coeficientes(i,j);
               for k=1:j-1
                   Matriz_L(i,j)=Matriz_L(i,j) - Matriz_L(i,k)* Matriz_U(k,j);
               end
               Matriz_L(i,j) = Matriz_L(i,j)/Matriz_U(j,j);
           end
       end 
    end

    fprintf("Despues de la descomposicion de Doolittle:\n\n");
     
    fprintf("Matriz L: \n");
    disp("==========")
    disp(Matriz_L)
    
    fprintf("\n");
    
    fprintf("Matriz U: \n");
    disp("==========")
    disp(Matriz_U)
end