module eeprom_memory(
    input clk,
    input [1:0] candidate,
    input vote,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] C,
    output reg [7:0] D
);

initial begin
    A = 0;
    B = 0;
    C = 0;
    D = 0;
end

always @(posedge clk)
begin
    if(vote)
    begin
        case(candidate)
            2'b00: A <= A + 1;
            2'b01: B <= B + 1;
            2'b10: C <= C + 1;
            2'b11: D <= D + 1;
        endcase

        $display("Time=%0t A=%0d B=%0d C=%0d D=%0d",
                 $time,A,B,C,D);
    end
end

endmodule