module voting_fsm(
    input clk,
    input vote_btn,
    output reg [2:0] state
);

parameter IDLE    = 3'd0;
parameter SELECT  = 3'd1;
parameter CONFIRM = 3'd2;
parameter STORE   = 3'd3;
parameter THANKS  = 3'd4;

initial begin
    state = IDLE;
end

always @(posedge clk)
begin
    case(state)

    IDLE:
        if(vote_btn)
            state <= SELECT;

    SELECT:
        state <= CONFIRM;

    CONFIRM:
        state <= STORE;

    STORE:
        state <= THANKS;

    THANKS:
        state <= IDLE;

    default:
        state <= IDLE;

    endcase
end

endmodule