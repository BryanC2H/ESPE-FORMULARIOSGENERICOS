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
@Table(name = "UZTASISTENTES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Uztasistentes.findAll", query = "SELECT u FROM Uztasistentes u")
    , @NamedQuery(name = "Uztasistentes.findByCodigoAsiste", query = "SELECT u FROM Uztasistentes u WHERE u.codigoAsiste = :codigoAsiste")
    , @NamedQuery(name = "Uztasistentes.findByCodigoUztplanif", query = "SELECT u FROM Uztasistentes u WHERE u.codigoUztplanif = :codigoUztplanif")
    , @NamedQuery(name = "Uztasistentes.findByCodigoUzgtformularios", query = "SELECT u FROM Uztasistentes u WHERE u.codigoUzgtformularios = :codigoUzgtformularios")
    , @NamedQuery(name = "Uztasistentes.findBySpridenPidm", query = "SELECT u FROM Uztasistentes u WHERE u.spridenPidm = :spridenPidm")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesId", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesId = :uztasistentesId")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesNombre", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesNombre = :uztasistentesNombre")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesCedula", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesCedula = :uztasistentesCedula")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesEmailp", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesEmailp = :uztasistentesEmailp")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesEmails", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesEmails = :uztasistentesEmails")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesFechatutoria", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesFechatutoria = :uztasistentesFechatutoria")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesFecharegistro", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesFecharegistro = :uztasistentesFecharegistro")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesAsiste", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesAsiste = :uztasistentesAsiste")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesRecibe", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesRecibe = :uztasistentesRecibe")
    , @NamedQuery(name = "Uztasistentes.findByUztasistentesComentario", query = "SELECT u FROM Uztasistentes u WHERE u.uztasistentesComentario = :uztasistentesComentario")})
public class Uztasistentes implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @Column(name = "CODIGO_ASISTE")
    private BigDecimal codigoAsiste;
    @Basic(optional = false)
    @Column(name = "CODIGO_UZTPLANIF")
    private BigInteger codigoUztplanif;
    @Basic(optional = false)
    @Column(name = "CODIGO_UZGTFORMULARIOS")
    private BigInteger codigoUzgtformularios;
    @Column(name = "SPRIDEN_PIDM")
    private BigInteger spridenPidm;
    @Column(name = "UZTASISTENTES_ID")
    private String uztasistentesId;
    @Column(name = "UZTASISTENTES_NOMBRE")
    private String uztasistentesNombre;
    @Column(name = "UZTASISTENTES_CEDULA")
    private String uztasistentesCedula;
    @Column(name = "UZTASISTENTES_EMAILP")
    private String uztasistentesEmailp;
    @Column(name = "UZTASISTENTES_EMAILS")
    private String uztasistentesEmails;
    @Column(name = "UZTASISTENTES_FECHATUTORIA")
    private String uztasistentesFechatutoria;
    @Column(name = "UZTASISTENTES_FECHAREGISTRO")
    private String uztasistentesFecharegistro;
    @Column(name = "UZTASISTENTES_ASISTE")
    private String uztasistentesAsiste;
    @Column(name = "UZTASISTENTES_RECIBE")
    private String uztasistentesRecibe;
    @Column(name = "UZTASISTENTES_COMENTARIO")
    private String uztasistentesComentario;

    public Uztasistentes() {
    }

    public Uztasistentes(BigDecimal codigoAsiste) {
        this.codigoAsiste = codigoAsiste;
    }

    public Uztasistentes(BigDecimal codigoAsiste, BigInteger codigoUztplanif, BigInteger codigoUzgtformularios) {
        this.codigoAsiste = codigoAsiste;
        this.codigoUztplanif = codigoUztplanif;
        this.codigoUzgtformularios = codigoUzgtformularios;
    }

    public BigDecimal getCodigoAsiste() {
        return codigoAsiste;
    }

    public void setCodigoAsiste(BigDecimal codigoAsiste) {
        this.codigoAsiste = codigoAsiste;
    }

    public BigInteger getCodigoUztplanif() {
        return codigoUztplanif;
    }

    public void setCodigoUztplanif(BigInteger codigoUztplanif) {
        this.codigoUztplanif = codigoUztplanif;
    }

    public BigInteger getCodigoUzgtformularios() {
        return codigoUzgtformularios;
    }

    public void setCodigoUzgtformularios(BigInteger codigoUzgtformularios) {
        this.codigoUzgtformularios = codigoUzgtformularios;
    }

    public BigInteger getSpridenPidm() {
        return spridenPidm;
    }

    public void setSpridenPidm(BigInteger spridenPidm) {
        this.spridenPidm = spridenPidm;
    }

    public String getUztasistentesId() {
        return uztasistentesId;
    }

    public void setUztasistentesId(String uztasistentesId) {
        this.uztasistentesId = uztasistentesId;
    }

    public String getUztasistentesNombre() {
        return uztasistentesNombre;
    }

    public void setUztasistentesNombre(String uztasistentesNombre) {
        this.uztasistentesNombre = uztasistentesNombre;
    }

    public String getUztasistentesCedula() {
        return uztasistentesCedula;
    }

    public void setUztasistentesCedula(String uztasistentesCedula) {
        this.uztasistentesCedula = uztasistentesCedula;
    }

    public String getUztasistentesEmailp() {
        return uztasistentesEmailp;
    }

    public void setUztasistentesEmailp(String uztasistentesEmailp) {
        this.uztasistentesEmailp = uztasistentesEmailp;
    }

    public String getUztasistentesEmails() {
        return uztasistentesEmails;
    }

    public void setUztasistentesEmails(String uztasistentesEmails) {
        this.uztasistentesEmails = uztasistentesEmails;
    }

    public String getUztasistentesFechatutoria() {
        return uztasistentesFechatutoria;
    }

    public void setUztasistentesFechatutoria(String uztasistentesFechatutoria) {
        this.uztasistentesFechatutoria = uztasistentesFechatutoria;
    }

    public String getUztasistentesFecharegistro() {
        return uztasistentesFecharegistro;
    }

    public void setUztasistentesFecharegistro(String uztasistentesFecharegistro) {
        this.uztasistentesFecharegistro = uztasistentesFecharegistro;
    }

    public String getUztasistentesAsiste() {
        return uztasistentesAsiste;
    }

    public void setUztasistentesAsiste(String uztasistentesAsiste) {
        this.uztasistentesAsiste = uztasistentesAsiste;
    }

    public String getUztasistentesRecibe() {
        return uztasistentesRecibe;
    }

    public void setUztasistentesRecibe(String uztasistentesRecibe) {
        this.uztasistentesRecibe = uztasistentesRecibe;
    }

    public String getUztasistentesComentario() {
        return uztasistentesComentario;
    }

    public void setUztasistentesComentario(String uztasistentesComentario) {
        this.uztasistentesComentario = uztasistentesComentario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigoAsiste != null ? codigoAsiste.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Uztasistentes)) {
            return false;
        }
        Uztasistentes other = (Uztasistentes) object;
        if ((this.codigoAsiste == null && other.codigoAsiste != null) || (this.codigoAsiste != null && !this.codigoAsiste.equals(other.codigoAsiste))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Decrypt.Uztasistentes[ codigoAsiste=" + codigoAsiste + " ]";
    }
    
}
