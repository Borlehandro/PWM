`timescale 1ns / 1ps

module tb;
    logic clk = 0;
    logic out = 0;
    logic next = 0;
    logic [7:0] duration = 0;
    byte lol = 8'haa;
    
    logic [400:0] [7:0] tab = {
        8'h80,8'h82,8'h84,8'h86,8'h88,8'h8a,8'h8b,8'h8d,
        8'h8f,8'h91,8'h93,8'h95,8'h97,8'h99,8'h9b,8'h9d,
        8'h9f,8'ha1,8'ha3,8'ha5,8'ha7,8'ha9,8'hab,8'had,
        8'hae,8'hb0,8'hb2,8'hb4,8'hb6,8'hb8,8'hb9,8'hbb,
        8'hbd,8'hbf,8'hc0,8'hc2,8'hc4,8'hc6,8'hc7,8'hc9,
        8'hca,8'hcc,8'hce,8'hcf,8'hd1,8'hd2,8'hd4,8'hd5,
        8'hd7,8'hd8,8'hda,8'hdb,8'hdc,8'hde,8'hdf,8'he0,
        8'he2,8'he3,8'he4,8'he5,8'he7,8'he8,8'he9,8'hea,
        8'heb,8'hec,8'hed,8'hee,8'hef,8'hf0,8'hf1,8'hf2,
        8'hf3,8'hf4,8'hf5,8'hf5,8'hf6,8'hf7,8'hf7,8'hf8,
        8'hf9,8'hf9,8'hfa,8'hfa,8'hfb,8'hfb,8'hfc,8'hfc,
        8'hfd,8'hfd,8'hfd,8'hfe,8'hfe,8'hfe,8'hfe,8'hff,
        8'hff,8'hff,8'hff,8'hff,8'hff,8'hff,8'hff,8'hff,
        8'hff,8'hff,8'hfe,8'hfe,8'hfe,8'hfe,8'hfd,8'hfd,
        8'hfd,8'hfc,8'hfc,8'hfb,8'hfb,8'hfa,8'hfa,8'hf9,
        8'hf9,8'hf8,8'hf7,8'hf7,8'hf6,8'hf5,8'hf5,8'hf4,
        8'hf3,8'hf2,8'hf1,8'hf0,8'hef,8'hee,8'hed,8'hec,
        8'heb,8'hea,8'he9,8'he8,8'he7,8'he5,8'he4,8'he3,
        8'he2,8'he0,8'hdf,8'hde,8'hdc,8'hdb,8'hda,8'hd8,
        8'hd7,8'hd5,8'hd4,8'hd2,8'hd1,8'hcf,8'hce,8'hcc,
        8'hca,8'hc9,8'hc7,8'hc6,8'hc4,8'hc2,8'hc0,8'hbf,
        8'hbd,8'hbb,8'hb9,8'hb8,8'hb6,8'hb4,8'hb2,8'hb0,
        8'hae,8'had,8'hab,8'ha9,8'ha7,8'ha5,8'ha3,8'ha1,
        8'h9f,8'h9d,8'h9b,8'h99,8'h97,8'h95,8'h93,8'h91,
        8'h8f,8'h8d,8'h8b,8'h8a,8'h88,8'h86,8'h84,8'h82,
        8'h80,8'h7d,8'h7b,8'h79,8'h77,8'h75,8'h74,8'h72,
        8'h70,8'h6e,8'h6c,8'h6a,8'h68,8'h66,8'h64,8'h62,
        8'h60,8'h5e,8'h5c,8'h5a,8'h58,8'h56,8'h54,8'h52,
        8'h51,8'h4f,8'h4d,8'h4b,8'h49,8'h47,8'h46,8'h44,
        8'h42,8'h40,8'h3f,8'h3d,8'h3b,8'h39,8'h38,8'h36,
        8'h35,8'h33,8'h31,8'h30,8'h2e,8'h2d,8'h2b,8'h2a,
        8'h28,8'h27,8'h25,8'h24,8'h23,8'h21,8'h20,8'h1f,
        8'h1d,8'h1c,8'h1b,8'h1a,8'h18,8'h17,8'h16,8'h15,
        8'h14,8'h13,8'h12,8'h11,8'h10,8'hf,8'he,8'hd,
        8'hc,8'hb,8'ha,8'ha,8'h9,8'h8,8'h8,8'h7,
        8'h6,8'h6,8'h5,8'h5,8'h4,8'h4,8'h3,8'h3,
        8'h2,8'h2,8'h2,8'h1,8'h1,8'h1,8'h1,8'h0,
        8'h0,8'h0,8'h0,8'h0,8'h0,8'h0,8'h0,8'h0,
        8'h0,8'h0,8'h1,8'h1,8'h1,8'h1,8'h2,8'h2,
        8'h2,8'h3,8'h3,8'h4,8'h4,8'h5,8'h5,8'h6,
        8'h6,8'h7,8'h8,8'h8,8'h9,8'ha,8'ha,8'hb,
        8'hc,8'hd,8'he,8'hf,8'h10,8'h11,8'h12,8'h13,
        8'h14,8'h15,8'h16,8'h17,8'h18,8'h1a,8'h1b,8'h1c,
        8'h1d,8'h1f,8'h20,8'h21,8'h23,8'h24,8'h25,8'h27,
        8'h28,8'h2a,8'h2b,8'h2d,8'h2e,8'h30,8'h31,8'h33,
        8'h35,8'h36,8'h38,8'h39,8'h3b,8'h3d,8'h3f,8'h40,
        8'h42,8'h44,8'h46,8'h47,8'h49,8'h4b,8'h4d,8'h4f,
        8'h51,8'h52,8'h54,8'h56,8'h58,8'h5a,8'h5c,8'h5e,
        8'h60,8'h62,8'h64,8'h66,8'h68,8'h6a,8'h6c,8'h6e,
        8'h70,8'h72,8'h74,8'h75,8'h77,8'h79,8'h7b,8'h7d
        };
    
    pwm_generator generaror(
            .clk(clk),
            .pwm_out(out),
            .next(next),
            .exit_dur(duration)
        );
    
always #5 clk = ~clk;
    
endmodule
