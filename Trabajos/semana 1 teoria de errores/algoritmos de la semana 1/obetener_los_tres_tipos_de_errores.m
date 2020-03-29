function [error_absoluto,error_relativo,error_porcentual]=obetener_los_tres_tipos_de_errores(titulo_de_ecuacion,simbolos,vector_valores_aproximados,vector_valores_reales)
    n= size(simbolos,1);
    error_absoluto = zeros(n,1);
    error_relativo= zeros(n,1);
    error_porcentual = zeros(n,1);
    for i=1:n
        fprintf("Simbolo: %s\n",simbolos(i));
        fprintf("===========\n\n");
        
        error_absoluto(i,1)=abs(vector_valores_reales(i)-vector_valores_aproximados(i));
        fprintf("Error Abosuluto: %f\n",error_absoluto(i,1));
        
        error_relativo(i,1)=e_a/vector_valores_reales(i);
        fprintf("Error Relativo: %f\n",error_relativo(i,1));
        
        error_porcentual(i,1)=error_relativo.*100;
        fprintf("Error Porcentual: %f\n",error_porcentual(i,1));
    end
end