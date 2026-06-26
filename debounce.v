module debounce(
input clk,
input btn,
output reg clean
);

reg [15:0] count;

always @(posedge clk)
begin
    if(btn)
    begin
        if(count<16'hFFFF)
            count <= count + 1;
        else
            clean <= 1;
    end
    else
    begin
        count <= 0;
        clean <= 0;
    end
end

endmodule