package bean;

import java.io.Serializable;

public class Personales implements Serializable {
    
    private String id_personal;
    private String id_color;
    private String id_fondo;

    public Personales() {}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_color() {
        return id_color;
    }

    public void setId_color(String id_color) {
        this.id_color = id_color;
    }

    public String getId_fondo() {
        return id_fondo;
    }

    public void setId_fondo(String id_fondo) {
        this.id_fondo = id_fondo;
    }
    
}
