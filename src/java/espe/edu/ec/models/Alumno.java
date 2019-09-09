/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import java.sql.Date;

/**
 *
 * @author aetorres
 */
public class Alumno {
    private int Pidm_alumno;
    private String Id_alumno;
    private String Nombre_alumno;
    private String Cedula_alumno;
    private String Emailp_alumno;
    private String Emails_alumno;

    public int getPidm_alumno() {
        return Pidm_alumno;
    }

    public void setPidm_alumno(int Pidm_alumno) {
        this.Pidm_alumno = Pidm_alumno;
    }
    
    public String getId_alumno() {
        return Id_alumno;
    }

    public void setId_alumno(String Id_alumno) {
        this.Id_alumno = Id_alumno;
    }

    public String getNombre_alumno() {
        return Nombre_alumno;
    }

    public void setNombre_alumno(String Nombre_alumno) {
        this.Nombre_alumno = Nombre_alumno;
    }
    
     public String getCedula_alumno() {
        return Cedula_alumno;
    }

    public void setCedula_alumno(String Cedula_alumno) {
        this.Cedula_alumno = Cedula_alumno;
    }
    
     public String getEmailp_alumno() {
        return Emailp_alumno;
    }

    public void setEmailp_alumno(String Emailp_alumno) {
        this.Emailp_alumno = Emailp_alumno;
    }
    
     public String getEmails_alumno() {
        return Emails_alumno;
    }

    public void setEmails_alumno(String Emails_alumno) {
        this.Emails_alumno = Emails_alumno;
    }

}

