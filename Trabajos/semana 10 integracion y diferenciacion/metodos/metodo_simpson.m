function area=metodo_simpson(m,vector_valores_x,vector_valores_fx)
    h=(vector_valores_x(m)-vector_valores_x(1))/(m-1);
    
    sumatoria_doble=0;
    sumatoria_cuadruple=0;
    
    for i= 1:floor(m/2)
        if(i~=floor(m/2))
            sumatoria_doble=sumatoria_doble+2*vector_valores_fx(2*i+1);
        end
        sumatoria_cuadruple=sumatoria_cuadruple+4*vector_valores_fx(2*i);
    end
    area = (h/3)*(vector_valores_fx(1)+vector_valores_fx(m)+sumatoria_doble+sumatoria_cuadruple);


end