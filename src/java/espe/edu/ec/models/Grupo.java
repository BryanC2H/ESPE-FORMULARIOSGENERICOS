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
public class Grupo {
    private int Codigo_formulario;
    private int Codigo_grupo;
    private String Nombre_grupo;
    private String Descripcion_grupo;
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

    public String getNombre_grupo() {
        return Nombre_grupo;
    }

    public void setNombre_grupo(String Nombre_grupo) {
        this.Nombre_grupo = Nombre_grupo;
    }

    public String getDescripcion_grupo() {
        return Descripcion_grupo;
    }

    public void setDescripcion_grupo(String Descripcion_grupo) {
        this.Descripcion_grupo = Descripcion_grupo;
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
