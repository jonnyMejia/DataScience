function raiz = Biseccion(f,lim_inf,lim_sup,err_limite,it)
    %                Metodo de la biseccion
    %
    %   function Biseccion(f,lim_inf,lim_sup,err_limite,it)
    %
    %   Debido a que el metodo necesitaban calculos a partir del algebra de las
    %   funciones, este metodo cubre dhica falencia y utliza la disposicion
    %   de la grafica con respecto a la raiz, y mediante el valor de las
    %   funciones en los limites lim_inf y lim_sup, se va restringiendo la
    %   funcion.
    %
    %   Esta funcion necesita los siguientes parametros:
    %       lim_inf: limite inferior de la funcion;
    %       lim_sup: limite superior de la fiuncion;
    %       f: funcion que permite hallar los valores posterior de x
    %       err_limite: error limite paras las iteraciones.
    %       it: cantidad de operaciones
    bandera_inicial=true;
    contador=0;
    raiz_antecesora=0;
    raiz = 0;
     %Se obtiene los valores de los puntos
        x = lim_inf;
        f_limite_1=eval(f);
        
        x = lim_sup;
        f_limite_2=eval(f);
        
     if(f_limite_1*f_limite_2>0)
         disp("No existe punto critico en los limites pasados como parametro");
     else
         while(true)
             if(bandera_inicial)
                 error_porcentual = 0;
                 %Se muestra la primera parte de la tabla junto con la iteracion 0:
                 fprintf("La tabla de iteraciones para la funcion ''%s'' es la siguiente\n",f);
                 disp("    N°de Iteracion        Limite inferior        Limite Superior        Raiz Actual        Raiz Antecesora        error relativo    \n");
                 disp("=============================================================================================================================\n");
                 fprintf("          %d                   %f                  %f                  %f                  %f                  %f         \n",contador,lim_inf,lim_sup,raiz,raiz_antecesora,error_porcentual);
                 bandera_inicial=false;
             else
                 %Se calcula la raiz actual
                 raiz=(lim_inf+lim_sup)/2;

                 %Se calcula el error porcentual
                  error_porcentual=abs((raiz_antecesora-raiz)/raiz)*100;
                  
                 %Se muestra el valor de la iteracion actual
                  fprintf("          %d                   %f                  %f                  %f                  %f                  %f         \n",contador,lim_inf,lim_sup,raiz,raiz_antecesora,error_porcentual);
                  
                  %Se actualizan los limites
                  x= raiz;
                  f_limite_2=eval(f);
                               
                  if f_limite_1*f_limite_2<0
                      lim_sup=raiz;
                  else
                      if(f_limite_1*f_limite_2>0)
                          lim_inf=raiz;
                      else
                          fprintf("se enecontro la raiz exacta '%f' en la iteracion '%d'",raiz,contador);
                      end
                  end
                  %Se actualizan la raiz antecesora
                  raiz_antecesora = raiz;
                  
                  if(contador>=it||error_porcentual<err_limite)
                      break;
                  end
             end
      
             %Aumento del contador
             contador=contador+1;
         end
         
     end
end