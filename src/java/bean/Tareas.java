package bean;

import java.io.Serializable;

public class Tareas implements Serializable {
    
    private String id_tarea;
    private String nom_tarea;
    private String info_tarea;
    private String fecha_tarea;
    private String final_tarea;
    private String hora_tarea;
    private String autor_tarea;

    public Tareas() {}

    public String getId_tarea() {
        return id_tarea;
    }

    public void setId_tarea(String id_tarea) {
        this.id_tarea = id_tarea;
    }

    public String getNom_tarea() {
        return nom_tarea;
    }

    public void setNom_tarea(String nom_tarea) {
        this.nom_tarea = nom_tarea;
    }

    public String getInfo_tarea() {
        return info_tarea;
    }

    public void setInfo_tarea(String info_tarea) {
        this.info_tarea = info_tarea;
    }

    public String getFecha_tarea() {
        return fecha_tarea;
    }

    public void setFecha_tarea(String fecha_tarea) {
        this.fecha_tarea = fecha_tarea;
    }

    public String getFinal_tarea() {
        return final_tarea;
    }

    public void setFinal_tarea(String final_tarea) {
        this.final_tarea = final_tarea;
    }

    public String getHora_tarea() {
        return hora_tarea;
    }

    public void setHora_tarea(String hora_tarea) {
        this.hora_tarea = hora_tarea;
    }

    public String getAutor_tarea() {
        return autor_tarea;
    }

    public void setAutor_tarea(String autor_tarea) {
        this.autor_tarea = autor_tarea;
    }
    
}
