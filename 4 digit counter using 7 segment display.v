
module sevensegment(
    input clock_50Mhz, // 50 Mhz clock source cyclone III
    input reset, // reset   
    output reg [0:3] an, // anode signals of the 7-segment LED display
    output reg [6:0] seg// cathode patterns of the 7-segment LED display
    );
    reg [25:0] one_second_counter; // counter for generating 1 second clock enable
    wire one_second_enable;// one second enable for counting numbers
    reg [15:0] displayed_number; // counting number to be displayed
    reg [3:0] LED_BCD;
    reg [18:0] refresh_counter; // 19-bit for creating 10.5ms refresh period 
             // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms an period
    wire [1:0] LED_activating_counter;
                 // count     0    ->  1  ->  2  ->  3
              // activates    LED1    LED2   LED3   LED4
             // and repeat
    always @(posedge clock_50Mhz or negedge reset)
    begin
        if(!reset)
            one_second_counter <= 0;
        else begin
            if(one_second_counter>=49999999)
                 one_second_counter <= 0;
            else
                one_second_counter <= one_second_counter + 1;
        end
    end
    assign one_second_enable = (one_second_counter==49999999)?1:0;
    always @(posedge clock_50Mhz or negedge reset)
    begin
        if(!reset)
            displayed_number <= 0;
        else if(one_second_enable==1)
            displayed_number <= displayed_number + 1;
    end
    always @(posedge clock_50Mhz or negedge reset)
    begin
        if(!reset)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    assign LED_activating_counter = refresh_counter[18:17];
    // anode activating signals for 4 LEDs, an period of 2.6ms
    // decoder to generate anode signals
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            an = 4'b0001;
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = displayed_number/1000;
            // the first an of the 16-bit number
              end
        2'b01: begin
            an = 4'b0010;
            // activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD = (displayed_number % 1000)/100;
            // the second an of the 16-bit number
              end
        2'b10: begin
            an = 4'b0100;
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = ((displayed_number % 1000)%100)/10;
            // the third an of the 16-bit number
                end
        2'b11: begin
            an = 4'b1000;
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = ((displayed_number % 1000)%100)%10;
            // the fourth an of the 16-bit number   
               end
        endcase
    end
    // Cathode patterns of the 7-segment LED display
    always @(*)
    begin
        case(LED_BCD)
        4'b0000: seg = 7'b0000001; // "0"    
        4'b0001: seg = 7'b1001111; // "1"
        4'b0010: seg = 7'b0010010; // "2"
        4'b0011: seg = 7'b0000110; // "3"
        4'b0100: seg = 7'b1001100; // "4"
        4'b0101: seg = 7'b0100100; // "5"
        4'b0110: seg = 7'b0100000; // "6"
        4'b0111: seg = 7'b0001111; // "7"
        4'b1000: seg = 7'b0000000; // "8"    
        4'b1001: seg = 7'b0000100; // "9"
        default: seg = 7'b0000001; // "0"
        endcase
    end
endmodule
