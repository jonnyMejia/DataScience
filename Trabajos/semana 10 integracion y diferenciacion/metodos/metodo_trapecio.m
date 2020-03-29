function area=metodo_trapecio(m,vector_valores_x,vector_valores_fx)
    h=(vector_valores_x(m)-vector_valores_x(1))/(m-1);
    disp(h)
    sumatoria_doble=0;
    
    for i= 1:m-2
        sumatoria_doble=sumatoria_doble+2*vector_valores_fx(i+1);
    end

    area = (h/2)*(vector_valores_fx(1)+vector_valores_fx(m)+sumatoria_doble);
    

end