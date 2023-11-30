package bean;

import java.io.Serializable;

public class Ordenan implements Serializable {
    
    private String id_personal;
    private String id_usuario;

    public Ordenan() {}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    
}
