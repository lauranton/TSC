interface instr_register_ifc (input logic clk);
 import instr_register_pkg::*; 
    logic          load_en;
    logic          reset_n;
    operand_t      operand_a;
    operand_t      operand_b;
    opcode_t       opcode;
    address_t      write_pointer;
    address_t      read_pointer;
    instruction_t  instruction_word;

    clocking cb_dut @(clk)       ;
        output   load_en         ;
        output   reset_n         ;
        output   operand_a       ;
        output   operand_b       ;
        output   opcode          ;
        output   write_pointer   ;
        output   read_pointer    ;
        input    instruction_word;
    endclocking;


/*
    clocking cb_test @(clk);
        input logic          load_en,
        input logic          reset_n,
        input operand_t      operand_a,
        input operand_t      operand_b,
        input opcode_t       opcode,
        input address_t      write_pointer,
        input address_t      read_pointer,
        output  instruction_t  instruction_word
    endclocking;
*/
endinterface