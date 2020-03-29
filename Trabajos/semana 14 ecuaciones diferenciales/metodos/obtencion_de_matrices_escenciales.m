%       Resolucion de ecuaciones  
%
%
%
%
%
%

function[matriz_coeficiente,matriz_extendida]= obtencion_de_matrices_escenciales(sistema_ecuaciones, simbolos,vector_resultado)
    %Declaracion de simbolos
    for i = 1:size(simbolos,1)
       str2sym(simbolos(i));
    end
    syms d;
    %Obteninedo la dimension de filas del sistema de ecuaciones   
    m=size(sistema_ecuaciones,1);
    n=size(simbolos,1); %consideramos que el numero de ecuaciones y el desismbolos son los mismos
    
    %Declaracion de la matriz cociente
    matriz_coeficiente = zeros(m,n); 
    %colocar el valor de los coeficientes en la matriz
    for i = 1:m
        for j = 1:n
            dato_evaluar = coeffs(str2sym(sistema_ecuaciones(i)),str2sym(simbolos(j)));
            [a,b]=size(dato_evaluar);
            
            if(a+b>2||isnumeric(dato_evaluar))
               % fprintf("%d - %d -- %f-%f\n",i,j, a,b);
                matriz_coeficiente(i,j) = dato_evaluar(b);
            else
                matriz_coeficiente(i,j) = 0;
            end            
        end
    end
    matriz_extendida = [matriz_coeficiente vector_resultado];
    
end
