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
public class Matriz {
    private int codigo_matriz;
    private int codigo_formulario;
    private int codigo_grupo;
    private int codigo_pregunta;
    private int columna;
    private int fila;
    private String Descripcion;
    private Date fecha_crea;
    private String usua_crea;
    private Date fecha_modif;
    private String usua_modif;

    public Matriz(int codigo_matriz, int codigo_formulario, int codigo_grupo, int codigo_pregunta, int columna, int fila, String Descripcion) {
        this.codigo_matriz = codigo_matriz;
        this.codigo_formulario = codigo_formulario;
        this.codigo_grupo = codigo_grupo;
        this.codigo_pregunta = codigo_pregunta;
        this.columna = columna;
        this.fila = fila;
        this.Descripcion = Descripcion;
    }

    public int getCodigo_matriz() {
        return codigo_matriz;
    }

    public void setCodigo_matriz(int codigo_matriz) {
        this.codigo_matriz = codigo_matriz;
    }

    public int getCodigo_formulario() {
        return codigo_formulario;
    }

    public void setCodigo_formulario(int codigo_formulario) {
        this.codigo_formulario = codigo_formulario;
    }

    public int getCodigo_grupo() {
        return codigo_grupo;
    }

    public void setCodigo_grupo(int codigo_grupo) {
        this.codigo_grupo = codigo_grupo;
    }

    public int getCodigo_pregunta() {
        return codigo_pregunta;
    }

    public void setCodigo_pregunta(int codigo_pregunta) {
        this.codigo_pregunta = codigo_pregunta;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
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
