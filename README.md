
# Intel Altera Cyclone III Development Board

This project contains some basic applications using the Intel Altera Cyclone III Development Board (EPC120F780C7N). For IDE used for programming and debugging is Intel® Quartus® II Web Edition Design Software, Version 13.1


## Demo

 - [8 Bit Binary led counter](https://youtube.com/shorts/R_yrqfv4rLE)
 - [Led control using DIP switch](https://youtube.com/shorts/9cal9GdoREI)
 - [BCD counter using 7 Segment Display](https://youtu.be/d0OU5BRxKJw)
  - [0-9999 Counter using 7 Segment Display](https://youtube.com/shorts/jOLU4ZXO2Is)



## Appendix

The Quartus last version Which supports Cyclone III FPGA is Intel® Quartus® II Web Edition Design Software, Version 13.1


## Installation and Programming

click on this [link](https://cdrdv2.intel.com/v1/dl/getContent/666221/666239?filename=Quartus-web-13.1.0.162-windows.tar) and download the software

Create New project Wizard-> Next -> Select the working directory and file name -> give file name -> Next -> In Board select, select Cyclone III -> In available devices, select EP3C120F780C7 -> In simulation Select Modelsim Altera and select Verilog or VHDL -> Next -> Finish

File -> New -> Select Verilog HDL file -> ok -> start to program

Important point: the Module name and the Top Level Entity must be same.

After programming, save the file and click Start Compilation.

After successul Compilation, click on Assignment and click Pin Planner. Select the Appropriate Inputs and Outputs as per the Documentation and the connections.

place the pin according to the [Document](https://drive.google.com/drive/folders/1hcbWTk_HhavaNmXQZZA9CjDDyQFLOgkm?usp=sharing)

After completing the pin assignment, Click on Programmer -> Hardware Setup -> Currently selected hardware -> select usb -> close 

Click on Add Files -> in Output Files, select FILENAME.sof -> click start

Now the device will start to program and works as per the code if no error is occured





    
