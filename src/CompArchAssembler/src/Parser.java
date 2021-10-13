import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import javax.swing.JFileChooser;

public class Parser {
	

	private static final String BREAK_STRING = "BREAK";
	private static final String END_STRING = "END";
	
	private static final String BREAK_CHAR = BREAK_STRING + " ";
	private static final String END_CHAR = END_STRING;
	public HashMap<String, String> LABELS = new HashMap<>();
	public HashMap<String, String> REGISTERS = new HashMap<>();
	public HashMap<String, String> OPCODES = new HashMap<>();
	public HashMap<String, String> FUNCTS = new HashMap<>();
	public File fileToOpen;
	public File fileToWrite;
	
	
	private JFileChooser fileChooser;
	
	private int layersWidth;
	private int layersHeight;
	
	public Parser(){
		
		this.fileChooser = new JFileChooser();	
		System.out.println("Please Select a file to read from.");
		this.fileChooser.showOpenDialog(null);
		this.fileToOpen = this.fileChooser.getSelectedFile();
		System.out.println("File to read from: " + this.fileToOpen);
		System.out.println();
		
		System.out.println("Please Select a file to write to.");
		this.fileChooser.showOpenDialog(null);
		this.fileToWrite = this.fileChooser.getSelectedFile();
		System.out.println("File to write to: " + this.fileToWrite);
		
		
		OPCODES.put("pushM", "0000");
		OPCODES.put("popM", "0001");
		OPCODES.put("pushR", "0000");
		OPCODES.put("popR", "0001");
		OPCODES.put("pushLi", "0010");
		OPCODES.put("pushUi", "0011");
		OPCODES.put("dup", "0100");
		OPCODES.put("flip", "0101");
		OPCODES.put("or", "0110");
		OPCODES.put("add", "0111");
		OPCODES.put("sub", "1000");
		OPCODES.put("ls", "1001");
		OPCODES.put("as", "1010");
		OPCODES.put("slt", "1011");
		OPCODES.put("beq", "1100");
		OPCODES.put("bne", "1101");
		OPCODES.put("j", "1110");
		OPCODES.put("js", "1111");
		
		
		REGISTERS.put("$sp", "01");
		REGISTERS.put("$v0", "00");
		REGISTERS.put("$gp", "10");
		REGISTERS.put("$0", "11");
		REGISTERS.put("$zero", "11");
		
		
		FUNCTS.put("pushM", "00");
		FUNCTS.put("popM", "00");
		FUNCTS.put("pushR", "01");
		FUNCTS.put("popR",  "01");
		
	}

/*
 * This method does a prescan to convert pseudocodes into
 * actual assembly code. Takes the original document, converts the pseucode,
 * writes the actual assembly to  the write document.
 * The write document will then be used in "open" to convert to machine code.	
 */
public void preWrite() {
	StringBuilder sb = new StringBuilder();
	try {
		Scanner lineScanner = new Scanner(this.fileToOpen);
		while(lineScanner.hasNextLine()) {
			String line = lineScanner.nextLine();
			Scanner scanner = new Scanner(line);
			scanner.useDelimiter(" ");
			//TO CONVERT FROM HEX TO DECIMAL OR BINARY TO DECIMAL
			//Just do the parse int on it and then convert it to decimal
			//since that's what already works
			//Do that here and then don't worry about it in open
			
			while(scanner.hasNext()){
				String next = scanner.next();
				if(next.length() == 0) break;
				if(next.charAt(0) == '#') break;
				//handle binary or hex 0b or 0x
				if(next.length() > 1 && next.charAt(1) == 'x') {
					String hex = next.substring(2);
					sb.append(Integer.parseInt(hex,16));
				}else if(next.length() > 1 && next.charAt(1) == 'b') {
					String bin = next.substring(2);
					sb.append(Integer.parseInt(bin,2));
				}else {
				
					if(next.equals("push")) {
						//pushLi, pushUi, or
						//now get lower 8 bits
						String imm = scanner.next();
						
						
						
						
						int binImm = 0;
						if(imm.charAt(1) == 'x') {
							String hex = imm.substring(2);
							binImm = Integer.parseInt(hex,16);
						}else if(imm.charAt(1) == 'b') {
							String bin = imm.substring(2);
							binImm = Integer.parseInt(bin,2);
						}else {
							binImm = Integer.parseInt(imm);
						}
						String binImmStr = Integer.toBinaryString(binImm);
						
						//now we have a binary string. Make it 16 bits.
						StringBuilder convertTo16 = new StringBuilder();
						
						if(binImmStr.length() == 16){
							convertTo16.append(binImmStr);
							}
						else if(binImmStr.length() > 16){
							convertTo16.append(binImmStr.substring(binImmStr.length()-16));
						}else{
								for(int i = binImmStr.length()-1; i < 15; i++){
									convertTo16.append("0");
								}
								convertTo16.append(binImmStr);
							
						}
						
						
						sb.append("pushLi ");
						int lower = Integer.parseInt(convertTo16.toString().substring(8),2);
						sb.append(Integer.toString(lower));
						sb.append(System.lineSeparator());
						int upper = Integer.parseInt(convertTo16.toString().substring(0, 8),2);
						sb.append("pushUi ");
						sb.append(Integer.toString(upper));
						sb.append(System.lineSeparator());
						sb.append("or " + System.lineSeparator());
						
						
						
						
					}else if(next.equals("blt")) {
						sb.append("slt" + System.lineSeparator());
						sb.append("pushLi 1" + System.lineSeparator());
						sb.append("beq " + scanner.next() + System.lineSeparator());
					}else if(next.equals("bgt")) {
						sb.append("flip" + System.lineSeparator());
						sb.append("slt" + System.lineSeparator());
						sb.append("pushLi 1" + System.lineSeparator());
						sb.append("beq " + scanner.next() + System.lineSeparator());
					}else if(next.equals("ble")) {
						sb.append("flip" + System.lineSeparator());
						sb.append("slt" + System.lineSeparator());
						sb.append("pushLi 1" + System.lineSeparator());
						sb.append("bne " + scanner.next() + System.lineSeparator());
					}else if(next.equals("bge")) {
						sb.append("slt" + System.lineSeparator());
						sb.append("pushLi 1" + System.lineSeparator());
						sb.append("bne " + scanner.next() + System.lineSeparator());
					}
					else {
						sb.append(next + " ");
					}
				}
				
			}
			sb.append(System.lineSeparator());
			
			scanner.close();
		}
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println(sb.toString());
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		lineScanner.close();
		
	} catch (FileNotFoundException e) {
		System.out.println("Could not open file");
		e.printStackTrace();
	}
	
	

	try {
		BufferedWriter writer = new BufferedWriter(new FileWriter(this.fileToWrite));
		writer.write(sb.toString());
		writer.close();
	} catch (IOException e) {
		System.out.println("Could not write to file");
		e.printStackTrace();
	}
	
}
	
	
	
public ArrayList<ArrayList<String>> open(){
	
	
	
	
		try {
			
			
			Scanner lineScanner = new Scanner(this.fileToWrite);
			
			
			
			ArrayList<ArrayList<String>> total = new ArrayList<>();
			ArrayList<String> internal = new ArrayList<>();
						

			int addr = 0xfc00;
			while(lineScanner.hasNextLine()) {
				String line = lineScanner.nextLine();
				Scanner scanner = new Scanner(line);
				scanner.useDelimiter(" ");
				
				while(scanner.hasNext()) {
					String next = scanner.next();
					//Handle Labels
					if(next.charAt(next.length()-1) == ':') {
						next = next.substring(0, next.length()-1);
						this.LABELS.put(next, Integer.toBinaryString(addr));
					}else {
						if(internal.isEmpty()) {
							internal.add(Integer.toHexString(addr));
							addr += 1;
						}
						internal.add(next);
					}					
				}
				
				if(!internal.isEmpty()) {
					total.add(internal);
				}
				
				internal = new ArrayList<>();
				scanner.close();
			}
			
			System.out.println(total);
			System.out.println(this.LABELS.toString());
			System.out.println(System.lineSeparator());
			lineScanner.close();
			return total;
			
		}
		
		catch (Exception e){
			e.printStackTrace();
			System.out.println("ERROR: Could Not Open File");
		}
		
		return (null);
	}





public void write(ArrayList<ArrayList<String>> text) {
	
	try {
		BufferedWriter writer = new BufferedWriter(new FileWriter(this.fileToWrite));
		
		StringBuilder sb = new StringBuilder();
		sb.append("MEMORY_INITIALIZATION_RADIX=2;\r\n" + 
				"MEMORY_INITIALIZATION_VECTOR=\r\n");
		
		for (ArrayList<String> instruction : text) {
			//opcode
			String command = instruction.get(1);
			
			
			sb.append(this.OPCODES.get(command));
			
			if(command.equals("add") || command.equals("or") || command.equals("sub") || command.equals("flip") || command.equals("js") || command.equals("slt")) {
				//append zeros
				sb.append("000000000000");
				sb.append("," + System.lineSeparator());
			}
			//now let's do pushing and popping
			//pushM and popM
			else if (command.equals("pushM") || command.equals("popM")){
				String offset = instruction.get(2);
				int intOffset = Integer.parseInt(offset);
				String binOffset = Integer.toBinaryString(intOffset);
				
				if(binOffset.length() == 8){
					sb.append(binOffset);
					}
				else if(binOffset.length() > 8){
					sb.append(binOffset.substring(binOffset.length()-8));
				}else{
					if (intOffset >= 0){
						for(int i = binOffset.length()-1; i < 7; i++){
						sb.append("0");
						}
						sb.append(binOffset);
					}
					else{
						for(int i = binOffset.length()-1; i < 7; i++){
						sb.append("1");
						}
						sb.append(binOffset);
					}
					
					}
				
				sb.append(this.FUNCTS.get(command));
				sb.append("00");
				sb.append("," + System.lineSeparator());
			}
			//pushR, popR
			else if (command.equals("pushR") || command.equals("popR")) {
				sb.append("00000000");
				sb.append(this.FUNCTS.get(command));
				sb.append(this.REGISTERS.get(instruction.get(2)));
				sb.append("," + System.lineSeparator());
			}
			//pushLi and pushUi
			else if(command.equals("pushLi") || command.equals("pushUi")) {
				String imm = instruction.get(2);
				if(this.LABELS.containsKey(imm)) {
					if(command.equals("pushLi")) {
						sb.append(this.LABELS.get(imm).substring(8));
					} else {
						sb.append(this.LABELS.get(imm).substring(0, 8));
					}
				}else {
					int intImm = Integer.parseInt(imm);
					String binImm = Integer.toBinaryString(intImm);
					
					
					if(binImm.length() == 8){
						sb.append(binImm);
						}
					else if(binImm.length() > 8){
						sb.append(binImm.substring(binImm.length()-8));
					}else{
						if (intImm >= 0){
							for(int i = binImm.length()-1; i < 7; i++){
							sb.append("0");
							}
							sb.append(binImm);
						}
						else{
							for(int i = binImm.length()-1; i < 7; i++){
							sb.append("1");
							}
							sb.append(binImm);
						}
						
						}
					
					
					
				}
				sb.append("0000");
				sb.append("," + System.lineSeparator());
			}
			
			//j/ beq/ bne
			else if(command.equals("beq") || command.equals("bne") || command.equals("j")) {

				String label = instruction.get(2);
				String hexAddr = this.LABELS.get(label);
				sb.append(hexAddr.substring(4));
				sb.append("," + System.lineSeparator());
			}
			
			//dup
			else if(command.equals("dup")) {
				sb.append("0000000000");
				String imm = instruction.get(2);
				int intImm = Integer.parseInt(imm);
				String binImm = Integer.toBinaryString(intImm);
				
				if(binImm.length() == 2){
					sb.append(binImm);
					}
				else if(binImm.length() > 2){
					sb.append(binImm.substring(binImm.length()-2));
				}else{
					if (intImm >= 0){
						for(int i = binImm.length()-1; i < 1; i++){
						sb.append("0");
						}
						sb.append(binImm);
					}
					else{
						for(int i = binImm.length()-1; i < 1; i++){
						sb.append("1");
						}
						sb.append(binImm);
					}
					
					}
				sb.append("," + System.lineSeparator());
			}
			//shift
			else {
				sb.append("00000");
				String shamt = instruction.get(2);
				int intShamt = Integer.parseInt(shamt);
				if(shamt.charAt(0) == '0') {
					intShamt -= 1;
				}
				System.out.println("Shamt: " + shamt);
				System.out.println("intShamt: " + Integer.toString(intShamt));
				String binShamt = Integer.toBinaryString(intShamt);
				System.out.println("BinShamt: " + binShamt);
				
				if(binShamt.length() == 5){
					sb.append(binShamt);
					}
				else if(binShamt.length() > 5){
					sb.append(binShamt.substring(binShamt.length()-5));
				}else{
					if (shamt.charAt(0) == '0'){
						for(int i = binShamt.length()-1; i < 4; i++){
						sb.append("0");
						}
						sb.append(binShamt);
					}
					else{
						for(int i = binShamt.length()-1; i < 4; i++){
						sb.append("1");
						}
						sb.append(binShamt);
					}
					
					}
				sb.append("00");
				sb.append("," + System.lineSeparator());
			}
						
		}

		sb.delete(sb.length()-3, sb.length());
		sb.append(";");
		System.out.println(sb.toString());
		writer.write(sb.toString());
		writer.close();
		
		
		
	}
	
	
	
	
	
	
	
	
	
	catch(Exception e) {
		e.printStackTrace();
		System.out.println("ERROR");
	}
	
	
	
	
	
	
	
	
	
}

}
