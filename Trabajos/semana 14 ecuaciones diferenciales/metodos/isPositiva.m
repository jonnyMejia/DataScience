function bandera = isPositiva(Matriz_de_coeficientes)
    bandera=true;
    if(size(Matriz_de_coeficientes,1)==size(Matriz_de_coeficientes,2))
        for k = 1:size(Matriz_de_coeficientes,1)
            menor_principal=zeros(size(Matriz_de_coeficientes,1));
            for i = 1:k
                for j = 1:k
                    menor_principal(i,j)=Matriz_de_coeficientes(i,j);
                end
            end
            if(det(menor_principal)<0)
                disp("La determinante de uno de los menores principales es negativa");
                bandera = false;
                break;
            end
            
        end
    else
        disp("La matriz no es cuadrada");
        bandera=false;
    end
    
end