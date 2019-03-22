/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mx.utex.edu.beans;

/**
 *
 * @author Alberto
 */
public class BeanNomina {
    private int idNomina;
    private String fecha;
    private BeanProyecto proyecto;
    private BeanRecursoHumano persona;

    public BeanNomina(int idNomina, String fecha, BeanProyecto proyecto, BeanRecursoHumano persona) {
        this.idNomina = idNomina;
        this.fecha = fecha;
        this.proyecto = proyecto;
        this.persona = persona;
    }

    public int getIdNomina() {
        return idNomina;
    }

    public void setIdNomina(int idNomina) {
        this.idNomina = idNomina;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public BeanProyecto getProyecto() {
        return proyecto;
    }

    public void setProyecto(BeanProyecto proyecto) {
        this.proyecto = proyecto;
    }

    public BeanRecursoHumano getPersona() {
        return persona;
    }

    public void setPersona(BeanRecursoHumano persona) {
        this.persona = persona;
    }
    
}
