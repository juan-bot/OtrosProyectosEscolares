package codigo;
import JFlex.Main;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import static java.time.Clock.system;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Principal {
    public static void main(String[] args){
        String ruta="C:/Users/The_l/Documents/NetBeansProjects/analizador/src/codigo/Lexer.flex";
        GenerarLexer(ruta);
        String entrada=" ";
        if(args.length>0)
            entrada=args[0];
        else
            entrada="codigo.txt";
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(entrada));
            Lexer a = new Lexer(br);
            Yytoken token=null;
            do{
                token = a.nextToken();
                System.out.println(token);
            }while(token!=null);
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    public static void GenerarLexer(String ruta){
        File archivo=new File(ruta);
        JFlex.Main.generate(archivo);
    }
}
