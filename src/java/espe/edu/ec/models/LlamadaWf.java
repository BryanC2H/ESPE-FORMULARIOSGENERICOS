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
public class LlamadaWf {

    public void llamarWF(int Cod, int usPidm) throws Exception {
        String Id = " ";
        String Cedula = " ";
        String Nombres = " ";
        String Email = " ";
        String Carrera = " ";
        String Campus = " ";
        String Nivel = " ";
        String Periodo = " ";
        String Razon = " ";
        String Razon2 = " ";
        String Cohorte = " ";
        String Catalogo = " ";
        String CredApro = " ";
        String CredCar = " ";
        String CredHis = " ";
        String Nrc = " ";
        String Actividad = " ";
        String Email2 = "auditoria_sis@espe.edu.ec";
        String Nrc2 = " ";
        String Nrc3 = " ";
        String Nrc4 = " ";
        String Nrc5 = " ";
        String CHR1 = " ";
        String CHR2 = " ";
        String CHR3 = " ";
        String CHR4 = " ";
        String CHR5 = " ";
        String Fsalida = " ";
        String Valida = " ";
        String CambCar = " ";
        String DatCor = " ";
        String Unidad = " ";
        String Tema = " ";
        String Publico = " ";
        String Aula = " ";
        String HoraInicio = " ";
        String HoraFin = " ";
        String Observacion = " ";
        String Fregistro = " ";
        int int1 = 0;
        int int2 = 0;
        int int3 = 0;
        int int4 = 0;
        int int5 = 0;

        DB con = DB.getInstancia();
        Connection co = con.getConnection();

        DB2 conWF = DB2.getInstancia();
        Connection coWF = conWF.getConnectionWF();

        switch (Cod) {
            case 2: {

                try {

                    Nrc = "1";
                    Actividad = "MEXTRA_WEB";

                    ResultSet rs = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 17),NULL) AS ID,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 15),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 16),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 18),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 20),NULL) AS CARRERA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 19),NULL) AS CAMPUS,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,2)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 23),NULL) AS NIVEL,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 22),NULL) AS PERIODO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 24),NULL) AS RAZON\n"
                            + "FROM UTIC.UZGTRESPUESTAS R\n"
                            + "WHERE R.SPRIDEN_PIDM = " + usPidm + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS = " + Cod + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MIN(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)").executeQuery();

                    if (rs.next()) {
                        Id = rs.getString(1);
                        Cedula = rs.getString(2);
                        Nombres = rs.getString(3);
                        Email = rs.getString(4);
                        Carrera = rs.getString(5);
                        Campus = rs.getString(6);
                        Nivel = rs.getString(7);
                        Periodo = rs.getString(8);
                        Razon = rs.getString(9);
                    }
                    co.close();

                    coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                            + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.subSequence(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                            + ",'" + Periodo + "'" + ",'" + Nrc + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                            + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                            + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();

                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " al Director de Carrera";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por la siguiente Razon: " + Razon;
                    String par_notificacion2 = " la solicitud fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();

                    coWF.close();
                } catch (Exception e) {
                    out.println("Error tipo numerico" + e.getMessage());
                }
                
                break;
            } //case2

            case 3: {
                try {
                    Actividad = "MEXTRA_MANUAL";
                    int1 = Cod;
                    ResultSet rs3 = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 30),NULL) AS ID,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 28),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 29),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 31),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 33),NULL) AS CARRERA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 32),NULL) AS CAMPUS,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,2)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 36),NULL) AS NIVEL,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 35),NULL) AS PERIODO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 37\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 10\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 35)),'0') AS NRC,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 37\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 14\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 35)),'0') AS NRC2,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 37\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 18\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 35)),'0') AS NRC3,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 37\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 22\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 35)),'0') AS NRC4,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 37\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 26\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 35)),'0') AS NRC5\n"
                            + "FROM UTIC.UZGTRESPUESTAS R\n"
                            + "WHERE R.SPRIDEN_PIDM = " + usPidm + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS = " + Cod + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MIN(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)").executeQuery();

                    if (rs3.next()) {
                        Id = rs3.getString(1);
                        Cedula = rs3.getString(2);
                        Nombres = rs3.getString(3);
                        Email = rs3.getString(4);
                        Carrera = rs3.getString(5);
                        Campus = rs3.getString(6);
                        Nivel = rs3.getString(7);
                        Periodo = rs3.getString(8);
                        Nrc = rs3.getString(9);
                        Nrc2 = rs3.getString(10);
                        Nrc3 = rs3.getString(11);
                        Nrc4 = rs3.getString(12);
                        Nrc5 = rs3.getString(13);
                    }
                    co.close();

                    String NRCs = Nrc + "," + Nrc2 + "," + Nrc3 + "," + Nrc4 + "," + Nrc5;

                    if (!Nrc.equals("0")) {
                        Nrc = Nrc.substring(0, 4);
                    }//if
                    if (!Nrc2.equals("0")) {
                        Nrc2 = Nrc2.substring(0, 4);
                    }//if
                    if (!Nrc3.equals("0")) {
                        Nrc3 = Nrc3.substring(0, 4);
                    }//if
                    if (!Nrc4.equals("0")) {
                        Nrc4 = Nrc4.substring(0, 4);
                    }//if
                    if (!Nrc5.equals("0")) {
                        Nrc5 = Nrc5.substring(0, 4);
                    }//if

                    if (!Nrc.equals("0")) {

                        coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                                + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();
                    }//if

                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado ";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " al Director de Carrera, ";
                    String par_notificacion1 = " los datos enviados son para el Campus " + Campus + " y el Programa " + Carrera + " , en los NRCs " + NRCs + " por la siguiente Razon: " + Razon;
                    String par_notificacion2 = " la solicitud de Matrícula Extraordinaria Manual fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();

                    coWF.close();
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                break;
            } //case3

            case 7: {
                try {
                    Actividad = "TERCERA_MATRICULA";
                    ResultSet rs7 = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 123),NULL) AS ID,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 121),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 122),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 124),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 126),NULL) AS CARRERA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 125),NULL) AS CAMPUS,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,2)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 129),NULL) AS NIVEL,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 128),NULL) AS PERIODO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 130),NULL) AS RAZON,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 131\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 11\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 128)),'0') AS NRC,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 131\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 15\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 128)),'0') AS NRC2,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 131\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 19\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 128)),'0') AS NRC3,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 131\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 23\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 128)),'0') AS NRC4,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 131\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 27\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 128)),'0') AS NRC5\n"
                            + "FROM UTIC.UZGTRESPUESTAS R\n"
                            + "WHERE R.SPRIDEN_PIDM = " + usPidm + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS = " + Cod + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MIN(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)").executeQuery();

                    if (rs7.next()) {
                        Id = rs7.getString(1);
                        Cedula = rs7.getString(2);
                        Nombres = rs7.getString(3);
                        Email = rs7.getString(4);
                        Carrera = rs7.getString(5);
                        Campus = rs7.getString(6);
                        Nivel = rs7.getString(7);
                        Periodo = rs7.getString(8);
                        Razon = rs7.getString(9);
                        Nrc = rs7.getString(10);
                        Nrc2 = rs7.getString(11);
                        Nrc3 = rs7.getString(12);
                        Nrc4 = rs7.getString(13);
                        Nrc5 = rs7.getString(14);
                    }
                    co.close();


                    if (!Nrc.equals("0")) {

                       /* coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc.substring(0, 4) + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                                + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();*/
                        coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_3MATRICULA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc.substring(0, 4) + "'" + ",'" + Email2 + "'" + ")").executeQuery();

                    }//if
                    if (!Nrc2.equals("0")) {

                       /* coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc2.substring(0, 4) + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                                + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();*/
                       
                       coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_3MATRICULA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc2.substring(0, 4) + "'" + ",'" + Email2 + "'" + ")").executeQuery();

                    }//if
                    if (!Nrc3.equals("0")) {

                       /* coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc3.substring(0, 4) + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                                + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();*/
                       
                       coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_3MATRICULA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc3.substring(0, 4) + "'" + ",'" + Email2 + "'" + ")").executeQuery();

                    }//if
                    if (!Nrc4.equals("0")) {

                       /* coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc4.substring(0, 4) + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                                + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();*/
                       
                       coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_3MATRICULA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc4.substring(0, 4) + "'" + ",'" + Email2 + "'" + ")").executeQuery();

                    }//if
                    if (!Nrc5.equals("0")) {

                       /* coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_GENERAL(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc5.substring(0, 4) + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + ",'" + Nrc4 + "'" + ",'" + Nrc5 + "'" + ",'" + CHR1 + "'" + ",'" + CHR2 + "'" + ",'" + CHR3 + "'" + ",'" + CHR4 + "'"
                                + ",'" + CHR5 + "'" + "," + int1 + "," + int2 + "," + int3 + "," + int4 + "," + int5 + ")").executeQuery();*/
                       
                       coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_3MATRICULA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc4.substring(0, 4) + "'" + ",'" + Email2 + "'" + ")").executeQuery();

                    }//if

                  /*  String NRCs = Nrc + "," + Nrc2 + "," + Nrc3 + "," + Nrc4 + "," + Nrc5;

                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado ";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " al Director de Departamento, ";
                    String par_notificacion1 = " los datos enviados son para el Campus " + Campus + " y el Programa " + Carrera + " , en los NRCs " + NRCs + " por la siguiente Razon: " + Razon;
                    String par_notificacion2 = " la solicitud de Tercera Matrícula fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();*/

                    coWF.close();
                } catch (Exception e) {
                    out.println("Error tipo numerico" + e.getMessage());
                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_BorraFormulario('" + Id + "'" + "," + Cod + ")").executeQuery();
                    coWF.close();
                    
                }
                break;
            } //case7

            case 8: {
                try {

                    Actividad = "MEXTRA_IDI";
                    ResultSet rs8 = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 137),NULL) AS ID,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 135),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 136),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 138),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 142),NULL) AS CARRERA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 139),NULL) AS CAMPUS,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,2)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 141),NULL) AS NIVEL,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 140),NULL) AS PERIODO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR || '-'|| SSBSECT_SUBJ_CODE || SSBSECT_CRSE_NUMB\n"
                            + "FROM UTIC.UZGTRESPUESTAS, SSBSECT \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 143\n"
                            + "AND CODIGO_UZGTRESPUESTAS = 9\n"
                            + "AND TRIM(UZGTRESPUESTAS_VALOR) = SSBSECT_CRN\n"
                            + "AND SSBSECT_TERM_CODE = (SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,6)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 140)),'0') AS NRC\n"
                            + "FROM UTIC.UZGTRESPUESTAS R\n"
                            + "WHERE R.SPRIDEN_PIDM = " + usPidm + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS = " + Cod + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MIN(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)").executeQuery();

                    if (rs8.next()) {
                        Id = rs8.getString(1);
                        Cedula = rs8.getString(2);
                        Nombres = rs8.getString(3);
                        Email = rs8.getString(4);
                        Carrera = rs8.getString(5);
                        Campus = rs8.getString(6);
                        Nivel = rs8.getString(7);
                        Periodo = rs8.getString(8);
                        Nrc = rs8.getString(9);
                    }
                    co.close();

                    if (!Nrc.equals("0")) {

                        coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_IDIOMAS(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Nivel + "'"
                                + ",'" + Periodo + "'" + ",'" + Nrc.substring(0, 4) + "'" + ",'" + Actividad + "'" + ",'" + Razon + "'" + ",'" + Email2 + "'" + ",'" + Nrc2 + "'"
                                + ",'" + Nrc3 + "'" + "," + int1 + "," + int2 + ")").executeQuery();

                    }//if

                    String NRCs = Nrc;

                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado ";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " al Secretario Académico, ";
                    String par_notificacion1 = " los datos enviados son para el Campus " + Campus + " y el Programa " + Carrera + " , en el NRC " + NRCs;
                    String par_notificacion2 = " la solicitud de Matrícula Extraordinaria Idiomas fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();

                    coWF.close();
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                break;
            } //case8

            //case 11 levantamiento de impedimentos
            case 11: {

                try {

                    Nrc = "1";
                    Actividad = "IMPEDACAD";

                    ResultSet rs = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 193),NULL) AS ID,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 194),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 192),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 195),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 196),NULL) AS EMAIL2,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 197),NULL) AS CARRERA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 198),NULL) AS CAMPUS,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,35)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 205),NULL) AS NIVEL,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,40)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 206),NULL) AS PERIODO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 207),NULL) AS RAZON1,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 208),NULL) AS RAZON2,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 200),NULL) AS COHORTE,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 201),NULL) AS CATALOGO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 202),NULL) AS CREDAPRO,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 203),NULL) AS CREDCAR,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 204),NULL) AS CREDHIS,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 209),NULL) AS CAMBCAR,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 210),NULL) AS DATCOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS R\n"
                            + "WHERE R.SPRIDEN_PIDM = " + usPidm + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS = " + Cod + "\n"
                            + "AND R.CODIGO_UZGTFORMULARIOS_PERSONA = (SELECT MIN(CODIGO_UZGTFORMULARIOS_PERSONA) FROM UTIC.UZGTRESPUESTAS\n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS)").executeQuery();

                    if (rs.next()) {
                        Id = rs.getString(1);
                        Cedula = rs.getString(2);
                        Nombres = rs.getString(3);
                        Email = rs.getString(4);
                        Email2 = rs.getString(5);
                        Carrera = rs.getString(6);
                        Campus = rs.getString(7);
                        Nivel = rs.getString(8);
                        Periodo = rs.getString(9);
                        Razon = rs.getString(10);
                        Razon2 = rs.getString(11);
                        Cohorte = rs.getString(12);
                        Catalogo = rs.getString(13);
                        CredApro = rs.getString(14);
                        CredCar = rs.getString(15);
                        CredHis = rs.getString(16);
                        CambCar = rs.getString(17);
                        DatCor = rs.getString(18);
                    }
                    co.close();
                    
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    
                    if (!Razon.equals("  ") && !Razon.equals("null") ) {
                        Nrc = "AI";//Razon.substring(4, 6);
                        Nrc2 = Razon.substring(4, 14);
                    }//if
                    if (!Razon2.equals("  ") && !Razon2.equals("null") ) {
                        Nrc3= "AI";//Razon2.substring(4, 6);
                        Nrc4 = Razon2.substring(4, 14);
                    }//if 
                    
                    
                    if (CambCar.equals("NO") && DatCor.equals("SI")) {
                    
                    coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_IMPEDACAD(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                            + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Email2 + "'" + ",'" + Carrera.substring(0, 9) + "'" + ",'" 
                            + Carrera.substring(11) + "'" + ",'" + Campus.substring(0, 2) + "'" + ",'" + Campus.substring(4) + "'" + ",'" + Nivel.substring(0, 2) + "'"
                            + ",'" + Periodo.substring(0, 6) + "'" + ",'" + Periodo.substring(9) + "'" + ",'" + Razon + "'" + ",'" + Nrc + "'" + ",'" + Nrc2 + "'" + ",'" + Razon2 + "'" + ",'" + CredHis + "'"
                            + ",'" + Nrc4 + "'" + ",'" + Cohorte + "'" + ",'" + Catalogo + "'" + ",'" + CredApro + "'" + ",'" + CredCar + "'" 
                            + ")").executeQuery();
                    
                    
                    Razon = "levantamiento de impedimentos académicos.";
                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_mensajeprincipal = " al Director de Carrera";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por la siguiente Razon: " + Razon;
                    String par_notificacion2 = " la solicitud fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();
                } else {
                        if (CambCar.equals("SI") && DatCor.equals("SI")) {
                           Razon = " el trámite que corresponde realizar es a tráves de una solicitud de manera personal ante el Director de Carrera a la que solicita el cambio.";
                        }
                        if (CambCar.equals("SI") && DatCor.equals("NO")) {
                           Razon = " el trámite que corresponde realizar es a tráves de una solicitud de manera personal ante el Director de Carrera a la que solicita el cambio. "
                                   + "y deberá solicitar la corrección de los Datos incorrectos en la Unidad de Admisión y Registro.";
                        }
                        if (CambCar.equals("NO") && DatCor.equals("NO")) {
                           Razon = " antes de realizar este trámite deberá solicitar la corrección de los Datos incorrectos en la Unidad de Admisión y Registro.";
                        }
                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_mensajeprincipal = " al Director de Carrera";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por la siguiente Razon: " + Razon;
                    String par_notificacion2 = " la solicitud NO fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + Email2 + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();
                    
                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_BorraFormulario('" + Id + "'" + "," + Cod + ")").executeQuery();
                        
                }    
                  coWF.close();
                } catch (Exception e) {
                    
                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_mensajeprincipal = " al Director de Carrera";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por DATOS INCORRECTOS" ;
                    String par_notificacion2 = " la solicitud NO fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();
                    out.println("Error tipo numerico" + e.getMessage());
                    
                    coWF.close();
                }
                break;
            } //case11

            case 13: {

                try {

                    Actividad = "HSALIDA";

                    ResultSet rs = co.prepareStatement("SELECT DISTINCT NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 214),NULL) AS ID,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 215),NULL) AS CEDULA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 216),NULL) AS NOMBRES,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 217),NULL) AS EMAIL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 219),NULL) AS CARRERA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 218),NULL) AS CAMPUS,\n"
                            + "NVL((SELECT DISTINCT SUBSTR(UZGTRESPUESTAS_VALOR,1,2)\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 220),NULL) AS NIVEL,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 221),NULL) AS FSALIDA,\n"
                            + "NVL((SELECT DISTINCT UZGTRESPUESTAS_VALOR\n"
                            + "FROM UTIC.UZGTRESPUESTAS \n"
                            + "WHERE SPRIDEN_PIDM = R.SPRIDEN_PIDM\n"
                            + "AND CODIGO_UZGTFORMULARIOS = R.CODIGO_UZGTFORMULARIOS\n"
                            + "AND CODIGO_UZGTFORMULARIOS_PERSONA = R.CODIGO_UZGTFORMULARIOS_PERSONA\n"
                            + "AND UZGTRESPUESTAS_ITERACION = R.UZGTRESPUESTAS_ITERACION\n"
                            + "AND CODIGO_UZGTPREGUNTAS = 222),NULL) AS Valida\n"
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
                        Id = rs.getString(1);
                        Cedula = rs.getString(2);
                        Nombres = rs.getString(3);
                        Email = rs.getString(4);
                        Carrera = rs.getString(5);
                        Campus = rs.getString(6);
                        Nivel = rs.getString(7);
                        Fsalida = rs.getString(8);
                        Valida = rs.getString(9);
                    }
                    co.close();
                    
                    Razon = "Hoja de Salida del Estudiante "+Nombres;
                    
                    if (Valida.equals("SI")) {

                    switch (Campus.substring(0, 2)) {
                        case "02":
                            {
                                coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_HSALIDA_LTGA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                            + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Nivel.substring(0, 2) + "'" + ",'" + Carrera.subSequence(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'"
                                            + ",'" + Fsalida + "'" + ")").executeQuery();
                            break;
                            }
                        case "18":
                            {
                                coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_HSALIDA_LTGA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                            + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Nivel.substring(0, 2) + "'" + ",'" + Carrera.subSequence(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'"
                                            + ",'" + Fsalida + "'" + ")").executeQuery();
                            break;
                            }
                        case "19":
                             {
                                coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_HSALIDA_LTGA(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                            + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Nivel.substring(0, 2) + "'" + ",'" + Carrera.subSequence(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'"
                                            + ",'" + Fsalida + "'" + ")").executeQuery();
                            break;
                            }
                        default: { 
                                coWF.prepareStatement("CALL WFOBJECTS.WFK_SOLICITUDES.p_EVENTO_HSALIDA_ESTUD(" + usPidm + ",'" + Id + "'" + ",'" + Cedula + "'"
                                            + ",'" + Nombres + "'" + ",'" + Email + "'" + ",'" + Nivel.substring(0, 2) + "'" + ",'" + Carrera.subSequence(0, 9) + "'" + ",'" + Campus.substring(0, 2) + "'"
                                            + ",'" + Fsalida + "'" + ")").executeQuery();
                            break;
                         }
                    }

                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " al Director de Carrera";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por la Razon: " + Razon;
                    String par_notificacion2 = " la solicitud fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();

                    coWF.close();
                   }
                   if (Valida.equals("NO")) {

                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " porque los Datos no son correctos";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por lo que deberá corregirlos en la Unidad de Admisión y Registro " ;
                    String par_notificacion2 = " la solicitud NO fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();
                    
                    coWF.close();
                   
                   }
                } catch (Exception e) {
                    String par_mensaje = " el formulario " + Cod + " " + Actividad + " fue llenado";
                    String par_emailp = "auditoria_sis@espe.edu.ec";
                    String par_mensajeprincipal = " al Director de Carrera";
                    String par_notificacion1 = " del Campus " + Campus + " y Carrera " + Carrera + ", por DATOS INCORRECTOS ";
                    String par_notificacion2 = " la solicitud NO fue enviada ";

                    coWF.prepareStatement("CALL wfobjects.wzwkreport.P_Envio_Emails('" + par_mensaje + "'" + ",'" + Cedula + "'" + ",'" + Nombres + "'"
                            + ",'" + Email + "'" + ",'" + par_emailp + "'" + ",'" + par_mensajeprincipal + "'" + ",'" + par_notificacion1 + "'" + ",'" + par_notificacion2 + "'"
                            + ")").executeQuery();
                    out.println("Error tipo numerico" + e.getMessage());
                    
                    coWF.close();
                }
                break;
            } //case13
            
            case 19: { //PLANIFICACIÓN DE REFORZAMIENTO ACADÉMICO
                TutoriasAcademicas ta = new TutoriasAcademicas();
                ta.tutoriasAcademicas(Cod, usPidm);
                break;
            } //case19
            
        }   //case 

        con.closeConexion();
        conWF.closeConexionWF();
    }

}
