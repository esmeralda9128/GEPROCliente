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
public class BeanRecursoMaterial {
    private String idRecuroMat;
    private String nombreRecursoMat;
    private double costoUnitario;
    private int cantidad;
    private double total;
    private BeanProyecto proyecto;

    public BeanRecursoMaterial(String idRecuroMat, String nombreRecursoMat, double costoUnitario, int cantidad, double total, BeanProyecto proyecto) {
        this.idRecuroMat = idRecuroMat;
        this.nombreRecursoMat = nombreRecursoMat;
        this.costoUnitario = costoUnitario;
        this.cantidad = cantidad;
        this.total = total;
        this.proyecto = proyecto;
    }

    public String getIdRecuroMat() {
        return idRecuroMat;
    }

    public void setIdRecuroMat(String idRecuroMat) {
        this.idRecuroMat = idRecuroMat;
    }

    public String getNombreRecursoMat() {
        return nombreRecursoMat;
    }

    public void setNombreRecursoMat(String nombreRecursoMat) {
        this.nombreRecursoMat = nombreRecursoMat;
    }

    public double getCostoUnitario() {
        return costoUnitario;
    }

    public void setCostoUnitario(double costoUnitario) {
        this.costoUnitario = costoUnitario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public BeanProyecto getProyecto() {
        return proyecto;
    }

    public void setProyecto(BeanProyecto proyecto) {
        this.proyecto = proyecto;
    }
    
}
