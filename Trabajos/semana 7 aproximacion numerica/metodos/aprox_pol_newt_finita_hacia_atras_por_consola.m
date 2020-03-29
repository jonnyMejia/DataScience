function aprox_pol_newt_finita_hacia_atras_por_consola()


    clc
    [n,valor_de_x,factor_h,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obtenerDatosXConsola_por_numero_datos_de_x_lineal_h_a();
    
    if(bandera)
        %Se halla la matriz de diferencias divididas;
        [matriz_diferencias_lineal_divididas,grado,vector_valores_x]= diferencias_linenal_divididas_hacia_atras(n,valor_de_x,factor_h,vector_valores_fx);
        
        fprintf("\nla matriz de diferencias divididas finitas haciaa delante es: \n\n");
        disp([vector_valores_x matriz_diferencias_lineal_divididas]);
        

        %se coloca el grado del polinomio obtenido de la matriz de diferencias lineales divididas
        m=grado;
        
        %Se halla el valor de S
        s= [1/factor_h,-valor_de_x/factor_h];

        %se halla el polinomio
        fprintf("\nEl polinomio aproximado se representa de la siguiente manera: \n")
        vector_polinomio_solucion=zeros(m+1,1);
        
        vector_polinomio_solucion(1)=matriz_diferencias_lineal_divididas(1,1);

        for x=2:m+1
            for y=1:x-1
                if(y==1)
                    vector =  s;
                else
                    vector = conv(vector,[1/factor_h,(-valor_de_x/factor_h)+(y-1)]);
                end
            end

            vector=flipud(vector'*matriz_diferencias_lineal_divididas(x,x))/factorial(x-1);

            for y=1:x
                 vector_polinomio_solucion(y)=vector_polinomio_solucion(y)+vector(y);
            end
        end
        
        %Se muestra el valor del polinomio y se halla el resultado interpolado
        polinomio = "";
        valor_fx_aproximado=0;
        
        vector_polinomio_solucion=flipud(vector_polinomio_solucion);
        
        for i = 1:m+1
            if(i~=m+1)
                polinomio = polinomio +  vector_polinomio_solucion(i)+".*x"+".^"+ (m+1-i)+" + ";
            else
                polinomio = polinomio +  vector_polinomio_solucion(i)+".*x"+".^"+ (m+1-i)+"\n";
            end
            valor_fx_aproximado = valor_fx_aproximado+ vector_polinomio_solucion(i)*power(valor_buscado_x,m+1-i);
        end
        fprintf(polinomio+"\n");

        fprintf("Reemplazando el dato %d en el polinomio da como resultado: %f\n",valor_buscado_x,valor_fx_aproximado);

        obtener_los_tres_tipos_de_errores("x",valor_fx_aproximado,f_valor_real);

    end

end