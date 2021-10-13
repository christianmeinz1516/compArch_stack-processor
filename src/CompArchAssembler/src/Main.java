import java.util.ArrayList;
import java.util.HashMap;

public class Main {
	
	
	
	/*
	 * How to use:
	 * Run main. First dialog box is the file you wish to assemble
	 * Second is the file you wish to write the machine code to
	 * WHATEVER FILE YOU PICK FOR THE SECOND BOX WILL BE OVERWRITTEN
	 * So don't pick the same file twice.
	 * 
	 * ISSUES: I'm worried that the shamt and dup items might not go the right
	 * amount of bits since I didn't make a trimming thing for them.
	 * There are no dups or shifts in the current relPrime so I'm not 100 positive.
	 * 
	 * Improvements: Needs more extensive testing. I haven't gone through every line to make sure
	 * it matches our machine code. Will work on that. RELPRIME MATCHES :)
	 */
	public static void main(String[] args){
		
		Parser p = new Parser();
		p.preWrite();
		ArrayList<ArrayList<String>> text = p.open();
		p.write(text);
		
		
		
		
		
		
		
	}
}
