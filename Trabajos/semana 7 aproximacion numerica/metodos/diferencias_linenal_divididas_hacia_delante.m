function [matriz_diferencias_lineal_divididas,grado,vector_valores_x]= diferencias_linenal_divididas_hacia_delante(n,valor_x,factor_h,vector_valores_fx)
    matriz_diferencias_lineal_divididas=zeros(n,n);
    matriz_diferencias_lineal_divididas(:,1)=vector_valores_fx;
       
    vector_valores_x=zeros(n,1);

    for k=1:n
        vector_valores_x(k)=valor_x+(factor_h*(k-1));
    end
    
    for j =2:n
        bandera=true;
        for i=j:n 
            matriz_diferencias_lineal_divididas(i,j)=(matriz_diferencias_lineal_divididas(i,j-1)-matriz_diferencias_lineal_divididas(i-1,j-1));
            
            if(bandera&&matriz_diferencias_lineal_divididas(j,j)~=matriz_diferencias_lineal_divididas(i,j))
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