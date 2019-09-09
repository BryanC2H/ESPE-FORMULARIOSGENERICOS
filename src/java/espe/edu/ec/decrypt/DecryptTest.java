/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.decrypt;

import static java.lang.System.out;
import java.util.Arrays;

/**
 *
 * @author D4ve
 */
public class DecryptTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        DecryptSmAtrix dec = new DecryptSmAtrix();
        
        String code="[B@2cfb4a64";
        String code4="[B@2cfb4a64";
        String code2="bca374788f154aadf041b538a78e3d6a";
        String code3="3b601880af553fc10aba842074b8d4ee";
        
        byte  [] bytes = code.getBytes();
         //String codeB=bytes+"";
//        System.out.println(" bytes: "+codeB);
        boolean flag=false;
       
        try{
       System.out.println("ID encodeado"+Arrays.toString(dec.encrypt(code4))) ;
            
      String  decr=dec.decrypt(code3)+"";
      System.out.println(" Desencriptado" + decr);
      if( code.equals(decr)){
         System.out.println("ID desencriptado correctamente");
          flag=true;
      }else{
          System.out.println(" fallido");}
        
       
        
        }catch(Exception e){
            System.out.println(" Exception" + e.getMessage());
        }
        //System.out.println(" correcto"+flag);
        
       
        
        // TODO code application logic here
    }
    
}
