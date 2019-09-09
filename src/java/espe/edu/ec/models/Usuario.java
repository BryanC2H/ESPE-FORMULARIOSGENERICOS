/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

/**
 *
 * @author D4ve
 */
public class Usuario {
    
     private int PIDM;
     private String nombreUsuario;
     private String estLn;
     private String Eseg;
     private String Nombre;
     private String Id;
     private String IdEst;
     private int aux;


    public String getEstLn() {
        return estLn;
    }

    public void setEstLn(String estLn) {
        this.estLn = estLn;
    }
    
  
    /**
     * @return the PIDM
     */
    public int getPIDM() {
        return PIDM;
    }

    /**
     * @param PIDM the PIDM to set
     */
    public void setPIDM(int PIDM) {
        this.PIDM = PIDM;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

   public String getIdEst() {
        return IdEst;
    }

    public void setIdEst(String IdEst) {
        this.IdEst = IdEst;
    }
    
    public String getEseg() {
        return Eseg;
    }

    public void setEseg(String Eseg) {
        this.Eseg = Eseg;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public int getAux() {
        return aux;
    }

    public void setAux(int aux) {
        this.aux = aux;
    }
    

}
