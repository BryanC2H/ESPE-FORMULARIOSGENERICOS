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
public class Respuestas {
    private int Pidm_usuario;
    private int Codigo_persona;
    private int Codigo_formulario;
    private int Codigo_grupo;
    private int Codigo_preguntas;
    private int Codigo_Respuestas;
    private String Valor_Respuestas;
    private int iteracionRespuesta;
    private Date fecha_crea;
    private String usua_crea;
    private Date fecha_modif;
    private String usua_modif;

    public int getIteracionRespuesta() {
        return iteracionRespuesta;
    }

    public void setIteracionRespuesta(int iteracionRespuesta) {
        this.iteracionRespuesta = iteracionRespuesta;
    }

    public int getPidm_usuario() {
        return Pidm_usuario;
    }

    public void setPidm_usuario(int Pidm_usuario) {
        this.Pidm_usuario = Pidm_usuario;
    }

    public int getCodigo_persona() {
        return Codigo_persona;
    }
    
    public void setCodigo_persona(int Codigo_persona) {
        this.Codigo_persona = Codigo_persona;
    }

    public int getCodigo_formulario() {
        return Codigo_formulario;
    }

    public void setCodigo_formulario(int Codigo_formulario) {
        this.Codigo_formulario = Codigo_formulario;
    }

    public int getCodigo_grupo() {
        return Codigo_grupo;
    }

    public void setCodigo_grupo(int Codigo_grupo) {
        this.Codigo_grupo = Codigo_grupo;
    }

    public int getCodigo_preguntas() {
        return Codigo_preguntas;
    }

    public void setCodigo_preguntas(int Codigo_preguntas) {
        this.Codigo_preguntas = Codigo_preguntas;
    }

    public int getCodigo_Respuestas() {
        return Codigo_Respuestas;
    }

    public void setCodigo_Respuestas(int Codigo_Respuestas) {
        this.Codigo_Respuestas = Codigo_Respuestas;
    }

    public String getValor_Respuestas() {
        return Valor_Respuestas;
    }

    public void setValor_Respuestas(String Valor_Respuestas) {
        this.Valor_Respuestas = Valor_Respuestas;
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
