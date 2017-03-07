module read(
input clk,
input INTR,
input WAIT,
output reg [1:0] MODE,
output reg A0,// 0-> index reg., 1-> data buffer
output reg CS0,CS1,RD, WR,
inout [7:0] Data   // NOT a reg.
);

 

reg [7:0] Dout = 0;

reg [5:0] state = set_CTRLB;
reg [7:0] din = 0;


initial begin

  A0 = 0;
  RD = 1; // "to write
  WR = 0; // to the chip"

  Dout = 8'b0;
  row = 0;
  col = 0;
  count = 0;
  state = set_CTRLB;
  end

 

assign Data = RD ? Dout : 8'bz;  // data bus driver is tri-state (disabled) when READing, RD is asserted LOW

 

always@ (posedge clk)
case (state)


set_CTRLB : begin
  CS0 <= 0; // "to select
  CS1 <= 1; // the chip"
  MODE <= 2'b00; // Microprocessor Bus Mode

  A0 <= 0;
  RD <= 1;
  WR <= 0;
  Dout <= 8'h09;             // here I am Writing to data pins //
  state <= write_CTRLB;
  end


write_CTRLB : begin
  A0 <= 1;
  Dout <= 8'b00001101;//  "   //
  state <= wait_30us;
  end

 

wait_30us :
  if (count == 360) state <= set1_CTRLA;
  else count <= count + 1;

 

set1_CTRLA : begin
  A0 <= 0;
  Dout <= 8'h08;//   "    //
  state <= read_CTRLA;
  end

 

read_CTRLA : begin
  RD <= 0;
  WR <= 1;
  if(count == 6) begin
    din <= Data; //  Here I am Reading from data pins Learn to use non-blocking assignments!
    state <= row_read;
    count <= 0;
    end
  else count <= count + 1;
  end

 

row_read :
  if (col == 256) state <= img_read;
  else begin
    col <= col + 1;
    state <= set1_CTRLA;
    end

img_read :
  if(row == 300) state <= last_case;
  else begin
    row <= row + 1;
    state <= set1_CTRLA;
    end

last_case : begin
    end

 

endcase

 

endmodule