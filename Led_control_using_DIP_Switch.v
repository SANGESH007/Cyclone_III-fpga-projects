module count_test(
    input wire sw0,  // Switch 0
    input wire sw1,  // Switch 1
    input wire sw2,  // Switch 2
    input wire sw3,  // Switch 3
    input wire sw4,  // Switch 4
    input wire sw5,  // Switch 5
    input wire sw6,  // Switch 6
    input wire sw7,  // Switch 7
    output reg led0,  // LED 0
    output reg led1,  // LED 1
    output reg led2,  // LED 2
    output reg led3,  // LED 3
    output reg led4,  // LED 4
    output reg led5,  // LED 5
    output reg led6,  // LED 6
    output reg led7   // LED 7
);

// Assign each switch value to its corresponding LED
always @(posedge sw0 or posedge sw1 or posedge sw2 or posedge sw3 or
          posedge sw4 or posedge sw5 or posedge sw6 or posedge sw7) begin
    led0 <= sw0;
    led1 <= sw1;
    led2 <= sw2;
    led3 <= sw3;
    led4 <= sw4;
    led5 <= sw5;
    led6 <= sw6;
    led7 <= sw7;
end

endmodule
