package espe.edu.ec.util;

import espe.edu.ec.connection.DB2;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Correo {
   public void enviarCorreoP(String asunto, String cedula,String cargo, String email,String email2,String mensaje,String url,String clave) throws Exception{
          DB2 conWF = DB2.getInstancia();
          Connection coWF = conWF.getConnectionWF();
         // coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('"+asunto+"','"+cedula+"','"+cargo+"','"+email+"','"+email2+"','"+mensaje+"','"+url+"','"+clave)+"')").executeQuery();
          coWF.close();
          conWF.closeConexionWF();
    }
   
}

