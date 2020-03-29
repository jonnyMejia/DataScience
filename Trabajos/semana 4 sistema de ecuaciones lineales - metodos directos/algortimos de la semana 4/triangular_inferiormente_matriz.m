function [matriz_coeficiente_triangular_inferior,resutados_trianfulados_inferiormente] =triangular_inferiormente_matriz(matriz_coeficiente, resultados)
    n=size(matriz_coeficiente,1);
    bandera=true;
    matriz_coeficiente_base=matriz_coeficiente;
    resultados_base= resultados;
    for i=n:-1:2
       for j=i-1:-1:1
           if(matriz_coeficiente(i,i)~=0)
               temp= matriz_coeficiente(j,i)/matriz_coeficiente(i,i);
               matriz_coeficiente(j,i) = 0;
               for k= i-1:-1:1
                   matriz_coeficiente(j,k)=matriz_coeficiente(j,k)-temp*matriz_coeficiente(i,k);
               end
               resultados(j)=resultados(j)-temp*resultados(i);
           else
              [matriz_coeficiente_reordenada, resultados_reordenada]=reordenar_matriz_coeficientes(matriz_coeficiente_base, resultados_base);
              [matriz_coeficiente, resultados]=triangular_inferiormente_matriz(matriz_coeficiente_reordenada, resultados_reordenada);
              bandera=false;
              break;
           end          
       end
       if(~bandera)
           break;
       end
    end
    matriz_coeficiente_triangular_inferior = matriz_coeficiente;
    resutados_trianfulados_inferiormente = resultados;
end