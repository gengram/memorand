package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Cuentan implements Serializable{
    private String id_usuario;
    private String id_personal;
    
    public Cuentan(){}

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

}
