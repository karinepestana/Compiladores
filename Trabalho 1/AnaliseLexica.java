import java.io.*;
import java.lang.String;

enum TokenType{ NUM,SOMA, MULT,APar,FPar, EOF, SUB, DIV}

class Token{
  String lexema;
  TokenType token;

//construtor
 Token (String l, TokenType t){
 	 lexema=l;
 	 token = t;
 }	

}

class AnaliseLexica {

	BufferedReader arquivo;
	boolean print = false;
	String number = "";
	int salvo = 0;

	AnaliseLexica(String a) throws Exception
	{
		
	 	this.arquivo = new BufferedReader(new FileReader(a));
		
	}

	Token getNextToken() throws Exception
	{	
		Token token;
		int eof = -1;
		char currchar = 0;
		int currchar1 = 0;

			if(!print){

				do{
					currchar1 =  arquivo.read();
					currchar = (char) currchar1;
				} while (currchar == '\n' || currchar == ' ' || currchar =='\t' || currchar == '\r');
			}
			else{
				number = "";
				print = false;				
				currchar1 = salvo;
				currchar = (char)currchar1;
			}

			if(currchar1 != eof && currchar1 !=10){
								
	
				if (currchar >= '0' && currchar <= '9'){
						
						while(currchar >= '0' && currchar <= '9'){
							number+=currchar;
							currchar1 =  arquivo.read();
							currchar = (char) currchar1;
							salvo =  (int)currchar;
						}
						print = true;
						return (new Token (number, TokenType.NUM));
					}			
				else{
				
					switch (currchar){
						case '(':
							return (new Token (Character.toString(currchar),TokenType.APar));			
						case ')':
							return (new Token (Character.toString(currchar),TokenType.FPar));						
						case '+':
							return (new Token (Character.toString(currchar),TokenType.SOMA));
						case '*':
							return (new Token (Character.toString(currchar),TokenType.MULT));
						case '-':
							return (new Token (Character.toString(currchar), TokenType.SUB));
						case '/':
							return (new Token (Character.toString(currchar), TokenType.DIV));
						
						default: throw (new Exception("Caractere inválido: " + ((int) currchar)));
					}
				
				}
			}

			arquivo.close();
			
		return (new Token(Character.toString(currchar),TokenType.EOF));
		
	}
}
