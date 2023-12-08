package com.miaplicacion;

import java.util.Date;

public class Pendiente {
    private String texto;
    private Date fechaCreacion;
    private Date fechaExpiracion; // Nuevo campo para la fecha de expiración

    public Pendiente(String texto, Date fechaCreacion, Date fechaExpiracion) {
        this.texto = texto;
        this.fechaCreacion = fechaCreacion;
        this.fechaExpiracion = fechaExpiracion; // Inicializar la fecha de expiración
    }

    public String getTexto() {
        return texto;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public Date getFechaExpiracion() {
        return fechaExpiracion; // Método para obtener la fecha de expiración
    }
}
