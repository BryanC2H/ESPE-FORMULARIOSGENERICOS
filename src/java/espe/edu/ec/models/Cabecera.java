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
public class Cabecera {
    private int codigo_cabecera;
    private int codigo_matriz;
    private String Valor_cabecera;
    private int posicionX;
    private int posicionY;
    private Date fecha_crea;
    private String usua_crea;
    private Date fecha_modif;
    private String usua_modif;

    public Cabecera(int codigo_cabecera, int codigo_matriz, String Valor_cabecera, int posicionX, int posicionY) {
        this.codigo_cabecera = codigo_cabecera;
        this.codigo_matriz = codigo_matriz;
        this.Valor_cabecera = Valor_cabecera;
        this.posicionX = posicionX;
        this.posicionY = posicionY;
    }

    public int getCodigo_cabecera() {
        return codigo_cabecera;
    }

    public void setCodigo_cabecera(int codigo_cabecera) {
        this.codigo_cabecera = codigo_cabecera;
    }

    public int getCodigo_matriz() {
        return codigo_matriz;
    }

    public void setCodigo_matriz(int codigo_matriz) {
        this.codigo_matriz = codigo_matriz;
    }

    public String getValor_cabecera() {
        return Valor_cabecera;
    }

    public void setValor_cabecera(String Valor_cabecera) {
        this.Valor_cabecera = Valor_cabecera;
    }

    public int getPosicionX() {
        return posicionX;
    }

    public void setPosicionX(int posicionX) {
        this.posicionX = posicionX;
    }

    public int getPosicionY() {
        return posicionY;
    }

    public void setPosicionY(int posicionY) {
        this.posicionY = posicionY;
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
