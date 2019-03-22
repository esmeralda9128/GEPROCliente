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
public class BeanRecursoComprado {
    private int idRecursoCom;
    private String fecha;
    private BeanProyecto proyecto;
    private BeanRecursoMaterial materiales;

    public BeanRecursoComprado(int idRecursoCom, String fecha, BeanProyecto proyecto, BeanRecursoMaterial materiales) {
        this.idRecursoCom = idRecursoCom;
        this.fecha = fecha;
        this.proyecto = proyecto;
        this.materiales = materiales;
    }

    public int getIdRecursoCom() {
        return idRecursoCom;
    }

    public void setIdRecursoCom(int idRecursoCom) {
        this.idRecursoCom = idRecursoCom;
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

    public BeanRecursoMaterial getMateriales() {
        return materiales;
    }

    public void setMateriales(BeanRecursoMaterial materiales) {
        this.materiales = materiales;
    }
    
}
