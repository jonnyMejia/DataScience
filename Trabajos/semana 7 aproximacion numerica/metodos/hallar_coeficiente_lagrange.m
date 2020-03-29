function vector = hallar_coeficiente_lagrange(posicion,valor_x_i,vector_valores_x)
    %                  Coeficiente de lagrange
    %
    %   En el Presente algoritmo se hallara el valor del coeficiente de grado i.
    %   para hacer lo mas factible se separa las operaciones del numerados,
    %   con las operaciones del denominador:
    %
    %   Datos Necesarios: 
    %       posicion = el grado del coeficiente  
    %       valor_x_i: el valor de la variable x de grado i (posicion)
    %       vector_valores_x: el vector de  los valores de x de la tabla

    %Declaracion del denominador
    denominador=1;
    
    bandera=true;
    
    for i=1:size(vector_valores_x,1)
        if(posicion~=i)
            %Operaciones del denominador
            denominador=denominador*(valor_x_i-vector_valores_x(i));
            if(bandera)
                %declaracion del primer factor de multiplicaion del numerador
                vector =  [1,-vector_valores_x(i)];
                bandera=false;
            else
                %operacion de las multiplicaciones de los factores del denominador
                vector =  conv(vector,[1,-vector_valores_x(i)]);
            end
        end
    end
    
    %Se divide el valor del numerador con el valor del denominador para
    %obtener el polinomio generado en el coeficiente de grado i 
    vector=vector/denominador;
end