module top_module(
input clk,
input vote,
input [1:0] candidate,
output [7:0] A,
output [7:0] B,
output [7:0] C,
output [7:0] D
);

wire clean_vote;
wire [2:0] state;

debounce DB(
.clk(clk),
.btn(vote),
.clean(clean_vote)
);

voting_fsm FSM(
.clk(clk),
.vote_btn(clean_vote),
.state(state)
);

eeprom_memory MEM(
.clk(clk),
.vote(vote),                    //bypass debounce
.candidate(candidate),
.A(A),
.B(B),
.C(C),
.D(D)
);

endmodule