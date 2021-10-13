import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
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
	
	
	private JFileChooser fileChooser;
	
	private int layersWidth;
	private int layersHeight;
	
	public Parser(){
		
		this.fileChooser = new JFileChooser();	
		
		
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

	
	
public ArrayList<ArrayList<String>> open(){
	
	
	
	
		try {
			
			this.fileChooser.showOpenDialog(null);
			File file = this.fileChooser.getSelectedFile();
			
			System.out.println(file.toString());
			Scanner lineScanner = new Scanner(file);
			
			
			
			ArrayList<ArrayList<String>> total = new ArrayList<>();
			ArrayList<String> internal = new ArrayList<>();
						

			int addr = 0xE000;
			while(lineScanner.hasNextLine()) {
				String line = lineScanner.nextLine();
				Scanner scanner = new Scanner(line);
				scanner.useDelimiter(" ");
				
				while(scanner.hasNext()) {
					String next = scanner.next();
					if(next.length() == 0) break;
					
					//handle comments
					if(next.charAt(0) == '#') {
						break;
					}
					//Handle Labels
					if(next.charAt(next.length()-1) == ':') {
						next = next.substring(0, next.length()-1);
						this.LABELS.put(next, Integer.toBinaryString(addr).substring(4));
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
		this.fileChooser.showOpenDialog(null);
		File file = this.fileChooser.getSelectedFile();
		BufferedWriter writer = new BufferedWriter(new FileWriter(file));
		
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
				
				
				sb.append("0000");
				sb.append("," + System.lineSeparator());
			}
			
			//j/ beq/ bne
			else if(command.equals("beq") || command.equals("bne") || command.equals("j")) {

				String label = instruction.get(2);
				String hexAddr = this.LABELS.get(label);
				sb.append(hexAddr);
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
				int intShamt = Integer.parseInt(shamt)-1;
				String binShamt = Integer.toBinaryString(intShamt);
				
				if(binShamt.length() == 5){
					sb.append(binShamt);
					}
				else if(binShamt.length() > 5){
					sb.append(binShamt.substring(binShamt.length()-5));
				}else{
					if (intShamt >= 0){
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
