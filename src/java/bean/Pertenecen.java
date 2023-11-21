package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Pertenecen implements Serializable{
     private String id_inst;
     private String id_usuario;
     
     public Pertenecen(){}

    public String getId_inst() {
        return id_inst;
    }

    public void setId_inst(String id_inst) {
        this.id_inst = id_inst;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
}
