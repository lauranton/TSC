/***********************************************************************
 * A SystemVerilog RTL model of an instruction regisgter:
 * User-defined type definitions
 **********************************************************************/
package instr_register_pkg;
 timeunit 1ns/1ns;
/*typedef -definim un tip de date de utilizator*/
  typedef enum logic [3:0] {
  	ZERO,
    PASSA,
    PASSB,
    ADD,
    SUB,
    MULT,
    DIV,
    MOD
  } opcode_t;

/*logic signed- tip de data logic cu semn- signed= bitul 31 bit de semn */
  typedef logic signed [31:0] operand_t;
  typedef logic signed [63:0] rezultat_t;
  
  typedef logic [4:0] address_t;
  
  typedef struct {
    opcode_t  opc;
    operand_t op_a;
    operand_t op_b;
    rezultat_t op_r;
  } instruction_t;

endpackage: instr_register_pkg
