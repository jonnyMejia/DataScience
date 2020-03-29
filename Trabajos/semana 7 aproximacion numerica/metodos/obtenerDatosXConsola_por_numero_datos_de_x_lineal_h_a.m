function  [n,valor_x,factor_h,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obtenerDatosXConsola_por_numero_datos_de_x_lineal_h_a()
    bandera=true;
    n=input('Escribir por la cantidad de puntos a ingresar:  ');
    if(n>1)
        %se crea los vectores que contenrdran a las filas de la tabla        
        vector_valores_fx=zeros(n,1);
        
        fprintf("\n");
        %Se obtiene del factor h
        factor_h=input('Escriba el valor de del factor de h: ');
        fprintf("\n");
        
        %Se obtiene el valor de x, y los valores de fx
        fprintf("x[%d]",n-1);valor_x=input('Escriba su valor: ');
        fprintf("f[x_%d]",n-1);vector_valores_fx(1)=input('Escriba su valor: ');
        fprintf("\n");
        for i=n-1:-1:1
            fprintf("El valor de x[%d] = %d\n",i-1,valor_x-factor_h*(n-i));
            fprintf("f[x_%d]",i-1);vector_valores_fx(n+1-i)=input('Escriba su valor: ');
            fprintf("\n");
        end
        
        %se pedira el valor a evaluar su valor de interpolacion
       	valor_buscado_x=input('\nEscribir valor a evaluar [x] dentro del intervalo de interpolacion: ');
        
        %se pedira el valor real para corroborar el error del valor interpolado
        f_valor_real=input('\nEscribir el valor a evaluar [fx] con el valor interpolado: ');
        
    else
        disp('el metodo no admite solucion para polinomios de grado menor de 2');
        bandera=false;
    end
end