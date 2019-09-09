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
public class PlanificacionTutorias {
    private int Codigo_planificacion;
    private int Codigo_formularios;
    private String Fecha_formulario;
    private String TipoPersona;
    private String TipoTutoria;
    private int SpridenPidm;
    private String Tema;
    private String Publico;
    private String Nrc;
    private String Asignatura;
    private String Periodo;
    private String Nivel;
    private String Aula;
    private String FechaTutoria;
    private String HoraInicio;
    private String HoraFin;
    private String Observacion;

    public int getCodigo_planificacion() {
        return Codigo_planificacion;
    }

    public void setCodigo_planificacion(int Codigo_planificacion) {
        this.Codigo_planificacion = Codigo_planificacion;
    }

    public int getCodigo_formularios() {
        return Codigo_formularios;
    }

    public void setCodigo_formularios(int Codigo_formularios) {
        this.Codigo_formularios = Codigo_formularios;
    }

    public String getFecha_formulario() {
        return Fecha_formulario;
    }

    public void setFecha_formulario(String Fecha_formulario) {
        this.Fecha_formulario = Fecha_formulario;
    }

    public String getTipoPersona() {
        return TipoPersona;
    }

    public void setTipoPersona(String TipoPersona) {
        this.TipoPersona = TipoPersona;
    }

    public String getTipoTutoria() {
        return TipoTutoria;
    }

    public void setTipoTutoria(String TipoTutoria) {
        this.TipoTutoria = TipoTutoria;
    }

    public int getSpridenPidm() {
        return SpridenPidm;
    }

    public void setSpridenPidm(int SpridenPidm) {
        this.SpridenPidm = SpridenPidm;
    }

    public String getTema() {
        return Tema;
    }

    public void setTema(String Tema) {
        this.Tema = Tema;
    }

    public String getPublico() {
        return Publico;
    }

    public void setPublico(String Publico) {
        this.Publico = Publico;
    }

    public String getNrc() {
        return Nrc;
    }

    public void setNrc(String Nrc) {
        this.Nrc = Nrc;
    }

    public String getAsignatura() {
        return Asignatura;
    }

    public void setAsignatura(String Asignatura) {
        this.Asignatura = Asignatura;
    }

    public String getPeriodo() {
        return Periodo;
    }

    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }

    public String getNivel() {
        return Nivel;
    }

    public void setNivel(String Nivel) {
        this.Nivel = Nivel;
    }

    public String getAula() {
        return Aula;
    }

    public void setAula(String Aula) {
        this.Aula = Aula;
    }

    public String getFechaTutoria() {
        return FechaTutoria;
    }

    public void setFechaTutoria(String FechaTutoria) {
        this.FechaTutoria = FechaTutoria;
    }

    public String getHoraInicio() {
        return HoraInicio;
    }

    public void setHoraInicio(String HoraInicio) {
        this.HoraInicio = HoraInicio;
    }

    public String getHoraFin() {
        return HoraFin;
    }

    public void setHoraFin(String HoraFin) {
        this.HoraFin = HoraFin;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

}
