function  [n,m,vector_valores_x,vector_valores_fx,bandera] = obntenerDatosXConsolaPlusGrado()
    %                  obtener datos por consola plus grado
    %
    %   En el Presente algoritmo obtendra los valores de las tablas a
    %   partir de la consola, el cual pedira al usuario que digite los
    %   valores de x y fx, de manera adicional pide el grado del polinomio
    %   funcional aproximado a hallar
    %
    %   Datos Necesarios: no necesita datos para funcionar
    
    bandera=true;
    n=input('Escribir por el grado del polinomio: ');
    m=input('Escribir por la candidad de datos de x a ingresar: ');
    if(m>=2&&n>1)
        %se crea los vectores que contenrdran a las filas de la tabla
        vector_valores_x=zeros(m,1);
        vector_valores_fx=zeros(m,1);
        
        fprintf("\n");
        
        %aqui se recolecta los valores de xi y fxi
        for i=1:m
            fprintf("x[%d]",i-1);vector_valores_x(i)=input('Escriba su valor: ');
            fprintf("f[x_%d]",i-1);vector_valores_fx(i)=input('Escriba su valor: ');
            fprintf("\n");
        end
        
    else
        disp('el metodo no admite solucion para polinomios de grade menor de 2');
        bandera=false;
    end
    n=n+1;
end