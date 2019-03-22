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
public class BeanProyecto {
    private int idProyecto;
    private String nombreProyecto;
    private String inicioProyecto;
    private String finalProyecto;
    private int semanas;
    private double presupuesto;
    private double reserva;

    public BeanProyecto(int idProyecto, String nombreProyecto, String inicioProyecto,int semanas, double presupuesto, double reserva) {
        this.idProyecto = idProyecto;
        this.nombreProyecto = nombreProyecto;
        this.inicioProyecto = inicioProyecto;
        this.semanas = semanas;
        this.presupuesto = presupuesto;
        this.reserva = reserva;
    }

    public BeanProyecto() {
    }

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public String getInicioProyecto() {
        return inicioProyecto;
    }

    public void setInicioProyecto(String inicioProyecto) {
        this.inicioProyecto = inicioProyecto;
    }

    public String getFinalProyecto() {
        return finalProyecto;
    }

    public void setFinalProyecto(String finalProyecto) {
        this.finalProyecto = finalProyecto;
    }

    public int getSemanas() {
        return semanas;
    }

    public void setSemanas(int semanas) {
        this.semanas = semanas;
    }

    public double getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(double presupuesto) {
        this.presupuesto = presupuesto;
    }

    public double getReserva() {
        return reserva;
    }

    public void setReserva(double reserva) {
        this.reserva = reserva;
    }
}
