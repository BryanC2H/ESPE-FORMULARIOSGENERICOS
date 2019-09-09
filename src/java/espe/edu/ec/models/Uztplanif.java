/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aetorres
 */
@Entity
@Table(name = "UZTPLANIF")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Uztplanif.findAll", query = "SELECT u FROM Uztplanif u")
    , @NamedQuery(name = "Uztplanif.findByCodigoUztplanif", query = "SELECT u FROM Uztplanif u WHERE u.codigoUztplanif = :codigoUztplanif")
    , @NamedQuery(name = "Uztplanif.findByCodigoUzgtformularios", query = "SELECT u FROM Uztplanif u WHERE u.codigoUzgtformularios = :codigoUzgtformularios")
    , @NamedQuery(name = "Uztplanif.findByUztplanifFechaform", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifFechaform = :uztplanifFechaform")
    , @NamedQuery(name = "Uztplanif.findByUztplanifTipopersona", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifTipopersona = :uztplanifTipopersona")
    , @NamedQuery(name = "Uztplanif.findByUztplanifTitotutoria", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifTitotutoria = :uztplanifTitotutoria")
    , @NamedQuery(name = "Uztplanif.findBySpridenPidm", query = "SELECT u FROM Uztplanif u WHERE u.spridenPidm = :spridenPidm")
    , @NamedQuery(name = "Uztplanif.findByUztplanifTema", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifTema = :uztplanifTema")
    , @NamedQuery(name = "Uztplanif.findByUztplanifPublico", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifPublico = :uztplanifPublico")
    , @NamedQuery(name = "Uztplanif.findByUztplanifNrc", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifNrc = :uztplanifNrc")
    , @NamedQuery(name = "Uztplanif.findByUztplanifAsignatura", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifAsignatura = :uztplanifAsignatura")
    , @NamedQuery(name = "Uztplanif.findByUztplanifPeriodo", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifPeriodo = :uztplanifPeriodo")
    , @NamedQuery(name = "Uztplanif.findByUztplanifNivel", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifNivel = :uztplanifNivel")
    , @NamedQuery(name = "Uztplanif.findByUztplanifAula", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifAula = :uztplanifAula")
    , @NamedQuery(name = "Uztplanif.findByUztplanifFechatutoria", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifFechatutoria = :uztplanifFechatutoria")
    , @NamedQuery(name = "Uztplanif.findByUztplanifHorainicio", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifHorainicio = :uztplanifHorainicio")
    , @NamedQuery(name = "Uztplanif.findByUztplanifHorafin", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifHorafin = :uztplanifHorafin")
    , @NamedQuery(name = "Uztplanif.findByUztplanifObservacion", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifObservacion = :uztplanifObservacion")
    , @NamedQuery(name = "Uztplanif.findByUztplanifEstado", query = "SELECT u FROM Uztplanif u WHERE u.uztplanifEstado = :uztplanifEstado")})
public class Uztplanif implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @Column(name = "CODIGO_UZTPLANIF")
    private BigDecimal codigoUztplanif;
    @Basic(optional = false)
    @Column(name = "CODIGO_UZGTFORMULARIOS")
    private BigInteger codigoUzgtformularios;
    @Column(name = "UZTPLANIF_FECHAFORM")
    private String uztplanifFechaform;
    @Column(name = "UZTPLANIF_TIPOPERSONA")
    private String uztplanifTipopersona;
    @Column(name = "UZTPLANIF_TITOTUTORIA")
    private String uztplanifTitotutoria;
    @Column(name = "SPRIDEN_PIDM")
    private BigInteger spridenPidm;
    @Column(name = "UZTPLANIF_TEMA")
    private String uztplanifTema;
    @Column(name = "UZTPLANIF_PUBLICO")
    private String uztplanifPublico;
    @Column(name = "UZTPLANIF_NRC")
    private String uztplanifNrc;
    @Column(name = "UZTPLANIF_ASIGNATURA")
    private String uztplanifAsignatura;
    @Column(name = "UZTPLANIF_PERIODO")
    private String uztplanifPeriodo;
    @Column(name = "UZTPLANIF_NIVEL")
    private String uztplanifNivel;
    @Column(name = "UZTPLANIF_AULA")
    private String uztplanifAula;
    @Column(name = "UZTPLANIF_FECHATUTORIA")
    private String uztplanifFechatutoria;
    @Column(name = "UZTPLANIF_HORAINICIO")
    private String uztplanifHorainicio;
    @Column(name = "UZTPLANIF_HORAFIN")
    private String uztplanifHorafin;
    @Column(name = "UZTPLANIF_OBSERVACION")
    private String uztplanifObservacion;
    @Column(name = "UZTPLANIF_ESTADO")
    private String uztplanifEstado;

    public Uztplanif() {
    }

    public Uztplanif(BigDecimal codigoUztplanif) {
        this.codigoUztplanif = codigoUztplanif;
    }

    public Uztplanif(BigDecimal codigoUztplanif, BigInteger codigoUzgtformularios) {
        this.codigoUztplanif = codigoUztplanif;
        this.codigoUzgtformularios = codigoUzgtformularios;
    }

    public BigDecimal getCodigoUztplanif() {
        return codigoUztplanif;
    }

    public void setCodigoUztplanif(BigDecimal codigoUztplanif) {
        this.codigoUztplanif = codigoUztplanif;
    }

    public BigInteger getCodigoUzgtformularios() {
        return codigoUzgtformularios;
    }

    public void setCodigoUzgtformularios(BigInteger codigoUzgtformularios) {
        this.codigoUzgtformularios = codigoUzgtformularios;
    }

    public String getUztplanifFechaform() {
        return uztplanifFechaform;
    }

    public void setUztplanifFechaform(String uztplanifFechaform) {
        this.uztplanifFechaform = uztplanifFechaform;
    }

    public String getUztplanifTipopersona() {
        return uztplanifTipopersona;
    }

    public void setUztplanifTipopersona(String uztplanifTipopersona) {
        this.uztplanifTipopersona = uztplanifTipopersona;
    }

    public String getUztplanifTitotutoria() {
        return uztplanifTitotutoria;
    }

    public void setUztplanifTitotutoria(String uztplanifTitotutoria) {
        this.uztplanifTitotutoria = uztplanifTitotutoria;
    }

    public BigInteger getSpridenPidm() {
        return spridenPidm;
    }

    public void setSpridenPidm(BigInteger spridenPidm) {
        this.spridenPidm = spridenPidm;
    }

    public String getUztplanifTema() {
        return uztplanifTema;
    }

    public void setUztplanifTema(String uztplanifTema) {
        this.uztplanifTema = uztplanifTema;
    }

    public String getUztplanifPublico() {
        return uztplanifPublico;
    }

    public void setUztplanifPublico(String uztplanifPublico) {
        this.uztplanifPublico = uztplanifPublico;
    }

    public String getUztplanifNrc() {
        return uztplanifNrc;
    }

    public void setUztplanifNrc(String uztplanifNrc) {
        this.uztplanifNrc = uztplanifNrc;
    }

    public String getUztplanifAsignatura() {
        return uztplanifAsignatura;
    }

    public void setUztplanifAsignatura(String uztplanifAsignatura) {
        this.uztplanifAsignatura = uztplanifAsignatura;
    }

    public String getUztplanifPeriodo() {
        return uztplanifPeriodo;
    }

    public void setUztplanifPeriodo(String uztplanifPeriodo) {
        this.uztplanifPeriodo = uztplanifPeriodo;
    }

    public String getUztplanifNivel() {
        return uztplanifNivel;
    }

    public void setUztplanifNivel(String uztplanifNivel) {
        this.uztplanifNivel = uztplanifNivel;
    }

    public String getUztplanifAula() {
        return uztplanifAula;
    }

    public void setUztplanifAula(String uztplanifAula) {
        this.uztplanifAula = uztplanifAula;
    }

    public String getUztplanifFechatutoria() {
        return uztplanifFechatutoria;
    }

    public void setUztplanifFechatutoria(String uztplanifFechatutoria) {
        this.uztplanifFechatutoria = uztplanifFechatutoria;
    }

    public String getUztplanifHorainicio() {
        return uztplanifHorainicio;
    }

    public void setUztplanifHorainicio(String uztplanifHorainicio) {
        this.uztplanifHorainicio = uztplanifHorainicio;
    }

    public String getUztplanifHorafin() {
        return uztplanifHorafin;
    }

    public void setUztplanifHorafin(String uztplanifHorafin) {
        this.uztplanifHorafin = uztplanifHorafin;
    }

    public String getUztplanifObservacion() {
        return uztplanifObservacion;
    }

    public void setUztplanifObservacion(String uztplanifObservacion) {
        this.uztplanifObservacion = uztplanifObservacion;
    }

    public String getUztplanifEstado() {
        return uztplanifEstado;
    }

    public void setUztplanifEstado(String uztplanifEstado) {
        this.uztplanifEstado = uztplanifEstado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigoUztplanif != null ? codigoUztplanif.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Uztplanif)) {
            return false;
        }
        Uztplanif other = (Uztplanif) object;
        if ((this.codigoUztplanif == null && other.codigoUztplanif != null) || (this.codigoUztplanif != null && !this.codigoUztplanif.equals(other.codigoUztplanif))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "FORM.Uztplanif[ codigoUztplanif=" + codigoUztplanif + " ]";
    }
    
}
