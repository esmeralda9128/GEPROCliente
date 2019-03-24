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
public class BeanActividad {
    private int idActividad;
    private String actividad;
    private String fechaActividad;
//    private BeanUsuario usuario;

//    public BeanActividad(int idActividad, String actividad, String fechaActividad, BeanUsuario usuario) {
//        this.idActividad = idActividad;
//        this.actividad = actividad;
//        this.fechaActividad = fechaActividad;
//        this.usuario = usuario;
//    }

    public int getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(int idActividad) {
        this.idActividad = idActividad;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    public String getFechaActividad() {
        return fechaActividad;
    }

    public void setFechaActividad(String fechaActividad) {
        this.fechaActividad = fechaActividad;
    }

//    public BeanUsuario getUsuario() {
//        return usuario;
//    }
//
//    public void setUsuario(BeanUsuario usuario) {
//        this.usuario = usuario;
//    }
//    
}
