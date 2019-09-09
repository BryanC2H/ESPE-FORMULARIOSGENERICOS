/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import java.sql.Date;

/**
 *
 * @author david
 */
public class Valores {
    private int Codigo_Valores;
    private int Codig_Formularios;
    private int Codigo_Grupo;
    private int Codigo_Preguntas;
    private String Valores;
    private Date fecha_crea;
    private String usua_crea;
    private Date fecha_modif;
    private String usua_modif;
    


    public int getCodigo_Valores() {
        return Codigo_Valores;
    }

    public void setCodigo_Valores(int Codigo_Valores) {
        this.Codigo_Valores = Codigo_Valores;
    }

    public int getCodig_Formularios() {
        return Codig_Formularios;
    }

    public void setCodig_Formularios(int Codig_Formularios) {
        this.Codig_Formularios = Codig_Formularios;
    }

    public int getCodigo_Grupo() {
        return Codigo_Grupo;
    }

    public void setCodigo_Grupo(int Codigo_Grupo) {
        this.Codigo_Grupo = Codigo_Grupo;
    }

    public int getCodigo_Preguntas() {
        return Codigo_Preguntas;
    }

    public void setCodigo_Preguntas(int Codigo_Preguntas) {
        this.Codigo_Preguntas = Codigo_Preguntas;
    }

    public String getValores() {
        return Valores;
    }

    public void setValores(String Valores) {
        this.Valores = Valores;
    }

    public Date getFecha_crea() {
        return fecha_crea;
    }

    public void setFecha_crea(Date fecha_crea) {
        this.fecha_crea = fecha_crea;
    }

    public String getUsua_crea() {
        return usua_crea;
    }

    public void setUsua_crea(String usua_crea) {
        this.usua_crea = usua_crea;
    }

    public Date getFecha_modif() {
        return fecha_modif;
    }

    public void setFecha_modif(Date fecha_modif) {
        this.fecha_modif = fecha_modif;
    }

    public String getUsua_modif() {
        return usua_modif;
    }

    public void setUsua_modif(String usua_modif) {
        this.usua_modif = usua_modif;
    }
    

}
