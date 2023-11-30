package bean;

import java.io.Serializable;

public class PersonalPend implements Serializable {
    
    private String id_personal;
    private String id_pendiente;

    public PersonalPend() {}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_pendiente() {
        return id_pendiente;
    }

    public void setId_pendiente(String id_pendiente) {
        this.id_pendiente = id_pendiente;
    }
    
}
