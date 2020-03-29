function [matriz_diferencias_divididas,grado]= diferencias_divididas(n,vector_valores_x,vector_valores_fx)
    %                           Diferencias divididas
    %
    %   En el Presente algoritmo hallar una matris de diferencias divididas
    %   mediante calculo de las derivadas de n orden obtenidas a partir del
    %   los valores de la tabla
    %
    %   Datos Necesarios: 
    %       n = Grado del polinomio  
    %       tabla de puntos de valores de fx y x

    % Se declara la matris de diferencias divididas
    matriz_diferencias_divididas=zeros(n,n);
    
    %Se guarda en la primera columna de la matriz los valores del vector fx
    matriz_diferencias_divididas(:,1)=vector_valores_fx;
    
    %Se halla los valores de la matriz de diferencias divididas
    for j =2:n
        bandera=true;
        for i=j:n 
            matriz_diferencias_divididas(i,j)=(matriz_diferencias_divididas(i,j-1)-matriz_diferencias_divididas(i-1,j-1))/(vector_valores_x(i)-vector_valores_x(i-j+1));
            
            if(bandera&&matriz_diferencias_divididas(j,j)~=matriz_diferencias_divididas(i,j))
                bandera=false;
                grado=j;
            end
            
        end
        if(bandera)
            return;
        end
    end
    grado=n-1;

end