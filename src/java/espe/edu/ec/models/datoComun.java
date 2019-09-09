/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import java.sql.Date;

/**
 *
 * @author Tefii
 */
public class datoComun {
    private String etiqueta;
    private String query;
    private Date fecha_crea;
    private String usua_crea;
    private Date fecha_modif;
    private String usua_modif;

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
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
