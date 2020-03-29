function bandera = isMatrizTriangularInferior(matriz_coeficiente)
    for i=1:size(matriz_coeficiente,1)
       for j=1:size(matriz_coeficiente,2)
           if ((i<j&&matriz_coeficiente(i,j)==0)||(i>=j))
               bandera=true;
           else
               bandera=false;
               break;
           end
       end
       if(~bandera)
          break; 
       end
    end
end