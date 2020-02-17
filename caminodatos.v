module caminodatos(input wire[2:0] multiplicando,
                   input wire[2:0] multiplicador, 
                   input wire clk, inic, desplaza, resta, cargasuma, 
                   output wire[5:0] resultado, output wire qmenos1);

wire [3:0] rsultadosuma;
wire [3:0] salidam;
wire [3:0] rega;
wire [3:0] entradam;
registro4 reg_a(rsultadosuma,resultado[5],cargasuma,desplaza,clk,inic,rega);
registro3 reg_q(multiplicando,resultado[3],inic,desplaza,clk,reset,resultado[2:0]);
ffdc registro_qmenos1(clk,inic,desplaza,resultado[0],qmenos1);

sum_resta4 suma(rsultadosuma, ,rega,salidam,resta);

assign resultado[5:3] = rega[2:0];
assign entradam[2:0] = multiplicador;
assign entradam[3] = multiplicador[2];


registro4 reg_m({multiplicador[2],multiplicador},,inic,1'b0,clk,1'b0,salidam);

endmodule
