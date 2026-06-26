`timescale 1ns/1ps

module tb_top_module;

reg clk;
reg vote;
reg [1:0] candidate;

wire [7:0] A;
wire [7:0] B;
wire [7:0] C;
wire [7:0] D;
wire [2:0] state;

top_module DUT(
    .clk(clk),
    .vote(vote),
    .candidate(candidate),
    .A(A),
    .B(B),
    .C(C),
    .D(D)
);

voting_fsm FSM(
    .clk(clk),
    .vote_btn(vote),
    .state(state)
);

always #5 clk = ~clk;

initial begin
   // A gets 3 votes
candidate = 2'b00; vote = 1; #20; vote = 0; #20;
candidate = 2'b00; vote = 1; #20; vote = 0; #20;
candidate = 2'b00; vote = 1; #20; vote = 0; #40;

// B gets 2 votes
candidate = 2'b01; vote = 1; #20; vote = 0; #20;
candidate = 2'b01; vote = 1; #20; vote = 0; #40;

// C gets 2 votes
candidate = 2'b10; vote = 1; #20; vote = 0; #20;
candidate = 2'b10; vote = 1; #20; vote = 0; #40;

// D gets 2 votes
candidate = 2'b11; vote = 1; #20; vote = 0; #20;
candidate = 2'b11; vote = 1; #20; vote = 0; #100;
    #200;
    $finish;
end

initial begin
    $dumpfile("voting.vcd");
    $dumpvars(0,tb_top_module);
end

endmodule