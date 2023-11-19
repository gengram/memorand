package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Entregan implements Serializable{
    private String id_entrega;
    private String id_tarea;
    private String id_apunte;
    private String fecha_entrega;
    private String hora_entrega;
    private String estado_entrega;
    
    public Entregan(){}

    public String getId_entrega() {
        return id_entrega;
    }

    public void setId_entrega(String id_entrega) {
        this.id_entrega = id_entrega;
    }

    public String getId_tarea() {
        return id_tarea;
    }

    public void setId_tarea(String id_tarea) {
        this.id_tarea = id_tarea;
    }

    public String getId_apunte() {
        return id_apunte;
    }

    public void setId_apunte(String id_apunte) {
        this.id_apunte = id_apunte;
    }

    public String getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(String fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

    public String getHora_entrega() {
        return hora_entrega;
    }

    public void setHora_entrega(String hora_entrega) {
        this.hora_entrega = hora_entrega;
    }

    public String getEstado_entrega() {
        return estado_entrega;
    }

    public void setEstado_entrega(String estado_entrega) {
        this.estado_entrega = estado_entrega;
    }
    
    
}
