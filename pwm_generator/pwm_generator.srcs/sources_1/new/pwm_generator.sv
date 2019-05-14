`timescale 1ns / 1ps

module pwm_generator(
    input logic clk,
    input logic [7:0] duration,
    
    output logic next, 
    output logic pwm_out,
    output logic [7:0] exit_dur
    );
    
    ROM rom(
        .clk(clk),
        .next(next),
        .out(duration)
        );
    
    logic [7:0] count = 0;
    
   always @(posedge clk)
   begin
   assign exit_dur = duration; 
       count <= count + 1;
     if(count>=255)
     begin
        count <= 0; 
        assign next=1; 
     end
     else
        assign next=0;
   end
     assign pwm_out = count >= duration ? 1:0;
endmodule
