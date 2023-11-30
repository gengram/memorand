package bean;

import java.io.Serializable;

public class GrupoTarea implements Serializable {
    
    String id_tienen;
    String id_tarea;

    public GrupoTarea() {}

    public String getId_tienen() {
        return id_tienen;
    }

    public void setId_tienen(String id_tienen) {
        this.id_tienen = id_tienen;
    }

    public String getId_tarea() {
        return id_tarea;
    }

    public void setId_tarea(String id_tarea) {
        this.id_tarea = id_tarea;
    }
    
}
