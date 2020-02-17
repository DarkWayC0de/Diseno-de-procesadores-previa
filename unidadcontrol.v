module unidadcontrol (input wire qmenos1,q0, clk, start,
                      output wire inic, desplaza, resta, cargasuma, fin);

reg [2:0] estadoactual,siguienteestado;

parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
parameter s5 = 3'b101;
parameter s6 = 3'b110;
parameter s7 = 3'b111;


always @ (posedge clk, posedge start)
 if(start)
   estadoactual = s0;
 else
   estadoactual <= siguienteestado;



always @ (*)
  case(estadoactual)
    s0: siguienteestado =s1;
    s1: siguienteestado =s2;
    s2: siguienteestado =s3;
    s3: siguienteestado =s4;
    s4: siguienteestado =s5;
    s5: siguienteestado =s6;
    s6: siguienteestado =s7;
    s7: siguienteestado =s7;
  endcase

assign inic = (estadoactual == s0)? 1:0;
assign desplaza = ((estadoactual ==s2)|(estadoactual ==s4)|(estadoactual ==s6))? 1:0;
assign fin = (estadoactual == s7)? 1:0;
assign resta = ((q0 == 1) &&(qmenos1 == 0))? 1:0;
assign cargasuma = ((q0 != qmenos1) && ((estadoactual==s1)|(estadoactual==s3)|(estadoactual==s5)))? 1:0;
    

endmodule
