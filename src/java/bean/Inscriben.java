package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Inscriben implements Serializable{
    private String id_inscrip;
    private String id_usuario;
    private String id_inst;
    private String id_grupo;
    private String id_asigna;
    
    public Inscriben(){}

    public String getId_inscrip() {
        return id_inscrip;
    }

    public void setId_inscrip(String id_inscrip) {
        this.id_inscrip = id_inscrip;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_inst() {
        return id_inst;
    }

    public void setId_inst(String id_inst) {
        this.id_inst = id_inst;
    }

    public String getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(String id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getId_asigna() {
        return id_asigna;
    }

    public void setId_asigna(String id_asigna) {
        this.id_asigna = id_asigna;
    }
    
}
