function resultado = resulmetodo_calculo_del_valor_puntual_de_fx_polinomial(vector_fx,valor_x)
    resultado = 0;
    for i = 1:size(vector_fx,1)
        resultado=resultado+power(valor_x,i-1)*vector_fx(i);
    end
    
end