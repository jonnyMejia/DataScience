function aproximacion_polinomial_de_newton_por_consola()

    %            Metodo Aproximacion de de newton por diferencias divididas
    %
    %   En el Presente algoritmo utilizara la matris de diferencias divididas
    %   , de la cual se obtiene los coeficientes y a cada coeficiente se le
    %   multiplica una seri de factores de resta de la variable x con los
    %   valores de x ontenidos a partir de la tabla (x - x_0)
    % 
    %   Datos Necesarios: 
    %       grado = Grado del polinomio
    %       n= cantidad de puntos de la tabla
    %       tabla de puntos de valores de fx y x
    %       valor_buscado_x: valor que se evalua en la funcion aproximada
    %       f_valor_real: valor real fx para el valor que se evaluara.
    
    clc
    %Se obtiene la tabla con los valores de x y fx por consola
    [n,vector_valores_x,vector_valores_fx, valor_buscado_x,f_valor_real,bandera] = obtenerDatosXConsola_por_numero_datos_de_x;
    
    if(bandera)
        %Se halla la matriz de diferencias divididas;
        [matriz_diferencias_divididas,grado]= diferencias_divididas(n,vector_valores_x,vector_valores_fx);
        
        %Se muestra la matrz de diferencias divididas
        fprintf("\nla matriz de diferencias divididas es: \n");
        disp([vector_valores_x matriz_diferencias_divididas]);
        

        %se coloca el grado del polinomio obtenido de la matriz de
        %diferencias divididas
        m=grado;

        %se declara el polinomio de aproximacion
        vector_polinomio_solucion=zeros(m+1,1);
        
        %Se halla el polinomio de aprximacion
        vector_polinomio_solucion(1)=matriz_diferencias_divididas(1,1);

        for x=2:m+1
            for y=1:x-1
                if(y==1)
                    vector =  [1,-vector_valores_x(y)];
                else
                    vector = conv(vector,[1,-vector_valores_x(y)]);
                end
            end
            %Se invierte el vector de manera vertical para comodidad de las operaciones
            vector=flipud(vector'*matriz_diferencias_divididas(x,x));
            
            %Se suma cada coeficiente del vector al polinomio de aproximacion
            for y=1:x
                 vector_polinomio_solucion(y)=vector_polinomio_solucion(y)+vector(y);
            end
        end
        
        %Se muestra la funcion polinomial
        polinomio = "";
        valor_fx_aproximado=0;
        
        vector_polinomio_solucion=flipud(vector_polinomio_solucion);
        
        for i = 1:m+1
            if(i~=m+1)
                polinomio = polinomio +  vector_polinomio_solucion(i)+".*x"+".^"+ (m+1-i)+" + ";
            else
                polinomio = polinomio +  vector_polinomio_solucion(i)+".*x"+".^"+ (m+1-i)+"\n";
            end
            
            %Se halla el valor interpolado a partir del valor de x solicitado
            valor_fx_aproximado = valor_fx_aproximado+ vector_polinomio_solucion(i)*power(valor_buscado_x,m+1-i);
        end
        fprintf(polinomio+"\n");
        
        %Se halla y muestra el error del valor interpolado con respecto al valor real de fx
        fprintf("Reemplazando el dato %d en el polinomio da como resultado: %f\n",valor_buscado_x,valor_fx_aproximado);
        obtener_los_tres_tipos_de_errores("x",valor_fx_aproximado,f_valor_real);

    end

end