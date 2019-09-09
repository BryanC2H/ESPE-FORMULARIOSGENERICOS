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
public class Formulario {
    private int Codigo_formulario;
    private String Nombre_formulario;
    private String Descripcion_formulario;
    private Date Fecha_formulario;
    private String Objetivo_formulario;
    private String Base_formulario;
    private String tipoFormulario;
    private String estadoLlenado;
    private int estadoPublicacion;
    private String queryP;
    private Date fecha_crea;
    private String usuario_crea;
    private Date fecha_modifica;
    private String usuario_modifica;
    
    public int getCodigo_formulario() {
        return Codigo_formulario;
    }

    public void setCodigo_formulario(int Codigo_formulario) {
        this.Codigo_formulario = Codigo_formulario;
    }

    public String getNombre_formulario() {
        return Nombre_formulario;
    }

    public void setNombre_formulario(String Nombre_formulario) {
        this.Nombre_formulario = Nombre_formulario;
    }

    public String getDescripcion_formulario() {
        return Descripcion_formulario;
    }

    public void setDescripcion_formulario(String Descripcion_formulario) {
        this.Descripcion_formulario = Descripcion_formulario;
    }

    public Date getFecha_formulario() {
        return Fecha_formulario;
    }

    public void setFecha_formulario(Date Fecha_formulario) {
        this.Fecha_formulario = Fecha_formulario;
    }

    public String getObjetivo_formulario() {
        return Objetivo_formulario;
    }

    public void setObjetivo_formulario(String Objetivo_formulario) {
        this.Objetivo_formulario = Objetivo_formulario;
    }

    public String getBase_formulario() {
        return Base_formulario;
    }

    public void setBase_formulario(String Base_formulario) {
        this.Base_formulario = Base_formulario;
    }

    public String getTipoFormulario() {
        return tipoFormulario;
    }

    public void setTipoFormulario(String tipoFormulario) {
        this.tipoFormulario = tipoFormulario;
    }

    public String getEstadoLlenado() {
        return estadoLlenado;
    }

    public void setEstadoLlenado(String estadoLlenado) {
        this.estadoLlenado = estadoLlenado;
    }

    public int getEstadoPublicacion() {
        return estadoPublicacion;
    }

    public void setEstadoPublicacion(int estadoPublicacion) {
        this.estadoPublicacion = estadoPublicacion;
    }

    public String getQueryP() {
        return queryP;
    }

    public void setQueryP(String queryP) {
        this.queryP = queryP;
    }

    public Date getFecha_crea() {
        return fecha_crea;
    }

    public void setFecha_crea(Date fecha_crea) {
        this.fecha_crea = fecha_crea;
    }

    public String getUsuario_crea() {
        return usuario_crea;
    }

    public void setUsuario_crea(String usuario_crea) {
        this.usuario_crea = usuario_crea;
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
