`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    16:18:45 11/12/2019 
// Design Name: 
// Module Name:    controlUnit.v
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This implements our multicycle control
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: The template for this code was found on our CSSE232 resource page
//
//////////////////////////////////////////////////////////////////////////////////

module controlUnit (	
								  popAmt,
                          ESOp,
                          ESAct,
								  IRWrite,
                          ALUSrcB,
                          ALUOp,
								  PCSrc,
								  PushSrc,
								  ShiftSrc,
								  ShamtSrc,
								  RegWrite,
								  IorD,
								  wea,
								  PCWrite,
								  BEQCond,
								  BNECond,
								  RegDst,

                          Opcode,
								  funct,
                          current_state,
                          next_state,
                          CLK,
                          Reset
                          );
								  
	output   popAmt;

   output [1:0] ESOp;
   output   ESAct;

   output ALUSrcB;
   output [1:0] ALUOp;
   output [1:0] PCSrc;
	output [2:0] PushSrc;
	output	ShiftSrc;
	output	ShamtSrc;
	output	RegWrite;
	output	IorD;
	output	wea;
	output	PCWrite;
	output	BEQCond;
	output	BNECond;
   output   RegDst;
   output   IRWrite;

   
   output [4:0] current_state;
   output [4:0] next_state;

   input [3:0]  Opcode;
	input	[1:0]  funct;

   input        CLK;
   input        Reset;

   reg [1:0]    ALUOp;
   reg [1:0]    PCSrc;
   reg 		    ALUSrcB;
   reg          RegDst;
   reg          RegWrite;
   reg          IorD;
   reg          IRWrite;
   reg          PCWrite;
   
	reg [2:0]	 PushSrc;
	reg			 wea;

	reg			 BNECond;
	reg			 BEQCond;
	reg			 ESAct;
	reg			 ShiftSrc;
	reg			 ShamtSrc;
	reg [1:0]	 ESOp;
	reg			 popAmt;


   //state flip-flops
   reg [4:0]    current_state;
   reg [4:0]    next_state;

   //state definitions
   parameter    Fetch = 0;
   parameter    Decode = 1;
   parameter    DUP = 2;
   parameter    BEQ = 3;
   parameter    BNE = 4;
	parameter	 BEQBNE2 = 5;
   parameter    SLT1 = 6;
   parameter    LS1 = 7;
	parameter	 LS2 = 8;
   parameter    J1 = 9;
	parameter	 J2 = 10;
   parameter    JS1 = 11;
	parameter	 JS2 = 12;
	parameter	 FLIP = 13;
	parameter	 OR1 = 14;
	parameter	 ARITHMETIC2 = 15;
	parameter	 ARITHMETIC3 = 16;
	parameter	 ADD1 = 17;
	parameter	 SUB1 = 18;
	parameter	 POPM1 = 19;
	parameter	 POPM2 = 20;
	parameter	 POPM3 = 21;
	parameter	 PUSHM1 = 22;
	parameter	 PUSHM2 = 23;
	parameter	 PUSHM3 = 24;
	parameter	 PUSHM4 = 25;
	parameter	 POPR1 = 26;
	parameter    PUSHR1 = 27;
	parameter	 PUSHR2 = 28;
	parameter	 PUSHLI = 29;
	parameter	 PUSHUI1 = 30;
	parameter	 PUSHUI2 = 31;

   //register calculation
   always @ (posedge CLK, posedge Reset)
     begin
        if (Reset)
          current_state = Fetch; 
        else
          current_state = next_state;
     end


   //OUTPUT signals for each state (depends on current state)
   always @ (current_state)
     begin
        //Reset all signals that cannot be don't cares
        case (current_state)
          
          Fetch:
            begin
               PCSrc <= 2'b00;
					PCWrite <= 1;
					BEQCond <= 0;
					BNECond <= 0;
					
					IorD <= 0;
					IRWrite <= 1;
					wea <= 0;
					
					RegDst <= 0;
					RegWrite <= 0;
					
					ESAct <= 0;
            end 
                         
          Decode:
            begin
               IRWrite <= 0;
					ShiftSrc <= 0;
					ShamtSrc <= 1;
					
					ESAct <= 0;
					PCWrite <= 0;
					
					PushSrc <= 0;
            end
        
          DUP:
            begin
				//correct last stage
               ESAct <= 1'b1;
					ESOp <= 2'b10;
            end
        
          BEQ:
            begin
				//correct
               ALUSrcB <= 2'b00;
					ALUOp <= 2'b10;
					
					PCSrc <=2'b01;
					
					
					BEQCond <= 2'b1;
					BNECond <= 2'b0;
            end
        
          BNE:
            begin
				//correct
               ALUSrcB <= 2'b00;
					ALUOp <= 2'b10;
					PCSrc <= 2'b01;
					BEQCond <= 0;
					BNECond <= 1'b1;		
            end
				
			BEQBNE2:
				begin
				//correct last stage
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 1;
					
					BEQCond <= 0;
					BNECond <= 0;
				end
        
          SLT1:
            begin
				//correct
               ALUSrcB <= 2'b00;
					ALUOp <= 2'b11;
					
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 1;
            end
          

			ARITHMETIC3:
				begin
				//correct last stage
					ESAct <= 1;
					ESOp <= 2'b00;
				end
				
			LS1:
            begin
				//correct
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 0;			
					PushSrc <= 3'b010;
            end
				
			LS2:
				begin
				//correct last stage
					ESAct <= 1;
					ESOp <= 2'b00;
				end
				
			J1:
            begin
				//correct
					PCWrite <= 1;
					PCSrc <= 2'b01;
            end
				
			J2:
				begin
				//correct last stage
					PCWrite <= 0;
				end
				
			JS1:
            begin
				//correct
					PCSrc <= 2'b10;
					PCWrite <= 1;
            end
				
			JS2:
				begin
				//correct last stage
					PCWrite <= 0;
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 0;
				end
				
			FLIP:
            begin
				//probably correct and last stage
					ESAct <= 1;
					ESOp <= 2'b11;
            end
				
			OR1:
            begin
				//correct
					ALUSrcB <= 0;
					ALUOp <= 2'b00;	
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 1;
            end
				
			ARITHMETIC2:
            begin
				//correct
					ESAct <= 0;
					PushSrc <= 3'b101;
            end
				
			ADD1:
            begin
				//correct
					ALUSrcB <= 0;
					ALUOp <= 2'b01;				
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 1;
            end

			SUB1:
            begin
				//correct
					ALUSrcB <= 0;
					ALUOp <= 2'b10;			
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 1;
            end
				
			POPM1:
            begin
					ESOp <= 01;
					popAmt <= 1;
					ALUSrcB <= 1;
					ALUOp <= 2'b01;
            end
				
			POPM2:
            begin
					IorD <= 1;
					wea <= 1;
					ESAct <= 1;
            end
				
			POPM3:
				begin
					ESAct <= 0;
					IorD <= 0;
					wea <= 0;
				end
				
			PUSHM1:
            begin
				//correct
					ALUSrcB <= 1;
					ALUOp <= 2'b01;
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 0;			
					PushSrc <= 3'b011;
            end
				
			PUSHM2:
            begin
				//correct 
					IorD <= 1;
					ESAct <= 0;
            end
				
			PUSHM3:
            begin
				//correct
					IorD <= 0;
            end
				
			PUSHM4:
			begin
			//correct last instruction
				IorD <= 0;
				ESAct <= 1;
				ESOp <= 0;
			end
			
			POPR1:
            begin
				//correct last instruction
					ESAct <= 1;
					ESOp <= 2'b01;
					popAmt <= 0;
					RegWrite <= 1;
            end

			PUSHR1:
            begin
					ESAct <= 0;
					PushSrc <= 3'b100;
            end
				
			PUSHR2:
            begin
					ESAct <= 1;
					ESOp <= 0;
            end
				
			PUSHLI:
            begin
				//correct last instruction
					ESAct <= 1;
					ESOp <= 2'b00;
            end
				
			PUSHUI1:
            begin
					ShamtSrc <= 0;
					ESAct <= 0;
					ShiftSrc <= 1;
					PushSrc <= 3'b010;		
            end
				
			PUSHUI2:
            begin
					ESAct <= 1;
					ESOp <= 0;
            end

         default:
            begin
					ESAct <= 1;
					ESOp <= 0;
				end
				
        endcase
     end
                
   //NEXT STATE calculation (depends on current state and opcode)       
   always @ (current_state, next_state, Opcode)
     begin         
        
        case (current_state)
          
          Fetch:
            begin
               next_state <= Decode;
            end
          
          Decode: 
            begin       
               case (Opcode)
                 0:
						 begin
							if(funct == 0)
									next_state <= PUSHM1;
							else ;
							
							if(funct == 1) 
									next_state <= PUSHR1;
							else ;

						 end
                 1:
                   begin
								if(funct == 0) 
										next_state <= POPM1;
								else ;
								
								if(funct == 1)
										next_state <= POPR1;
								else ;

                   end
                 2: next_state <= PUSHLI;
                 3: next_state <= PUSHUI1;
                 4: next_state <= DUP;
					  5: next_state <= FLIP;
                 6: next_state <= OR1;
                 7: next_state <= ADD1;
                 8: next_state <= SUB1;
                 9: next_state <= LS1;	
                 10: next_state <= LS1;
                 11: next_state <= SLT1;
                 12: next_state <= BEQ;	
                 13: next_state <= BNE;
                 14: next_state <= J1;
                 15: next_state <= JS1;					 
                 default:   
                      next_state <= Fetch; 
               endcase  
            end
				
			PUSHLI:
				begin
					next_state <= Fetch;
				end
          
          PUSHM1:
            begin
               next_state <= PUSHM2;
            end
          PUSHM2:
            begin
               next_state <= PUSHM3;
            end
				PUSHM3:
					begin
						next_state <= PUSHM4;
					end
				PUSHM4:
				begin
					next_state <= Fetch;
				end
          
          PUSHR1:
            begin
               next_state <= PUSHR2;
            end
				
				PUSHR2:
				begin
					next_state <= Fetch;
				end
          
          POPM1:
            begin
               next_state <= POPM2;
            end
				
			 POPM2:
				begin
					next_state <= POPM3;
				end
				
			 POPM3:
				begin
					next_state <= Fetch;
				end

          POPR1:
            begin
               next_state <= Fetch;
            end
				
			SUB1:
				begin
					next_state <= ARITHMETIC2;
				end
			 
          OR1:
            begin
               next_state <= ARITHMETIC2;
            end
				
          ADD1:
            begin
               next_state <= ARITHMETIC2;
            end
				
			ARITHMETIC2:
				begin
					next_state <= ARITHMETIC3;
				end
				
			ARITHMETIC3:
				begin
					next_state <= Fetch;
				end
				
          PUSHUI1:
            begin
               next_state <= PUSHUI2;
            end
				
			 PUSHUI2:
				begin
					next_state <= Fetch;
				end
				
			BEQ:
				begin
					next_state <= BEQBNE2;
				end
				
			BNE:
				begin
					next_state <= BEQBNE2;
				end
				
			BEQBNE2:
				begin
					next_state <= Fetch;
				end
				
			J1:
				begin
					next_state <= J2;
				end
				
			J2:
				begin
					next_state <= Fetch;
				end
				
			JS1:
				begin
					next_state <= JS2;
				end
				
			JS2:
				begin
					next_state <= Fetch;
				end
				
			LS1:
				begin
					next_state <= LS2;
				end
				
			LS2:
				begin
					next_state <= Fetch;
				end
				
			SLT1:
				begin
					next_state <= ARITHMETIC2;
				end
          
          default:
            begin
               next_state <= Fetch;
            end
          
        endcase         
     end
endmodule
