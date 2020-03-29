function  [n,m,vector_valores_x,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obntenerDatosXConsolaPlusGrado()
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
    if(m>=1)
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
        
        %se pedira el valor a evaluar su valor de interpolacion
       	valor_buscado_x=input('\nEscribir valor a evaluar [x] dentro del intervalo de inerpolacion:');
        
        %se pedira el valor real para corroborar el error del valor interpolado
        f_valor_real=input('\nEscribir el valor a evaluar [fx] con el valor interpolado :');
        n=n+1;
    else
        disp('el metodo no admite solucion para polinomios de grade menor de 2');
        bandera=false;
    end
end