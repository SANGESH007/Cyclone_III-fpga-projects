module led_counter(
    input wire clk,      // 50 MHz input clock
    output reg [7:0] led, // 8 LEDs for displaying the binary count
    output reg clk_out    // 1 Hz clock output
);

reg [26:0] counter; // 27-bit counter for binary count

// Clock divider to generate 1 Hz signal
reg [24:0] div_counter;
reg clk_1hz;

always @(posedge clk_out) begin
    // Increment the counter on each rising edge of the input clock
    counter <= counter + 1;

    // Output the 8 LSBs of the counter to the LEDs
      led <= counter[7:0];
end

always @(posedge clk) begin
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

endmodule
