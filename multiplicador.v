module multiplicador (input wire [2:0]multiplicando, 
                      input wire [2:0]multiplicador, 
                      input clk, start, 
                      output [5:0]resultado, 
                      output wire Fin);

wire inic, desplaza, resta, cargasuma, qmenos1;

unidadcontrol Unidad_Control (qmenos1,resultado[0], clk,start,inic,desplaza,resta,cargasuma, Fin);

caminodatos Camino_Datos (multiplicando, multiplicador, clk, inic, desplaza, resta, 
                          cargasuma,resultado, qmenos1);

endmodule
