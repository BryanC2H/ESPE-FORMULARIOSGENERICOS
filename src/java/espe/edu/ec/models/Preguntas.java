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
public class Preguntas {
    private int Codigo_formulario;
    private int Codigo_grupo;
    private int Codigo_preguntas;
    private int Codigo_formulario_anidado;
    private int Codigo_grupo_anidado;
    private int Codigo_pregunta_anidada;
    private int Codigo_tipo_pregunta;
    private String label_pregunta; //pregunta
    private String vigente_pregunta; //S(si) N(no)
    private Date fecha_crea;
    private String usua_crea;
    private Date fecha_modif;
    private String usua_modif;

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

    public int getCodigo_formulario_anidado() {
        return Codigo_formulario_anidado;
    }

    public void setCodigo_formulario_anidado(int Codigo_formulario_anidado) {
        this.Codigo_formulario_anidado = Codigo_formulario_anidado;
    }

    public int getCodigo_grupo_anidado() {
        return Codigo_grupo_anidado;
    }

    public void setCodigo_grupo_anidado(int Codigo_grupo_anidado) {
        this.Codigo_grupo_anidado = Codigo_grupo_anidado;
    }

    public int getCodigo_pregunta_anidada() {
        return Codigo_pregunta_anidada;
    }

    public void setCodigo_pregunta_anidada(int Codigo_pregunta_anidada) {
        this.Codigo_pregunta_anidada = Codigo_pregunta_anidada;
    }

    public int getCodigo_tipo_pregunta() {
        return Codigo_tipo_pregunta;
    }

    public void setCodigo_tipo_pregunta(int Codigo_tipo_pregunta) {
        this.Codigo_tipo_pregunta = Codigo_tipo_pregunta;
    }

    public String getLabel_pregunta() {
        return label_pregunta;
    }

    public void setLabel_pregunta(String label_pregunta) {
        this.label_pregunta = label_pregunta;
    }

    public String getVigente_pregunta() {
        return vigente_pregunta;
    }

    public void setVigente_pregunta(String vigente_pregunta) {
        this.vigente_pregunta = vigente_pregunta;
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
