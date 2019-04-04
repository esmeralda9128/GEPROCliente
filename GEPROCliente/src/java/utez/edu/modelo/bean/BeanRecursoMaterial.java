/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utez.edu.modelo.bean;

import com.mx.utex.edu.beans.BeanProyecto;

/**
 *
 * @author Alberto
 */
public class BeanRecursoMaterial {
    private int idRecuroMat;
    private String nombreRecursoMat;
    private double costoUnitario;
    private int cantidad;
    private double total;
    private int idProyecto;

    public BeanRecursoMaterial() {
    
    }

    public BeanRecursoMaterial(String nombreRecursoMat, double costoUnitario, int cantidad) {
        this.nombreRecursoMat = nombreRecursoMat;
        this.costoUnitario = costoUnitario;
        this.cantidad = cantidad;
    }

    public int getIdRecuroMat() {
        return idRecuroMat;
    }

    public void setIdRecuroMat(int idRecuroMat) {
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

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }

   
    
}
