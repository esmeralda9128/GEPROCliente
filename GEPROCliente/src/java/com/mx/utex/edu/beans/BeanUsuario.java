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
public class BeanUsuario {
    private int idUsuario;
    private String nombreUsuario;
    private String primerApellido;
    private String segundoApellido;
    private String usuario;
    private String pass;
    private String rol;
    private double salario;
    private String gradoEstudios;
    private String carrera;
    private String email;
    private double valorGanado;
    private BeanProyecto proyecto;

    public BeanUsuario(int idUsuario, String nombreUsuario, String primerApellido, String segundoApellido, String usuario, String pass, String rol, double salario, String gradoEstudios, String carrera, String email, double valorGanado, BeanProyecto proyecto) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.usuario = usuario;
        this.pass = pass;
        this.rol = rol;
        this.salario = salario;
        this.gradoEstudios = gradoEstudios;
        this.carrera = carrera;
        this.email = email;
        this.valorGanado = valorGanado;
        this.proyecto = proyecto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getGradoEstudios() {
        return gradoEstudios;
    }

    public void setGradoEstudios(String gradoEstudios) {
        this.gradoEstudios = gradoEstudios;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getValorGanado() {
        return valorGanado;
    }

    public void setValorGanado(double valorGanado) {
        this.valorGanado = valorGanado;
    }

    public BeanProyecto getProyecto() {
        return proyecto;
    }

    public void setProyecto(BeanProyecto proyecto) {
        this.proyecto = proyecto;
    }
    
}
