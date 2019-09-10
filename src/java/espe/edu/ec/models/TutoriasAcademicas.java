/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import espe.edu.ec.connection.DB2;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import espe.edu.ec.models.Alumno;
import espe.edu.ec.connection.DB;
import espe.edu.ec.models.Usuario;
import static java.lang.System.out;
import java.sql.PreparedStatement;

/**
 *
 * @author aetorres
 */
public class TutoriasAcademicas {

    public void tutoriasAcademicas(int Cod, int usPidm) throws Exception {
        String Id = " ";
        String Cedula = " ";
        String Nombres = " ";
        String Email = " ";
        String Carrera = " ";
        String Campus = " ";
        String Nivel = " ";
        String Periodo = " ";
        String Fsalida = " ";
        String Valida = " ";
        String Unidad = " ";
        String Tema = " ";
        String Publico = " ";
        String Aula = " ";
        String HoraInicio = " ";
        String HoraFin = " ";
        String Observacion = " ";
        String Fregistro = " ";
        String Actividad = " ";
        String Nrc = " ";
        String Razon = " ";
        String Asignatura = " ";
        Integer CodPlanificacion = 1;
        Integer CodAsiste = 1;
        String TipoPersona = " ";
        String TipoTutoria = " ";
        String Estado = " " ;
        
        DB con = DB.getInstancia();
        Connection co = con.getConnection();

        DB2 conWF = DB2.getInstancia();
        Connection coWF = conWF.getConnectionWF();
        
        DB2 conPAS8 = DB2.getInstancia();
        Connection coPAS8 = conPAS8.getConnectionPAS8();

        switch (Cod) {
            case 19: {
                TipoPersona = "D";
                TipoTutoria = "R";  
                Estado = "A"; //Activa
                try {

                    Actividad = "PLANIFICACIÓN REFORZAMIENTO";

                    ResultSet rs = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 246),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 247),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 248),NULL) AS UNIDAD,\n"
                            + "NVL((SELECT DISTINCT MAX (GOREMAL.GOREMAL_EMAIL_ADDRESS)\n"
                            + "FROM GENERAL.GOREMAL \n"
                            + "WHERE GOREMAL.GOREMAL_PIDM = R.SPRIDEN_PIDM \n"
                            + "AND GOREMAL.GOREMAL_EMAL_CODE = 'STAN'),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 249),NULL) AS TEMA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 250),NULL) AS PUBLICO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 251),NULL) AS NRC,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 252),NULL) AS AULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 253),NULL) AS FECHA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 254),NULL) AS HORAINIO,\n"  
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 255),NULL) AS HORAFIN,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 256),NULL) AS OBSERVACION,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 257),NULL) AS FECHAREG\n"     
                            + "FROM UTIC.UZGTRESPUESTAS R\n"
                            + "WHERE R.SPRIDEN_PIDM = " + usPidm + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS = " + Cod + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MAX(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)\n"
                            + "AND R.UZGTRESPUESTAS_ITERACION = (SELECT MAX(UZGTRESPUESTAS_ITERACION) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA)").executeQuery();

                    if (rs.next()) {
                        Cedula = rs.getString(1);
                        Nombres = rs.getString(2);
                        Unidad = rs.getString(3);
                        Email = rs.getString(4);
                        Tema = rs.getString(5);
                        Publico = rs.getString(6);
                        Nrc = rs.getString(7);
                        Aula = rs.getString(8);
                        Fsalida = rs.getString(9);
                        HoraInicio = rs.getString(10);
                        HoraFin = rs.getString(11);
                        Observacion = rs.getString(12);
                        Fregistro = rs.getString(13);
                    }
                    
                    ResultSet rs1 = co.prepareStatement("SELECT DISTINCT A.SCBCRSE_TITLE AS ASIGNATURA, \n"
                            + "SIRASGN_TERM_CODE AS PERIODO \n"
                            + "FROM SSBSECT, SIRASGN, SCBCRSE A\n"
                            + "WHERE SIRASGN_PIDM  = 245991 \n" //+ usPidm + "\n"
                            + "AND SSBSECT_CRN = '" + Nrc + "'\n"
                            + "AND SSBSECT_CRN = SIRASGN_CRN\n" 
                            + "AND SSBSECT_TERM_CODE = SIRASGN_TERM_CODE\n" 
                            + "AND A.SCBCRSE_SUBJ_CODE = SSBSECT_SUBJ_CODE\n" 
                            + "AND A.SCBCRSE_CRSE_NUMB = SSBSECT_CRSE_NUMB\n" 
                            + "AND A.SCBCRSE_EFF_TERM = (SELECT MAX(SCBCRSE_EFF_TERM)\n" 
                            + "FROM SCBCRSE\n" 
                            + "WHERE SCBCRSE_SUBJ_CODE = A.SCBCRSE_SUBJ_CODE\n" 
                            + "AND SCBCRSE_CRSE_NUMB = A.SCBCRSE_CRSE_NUMB) ").executeQuery();
    
                    if (rs1.next()) {
                        Asignatura = rs1.getString(1);
                        Periodo = rs1.getString(2);
                    }
                    
                    ResultSet rs2 = coPAS8.prepareStatement("SELECT DISTINCT MAX(CODIGO_UZTPLANIF) \n"
                            + "FROM UTIC.UZTPLANIF \n"
                            + "WHERE CODIGO_UZGTFORMULARIOS = " + Cod ).executeQuery();
    
                    if (rs2.next()) {
                        CodPlanificacion = rs2.getInt(1);
                    }
                    
                    CodPlanificacion = CodPlanificacion + 1 ;

                    PreparedStatement ps = coPAS8.prepareStatement("INSERT INTO UTIC.UZTPLANIF (CODIGO_UZTPLANIF, CODIGO_UZGTFORMULARIOS,UZTPLANIF_FECHAFORM,UZTPLANIF_TIPOPERSONA,UZTPLANIF_TITOTUTORIA, SPRIDEN_PIDM,UZTPLANIF_TEMA ,UZTPLANIF_PUBLICO, UZTPLANIF_NRC, UZTPLANIF_ASIGNATURA, UZTPLANIF_PERIODO, UZTPLANIF_NIVEL, UZTPLANIF_AULA, UZTPLANIF_FECHATUTORIA, UZTPLANIF_HORAINICIO, UZTPLANIF_HORAFIN, UZTPLANIF_OBSERVACION, UZTPLANIF_ESTADO)"
                                            + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                    ps.setInt(1, CodPlanificacion);
                    ps.setInt(2, Cod);
                    ps.setString(3, Fregistro);
                    ps.setString(4, TipoPersona);
                    ps.setString(5, TipoTutoria);
                    ps.setInt(6, usPidm);
                    ps.setString(7, Tema);
                    ps.setString(8, Publico);
                    ps.setString(9, Nrc);
                    ps.setString(10, Asignatura);
                    ps.setString(11, Periodo);
                    ps.setString(12, Nivel);
                    ps.setString(13, Aula);
                    ps.setString(14, Fsalida);
                    ps.setString(15, HoraInicio);
                    ps.setString(16, HoraFin);
                    ps.setString(17, Observacion);
                    ps.setString(18, Estado);
                    ps.executeUpdate();
                    
                    Razon = "Planificacion de Tutorías de Reforzamiento Académico del curso "+Nrc;
                    String par_mensaje = " este formulario " + Cod + " " + Actividad + " fue generado el ";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " para "+ Publico + " del NRC " + Nrc ;
                    String par_notificacion1 = " que corresponde a la asignatura " + Asignatura + " con el Tema " + Tema + ", será impartida en el Aula " + Aula + " el día " + Fsalida + " en el horario de " + HoraInicio + "-"+HoraFin+", con la siguiente observacion " + Observacion;
                    String par_notificacion2 = " la planificación de tutorías de reforzamiento académico ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                                + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                                + ")").executeQuery();
                    
                    if (Publico.equals("TODOS")){
                                                          
                    LinkedList<Alumno> listaA = new LinkedList<Alumno>();
                    ResultSet rs3 = co.prepareStatement("SELECT DISTINCT SFRSTCR_PIDM AS PIDM,\n" +
                    "SUBSTR(f_getspridenid(SFRSTCR_PIDM),1,12) AS ID,\n" +
                    "SUBSTR(f_format_name(SFRSTCR_PIDM,'LFMI'),1,45) AS NOMBRES,\n" +
                    "SPBPERS_SSN AS CEDULA,\n" +
                    "NVL((SELECT DISTINCT MAX (GOREMAL.GOREMAL_EMAIL_ADDRESS)\n" +
                    "FROM GOREMAL\n" +
                    "WHERE GOREMAL.GOREMAL_PIDM = SPBPERS_PIDM\n" +
                    "AND GOREMAL.GOREMAL_EMAL_CODE = 'STAN'), '') AS CORREO_INSTITUCIONAL,\n" +
                    "NVL((SELECT DISTINCT MAX (GOREMAL.GOREMAL_EMAIL_ADDRESS)\n" +
                    "FROM GOREMAL\n" +
                    "WHERE GOREMAL.GOREMAL_PIDM = SPBPERS_PIDM\n" +
                    "AND GOREMAL.GOREMAL_EMAL_CODE = 'PERS'), '') AS CORREO_PERSONAL\n" +
                    "FROM SFRSTCR, SIRASGN, SPBPERS\n" +
                    "WHERE SIRASGN_CRN = '"+ Nrc + "'\n" +
                    "AND SFRSTCR_CRN = SIRASGN_CRN\n" +
                    "AND SFRSTCR_TERM_CODE = SIRASGN_TERM_CODE\n" +
                    "AND SIRASGN_PIDM = 245991 \n" + //"+ usPidm +"\n" +
                    "AND SFRSTCR_TERM_CODE = '"+ Periodo +"'\n" +
                    "AND SFRSTCR_PIDM = SPBPERS_PIDM").executeQuery();
                                                            
                    while(rs3.next())
                    {
                        Alumno A = new Alumno();
                        A.setPidm_alumno(rs3.getInt(1));
                        A.setId_alumno(rs3.getString(2));
                        A.setCedula_alumno(rs3.getString(3));
                        A.setNombre_alumno(rs3.getString(4));
                        A.setEmailp_alumno(rs3.getString(5));
                        A.setEmails_alumno(rs3.getString(6));
                        listaA.add(A);
                    
                        
                        ResultSet rs4 = coPAS8.prepareStatement("SELECT DISTINCT MAX(CODIGO_ASISTE) \n"
                            + "FROM UTIC.UZTASISTENTES \n"
                            + "WHERE CODIGO_UZTPLANIF = " + CodPlanificacion + "\n"
                            + "AND CODIGO_UZGTFORMULARIOS = " + Cod ).executeQuery();
    
                        if (rs4.next()) {
                            CodAsiste = rs4.getInt(1);
                        }
                    
                        CodAsiste = CodAsiste + 1 ;

                        PreparedStatement ps1 = coPAS8.prepareStatement("INSERT INTO UTIC.UZTASISTENTES (CODIGO_ASISTE, CODIGO_UZTPLANIF,"
                            + "CODIGO_UZGTFORMULARIOS,SPRIDEN_PIDM,UZTASISTENTES_ID, UZTASISTENTES_NOMBRE,UZTASISTENTES_CEDULA ,"
                            + "UZTASISTENTES_EMAILP, UZTASISTENTES_EMAILS, UZTASISTENTES_FECHATUTORIA, UZTASISTENTES_FECHAREGISTRO )"
                            + " VALUES (?,?,?,?,?,?,?,?,?,?,?)");
    
                    ps1.setInt(1, CodAsiste);
                    ps1.setInt(2, CodPlanificacion);
                    ps1.setInt(3, Cod);
                    ps1.setInt(4, rs3.getInt(1));
                    ps1.setString(5, rs3.getString(2));
                    ps1.setString(6, rs3.getString(4));
                    ps1.setString(7, rs3.getString(3));
                    ps1.setString(8, rs3.getString(5));
                    ps1.setString(9, rs3.getString(6));
                    ps1.setString(10, Fsalida);
                    ps1.setString(11, Fregistro);
                    ps1.executeUpdate();
                    
                    Razon = "aetorres@espe.edu.ec";
                    
                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + rs3.getString(3) + "'" + ",'" + rs3.getString(4) + "'"
                    //            + ",'" + rs3.getString(5) + "'" + ",'" + rs3.getString(6) + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                    + ",'" + Razon + "'" + ",'" + Razon + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                                + ")").executeQuery();
                    }
                    
                    rs3.close();
                    }
                
                } catch (Exception e) {
                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " a los estudiantes del NRC " + Nrc;
                    String par_notificacion1 = " por DATOS INCORRECTOS ";
                    String par_notificacion2 = " la planificación NO fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();
                    out.println("Error tipo numerico" + e.getMessage());
                    
                }
                co.close();
                coWF.close();
                con.closeConexion();
                conWF.closeConexionWF();
                break;
            } //case19
            
            }
 }
   
}
