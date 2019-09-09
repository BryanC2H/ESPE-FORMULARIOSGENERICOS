/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import java.sql.Date;

/**
 *
 * @author DIEGOPC
 */
public class FormPersona {
    private int codFormP;
    private int pidm;
    private int codF;
    private String estadoLlenado;
    private String estadosSeg;

    public String getEstadosSeg() {
        return estadosSeg;
    }

    public void setEstadosSeg(String estadosSeg) {
        this.estadosSeg = estadosSeg;
    }
    private Date fecha_persona_crea;
    private Date fecha_crea;
    private String usuario_crea;
    private Date fecha_modifica;
    private String usuario_modifica;
    private String estadoSeg;

    public String getUsuario_crea() {
        return usuario_crea;
    }

    public void setUsuario_crea(String usuario_crea) {
        this.usuario_crea = usuario_crea;
    }

    public String getEstadoSeg() {
        return estadoSeg;
    }

    public void setEstadoSeg(String estadoSeg) {
        this.estadoSeg = estadoSeg;
    }

    public int getCodFormP() {
        return codFormP;
    }

    public void setCodFormP(int codFormP) {
        this.codFormP = codFormP;
    }

    public int getPidm() {
        return pidm;
    }

    public void setPidm(int pidm) {
        this.pidm = pidm;
    }

    public int getCodF() {
        return codF;
    }

    public void setCodF(int codF) {
        this.codF = codF;
    }

    public String getEstadoLlenado() {
        return estadoLlenado;
    }

    public void setEstadoLlenado(String estadoLlenado) {
        this.estadoLlenado = estadoLlenado;
    }

    public Date getFecha_persona_crea() {
        return fecha_persona_crea;
    }

    public void setFecha_persona_crea(Date fecha_persona_crea) {
        this.fecha_persona_crea = fecha_persona_crea;
    }

    public Date getFecha_crea() {
        return fecha_crea;
    }

    public void setFecha_crea(Date fecha_crea) {
        this.fecha_crea = fecha_crea;
    }

    public String getFecha_usuario_crea() {
        return usuario_crea;
    }

    public void setFecha_usuario_crea(String fecha_usuario_crea) {
        this.usuario_crea = fecha_usuario_crea;
    }

    public Date getFecha_modifica() {
        return fecha_modifica;
    }

    public void setFecha_modifica(Date fecha_modifica) {
        this.fecha_modifica = fecha_modifica;
    }

    public String getUsuario_modifica() {
        return usuario_modifica;
    }

    public void setUsuario_modifica(String usuario_modifica) {
        this.usuario_modifica = usuario_modifica;
    }

    
}
