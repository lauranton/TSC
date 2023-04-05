/***********************************************************************
 * A SystemVerilog RTL model of an instruction regisgter
 *
 * An error can be injected into the design by invoking compilation with
 * the option:  +define+FORCE_LOAD_ERROR
 *
 **********************************************************************/

 // comentariu block se face cu /* */

module instr_register (tb_ifc.interf_dut instrRegIf);
 
timeunit 1ns/1ns;
import instr_register_pkg::*;
  instruction_t  iw_reg [0:31];  // an array of instruction_word structures
  rezultat_t     rez;

  // write to the register
  always@(posedge instrRegIf.clk, negedge instrRegIf.reset_n)   // write into register
    if (!instrRegIf.reset_n) begin
      foreach (iw_reg[i])
        iw_reg[i] = '{opc:ZERO,default:0};  // reset to all zeros
    end
    else if (instrRegIf.load_en) begin
      case(instrRegIf.opcode)
      PASSA: rez =instrRegIf.operand_a;
      PASSB: rez =instrRegIf.operand_b;
      ADD:   rez =instrRegIf.operand_a+instrRegIf.operand_b;
      SUB:   rez =instrRegIf.operand_a-instrRegIf.operand_b;
      MULT:  rez =instrRegIf.operand_a*instrRegIf.operand_b;
      DIV:   rez =instrRegIf.operand_a/instrRegIf.operand_b;
      MOD:   rez =instrRegIf.operand_a%instrRegIf.operand_b;
      endcase

      iw_reg[instrRegIf.write_pointer] = '{instrRegIf.opcode,instrRegIf.operand_a,instrRegIf.operand_b, rez};
    end

  // read from the register
  always@(posedge instrRegIf.clk, negedge instrRegIf.reset_n) begin
   instrRegIf.instruction_word <= iw_reg[instrRegIf.read_pointer];  // continuously read from register
  end
// compile with +define+FORCE_LOAD_ERROR to inject a functional bug for verification to catch
`ifdef FORCE_LOAD_ERROR
initial begin
  force instrRegIf.operand_b = instrRegIf.operand_a; // cause wrong value to be loaded into operand_b
end
`endif

endmodule : instr_register
