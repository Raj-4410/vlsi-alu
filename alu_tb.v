`timescale 1ns / 1ps
module alu_tb;

  reg [3:0] A, B;
  reg [2:0] ALU_Sel;
  wire [3:0] ALU_Out;
  wire CarryOut;

  // Connect ALU to testbench
  alu_4bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
  );

  initial begin
    // Show values whenever they change
    $monitor("Time=%0t | A=%b | B=%b | Sel=%b | Out=%b | Carry=%b",
              $time, A, B, ALU_Sel, ALU_Out, CarryOut);

    // Test Addition
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b000; #10;
    // Test Subtraction
    A = 4'b1000; B = 4'b0010; ALU_Sel = 3'b001; #10;
    // Test AND
    A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b010; #10;
    // Test OR
    A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b011; #10;
    // Test XOR
    A = 4'b1111; B = 4'b0001; ALU_Sel = 3'b100; #10;
    // Test NOT
    A = 4'b1010; ALU_Sel = 3'b101; #10;
    // Test Shift Left
    A = 4'b0011; ALU_Sel = 3'b110; #10;
    // Test Shift Right
    A = 4'b1000; ALU_Sel = 3'b111; #10;

    $finish;
  end

endmodule
