function x_k_plus_1 = Newton_Rapshon(f,x_k, it, err_limite)
  %                Metodo de Newton Rhapson
  %
  %   function Newton_Rapshon(f,f_derivada,x_k, it, err_limite)
  %
  %   Para encontrar de manera eficiente la raiz de una ecuacion, el metodo
  %   utiliza la serie de taylor y el uso del valor de la derivada de la
  %   funcion pasada como parametro.
  %   
  %   Esta funcion necesita los siguientes parametros:
  %       x_k: primer valor de x en el instante 0;
  %       f: funcion que permite hallar los valores posterior de x
  %       f_derivada: el la derivada de f y apoya a la solucion
  %       it: cantidad de operaciones
  %       err: Limite de error
  bandera_inicial=true;
  contador=0;
  while(true)
      %Se obtiene los valores de los puntos en la funcion y en su derivada
      syms x;
      dx = diff(str2sym(f),x);
      
      x = x_k;
      fx=eval(f);
      fdx = eval(dx);
      
      %Se calcula el valor de x_k_plus_1
      x_k_plus_1=x_k - fx/fdx;
      
      %Se calcula el valor del error de la iteracion actual:
      if(bandera_inicial)
          error_porcentual = 0;
          %Se muestra la primera parte de la tabla junto con la iteracion 0:
          fprintf("La tabla de iteraciones para la funcion ''%s'' y su derivada ''%s'' es la siguiente\n",f,dx);
          disp("    N°de Iteracion        Valor de x        Valor de x+1        error relativo    \n");
          disp("================================================================================\n");
          fprintf("          %d                   %f                  %f                %f         \n",contador,x_k,0,error_porcentual);
          bandera_inicial=false;
      else
          % se actualiza el valor error porcentual
          error_porcentual= abs((x_k_plus_1 - x_k)/ x_k_plus_1)*100;
          
          % se muestra el valor del la iteracion actual
          fprintf("          %d                   %f                  %f                %f         \n",contador,x_k,x_k_plus_1,error_porcentual);
          
          % se actualiza el valor actual y anterior de x
          x_k = x_k_plus_1;
      end
      
      %condicion de salida de la funcion
      if(contador~=0&&(err_limite>error_porcentual||contador>=it))
          break;
      end
      
      %Aumento del contador
      contador=contador+1;
      
  end
end