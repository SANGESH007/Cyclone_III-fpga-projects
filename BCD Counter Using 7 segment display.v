module ledcount(
  input wire clk_50MHz,
  output reg [6:0] seg_led,
  output reg [0:3] an
 
);

 reg [24:0] div_counter; 
  reg clk_1hz;
  reg clk_out;
  reg [3:0] count;
  
  always @(posedge clk_50MHz) begin
  an= 4'b0001;
    // Generate a 25 MHz clock by dividing the input clock by 2
    clk_1hz <= ~clk_1hz;

    // Divide the 25 MHz clock to obtain a 1 Hz signal
    if (div_counter == 25000000) begin
        clk_out <= ~clk_out;
        div_counter <= 0;
    end else begin
        div_counter <= div_counter + 1;
		
    end
end

  always @(posedge clk_out) begin
  if (count==9)
  begin
  count=0;
  end
  else
  begin
  count = count + 1;
  end
  
    case (count[3:0])
      4'b0000: seg_led <= 7'b0000001; // 0
      4'b0001: seg_led <= 7'b1111001; // 1
      4'b0010: seg_led <= 7'b0010010; // 2
      4'b0011: seg_led <= 7'b0000110; // 3
      4'b0100: seg_led <= 7'b1001100; // 4
      4'b0101: seg_led <= 7'b0100100; // 5
      4'b0110: seg_led <= 7'b0100000; // 6
      4'b0111: seg_led <= 7'b0001111; // 7
      4'b1000: seg_led <= 7'b0000000; // 8
      4'b1001: seg_led <= 7'b0000100; // 9
      default: seg_led <= 7'b1111111; // All segments off for invalid count
    endcase
  end

endmodule
