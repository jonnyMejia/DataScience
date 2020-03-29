function  [derivada,valor_inicial_x,valor_inicial_y,n,h] = obtenerDatosParaEcuacionesDiferenciales()
    %                  obtener datos por consola plus grado
    %
    %   En el Presente algoritmo obtentra los puntos iniciales y la
    %   derivada para el calculo de la aproximacion de la funcion
    %
    %   Datos Necesarios: no necesita datos para funcionar
    
    valor_inicial_x=input('Escribir el valor del punto inicial para x0: ');
    
    valor_inicial_y=input('Escribir el valor del punto inicial para y0: ');
    
    derivada=input('Escribir la derivada de la funcion a descubrir: ');
    
    n=input('cantidad de intervalos a usar: ');
    
    h=input('tamaño del intervalo: ');

end