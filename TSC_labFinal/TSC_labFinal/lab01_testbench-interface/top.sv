/***********************************************************************
 * A SystemVerilog top-level netlist to connect testbench to DUT
 **********************************************************************/

module top;
  timeunit 1ns/1ns; //directiva de compilator

  // user-defined types are defined in instr_register_pkg.sv
  import instr_register_pkg::*;

  logic clk; // stari 0,1,x-nu stiu daca e 0 sau 1,z-inalta impedanta
  logic test_clk;

  tb_ifc instrRegIf(clk, test_clk);
  instr_register dut (instrRegIf);
    // instantiate testbench and connect ports
  instr_register_test test (instrRegIf);
  
  initial begin
    clk <= 0; // se atribuie 0
    forever #5  clk = ~clk;
  end

  initial begin
    test_clk <=0;
    // offset test_clk edges from clk to prevent races between
    // the testbench and the design
    #4 forever begin
      #2ns test_clk = 1'b1;
      #8ns test_clk = 1'b0;
    end
  end

 

  // instantiate design and connect ports
  //module instr_register test instantiaza dut


  // clock oscillators


endmodule: top
