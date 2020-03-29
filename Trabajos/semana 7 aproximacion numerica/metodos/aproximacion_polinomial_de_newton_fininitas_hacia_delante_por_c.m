function aproximacion_polinomial_de_newton_fininitas_hacia_delante_por_consola()
    clc
    [n,vector_valores_x,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obtenerDatosXConsola_por_numero_datos_de_x;
    
    if(bandera)
        %Se halla la matriz de diferencias divididas;
        [matriz_diferencias_divididas,grado]= diferencias_divididas(n,vector_valores_x,vector_valores_fx);
        
        fprintf("\nla matriz de diferencias divididas es: \n");
        disp([vector_valores_x matriz_diferencias_divididas]);
        

        %se coloca el grado del polinomio obtenido de la matriz de
        %diferencias divididas
        m=grado;

        %se halla el polinomio
        vector_polinomio_solucion=zeros(m+1,1);
        
        vector_polinomio_solucion(1)=matriz_diferencias_divididas(1,1);

        for x=2:m+1
            for y=1:x-1
                if(y==1)
                    vector =  [1,-vector_valores_x(y)];
                else
                    vector = conv(vector,[1,-vector_valores_x(y)]);
                end
            end

            vector=flipud(vector'*matriz_diferencias_divididas(x,x));

            for y=1:x
                 vector_polinomio_solucion(y)=vector_polinomio_solucion(y)+vector(y);
            end
        end

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