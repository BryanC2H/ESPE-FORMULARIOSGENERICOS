package espe.edu.ec.util;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import espe.edu.ec.connection.DB;
import espe.edu.ec.connection.DB2;
import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author aetorres
 */
public class Ejecucion {
    
    public int llamarWF(Integer Formulario, Integer Pidm) throws Exception {
        String Id = " ";
        String Cedula = " ";
        String Nombres = " ";
        String Email = " ";
        String Carrera = " ";
        String Campus = " ";
        String Nivel = " ";   
        String Periodo = " ";
        String Nrc = " ";
        String Actividad = " ";
        String Razon = " ";
        String Email2 = " ";
        String Nrcadic = " ";        
        
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            ResultSet rs = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 2),NULL) AS ID,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 0),NULL) AS CEDULA,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 1),NULL) AS NOMBRES,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 3),NULL) AS EMAIL,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 5),NULL) AS CARRERA,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 4),NULL) AS CAMPUS,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 11),NULL) AS NIVEL,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 6),NULL) AS PERIODO,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 12),NULL) AS RAZON,\n" +
            "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n" +
            "FROM UTIC.UZGTRESPUESTAS \n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n" +
            "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n" +
            "AND CODIGO_UZGTPREGUNTAS = 13),'auditoria_sis@espe.edu.ec') AS EMAIL2\n" +
            "FROM UTIC.UZGTRESPUESTAS R\n" +
            "WHERE R.SPRIDEN_PIDM = "+Pidm+"\n" +
            "AND R.CODIGO_UZGTFORMULARIOS = "+Formulario+"\n" +
            "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MIN(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n" +
            "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n" +
            "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)").executeQuery();

            if(rs.next()){
                Id = rs.getString(1);
                Cedula = rs.getString(2);
                Nombres = rs.getString(3);
                Email = rs.getString(4);
                Carrera = rs.getString(5);
                Campus = rs.getString(6);
                Nivel = rs.getString(7);
                Periodo = rs.getString(8);
                Razon = rs.getString(9);
                Email2 = rs.getString(10);    
            }
   
        switch (Formulario) {
            case 1:  DB2 conWF = DB2.getInstancia();
                     Connection coWF = conWF.getConnectionWF();
                     coWF.prepareStatement("p_EVENTO_MATRICULAS("+Pidm+",'"+Id+"'"+",'"+Cedula+"'"
                     +",'"+Nombres+"'"+",'"+Email+"'"+",'"+Carrera+"'"+",'"+Campus+"'"+",'"+Nivel+"'"
                     +",'"+Nrc+"'"+",'"+Actividad+"'"+",'"+Razon+"'"+",'"+Email2+"'"+",'"+Nrcadic+"'").execute();
                     coWF.close();
                     conWF.closeConexionWF();
                     break;
            case 2:  
                     break;
            case 3:  
                     break;
            case 4:  
                     break;
            case 5: 
                     break;
            case 6:  
                     break;
            case 7: 
                     break;
            case 8:  
                     break;
            case 9:  
                     break;
            case 10: 
                     break;
            case 11: 
                     break;
            case 12:
                     break;
            
        }
        con.closeConexion();
        return Pidm;
  } 
      
}
