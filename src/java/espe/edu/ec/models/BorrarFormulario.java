/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import espe.edu.ec.connection.DB;
import espe.edu.ec.connection.DB2;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;


/**
 *
 * @author aetorres
 */
public class BorrarFormulario {
    
    public void borraForm(int Cod, int usPidm) throws Exception {
        
        String Actividad = " ";
        int Flujo = 0;
        DB con = DB.getInstancia();
        Connection co = con.getConnection();
        
        DB2 conWF = DB2.getInstancia();
        Connection coWF = conWF.getConnectionWF();
        
        switch (Cod) {
            case 2: {
                    Actividad = "EVENTO_MExtraordWeb";
                    break;
                } //case2
            case 3: {
                    Actividad = "EVENTO_MExtraordManual"; 
                    break;
                 } //case3
            case 7: {
                    Actividad = "TERCERA_MATRICULA";; 
                    break;
                 } //case7
            case 8: {
                    Actividad = "EVENTO_MExtWebIdiomas";
                    break;
                 } //case8
            case 11: {
                    Actividad = "IMPEDACAD";
                    break;
                 } //case11
            case 13: {
                    Actividad = "EVENTO_HSalida_Alumnos";
                    break;
                 } //case13
            
            }   //case 
        
                try {   
                 /*   ResultSet rswf = coWF.prepareStatement("select count(distinct PD.ID) "
                    + "FROM   WORKFLOW.ENG_WORKITEM EWI, WORKFLOW.ENG_WORKFLOW EWF, WORKFLOW.PROCESS_DEFINITION PD"
                    + "WHERE  PD.ID = ewf.pd_id AND ewf.id =  ewi.wf_id "
                    + "AND  PD.NAME LIKE " + Actividad + "'%' "
                    + "AND ewi.current_state like 'star%run%' "
                    + "And SUBSTR(ewf.NAME,19,9) = (select spriden_id from spriden where spriden_change_ind is null an spriden_pidm = " +usPidm
                    + ")").executeQuery();
                    
                    if (rswf.next()) {
                        Flujo = rswf.getInt(1);
                    }
                    
                    if (Flujo > 0){
                        //mensaje que no puede borrar
                        }    else { */
                            ResultSet rs = co.prepareStatement("UPDATE UTIC.uzgtformulario_persona\n" +
                            "SET UZGTFORMULARIOS_ESTADO_LLENADO = 'N'\n" +
                            "WHERE SPRIDEN_PIDM =  " + usPidm + "\n" +
                            "AND UZGTFORMULARIOS_ESTADO_LLENADO = 'L'\n" +
                            "AND CODIGO_UZGTFORMULARIOS = " + Cod ).executeQuery();
                    
                            ResultSet rs1 = co.prepareStatement("DELETE \n" +
                            "FROM UTIC.UZGTRESPUESTAS\n" +
                            "WHERE SPRIDEN_PIDM =  " + usPidm + "\n" +
                            "AND CODIGO_UZGTFORMULARIOS = " + Cod).executeQuery();
                                
                      //  }             
                    co.close();
                    coWF.close();
                    
                } catch (Exception e) {
                    out.println("Error tipo numerico" + e.getMessage());
                } 

        con.closeConexion();
        conWF.closeConexionWF();
    }
    
}
