function [error_absoluto,error_relativo,error_porcentual]=obtener_los_tres_tipos_de_errores(titulo_tipo_de_sistema_de_ecuaciones,simbolos,vector_valores_aproximados,vector_valores_reales)
    clc
    d='%';
    disp(titulo_tipo_de_sistema_de_ecuaciones);
    n= size(simbolos,1);
    error_absoluto = zeros(n,1);
    error_relativo= zeros(n,1);
    error_porcentual = zeros(n,1);
    for i=1:n
        fprintf("Simbolo: %s\n",simbolos(i));
        fprintf("===========\n\n");
        
        fprintf("Valor Real: %f\n",vector_valores_reales(i));
        fprintf("Valor Aproximado: %f\n\n",vector_valores_aproximados(i));

        error_absoluto(i,1)=abs(vector_valores_reales(i)-vector_valores_aproximados(i));
        fprintf("Error Abosuluto: %f\n",error_absoluto(i,1));
        
        error_relativo(i,1)=abs(error_absoluto(i,1)/vector_valores_reales(i));
        fprintf("Error Relativo: %f\n",error_relativo(i,1));
        
        error_porcentual(i,1)=error_relativo(i,1).*100;
        fprintf("Error Porcentual: %f%c\n\n",error_porcentual(i,1),d);
    end
end
