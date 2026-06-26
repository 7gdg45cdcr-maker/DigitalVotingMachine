module display_controller(
input [7:0] count,
output [6:0] seg
);

seven_seg_decoder S1(
.num(count[3:0]),
.seg(seg)
);

endmodule