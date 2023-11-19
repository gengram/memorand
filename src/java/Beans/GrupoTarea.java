package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class GrupoTarea implements Serializable{
    private String id_grupo;
    private String id_tarea;
    
    public GrupoTarea(){}

    public String getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(String id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getId_tarea() {
        return id_tarea;
    }

    public void setId_tarea(String id_tarea) {
        this.id_tarea = id_tarea;
    }
    
}
