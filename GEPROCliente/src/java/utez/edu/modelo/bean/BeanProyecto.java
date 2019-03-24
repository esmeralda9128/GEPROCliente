/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utez.edu.modelo.bean;

/**
 *
 * @author horo_
 */
public class BeanProyecto {

    private int idProyecto,semanas;
    private String nombre, inicioProyecto, finalProyecto;
    private double presupuestoInicial, reserva;
    private BeanUsuario lider = new BeanUsuario();

    public BeanProyecto() {
    }

    public BeanProyecto(String nombre, String inicioProyecto, int semanas, double presupuestoInicial, double reserva) {
        this.nombre = nombre;
        this.inicioProyecto = inicioProyecto;
        this.semanas = semanas;
        this.presupuestoInicial = presupuestoInicial;
        this.reserva = reserva;
    }

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public double getPresupuestoInicial() {
        return presupuestoInicial;
    }

    public void setPresupuestoInicial(double presupuestoInicial) {
        this.presupuestoInicial = presupuestoInicial;
    }

    public double getReserva() {
        return reserva;
    }

    public void setReserva(double reserva) {
        this.reserva = reserva;
    }

    public BeanUsuario getLider() {
        return lider;
    }

    public void setLider(BeanUsuario lider) {
        this.lider = lider;
    }

}
