package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class AsignasGrupo implements Serializable{
    private String id_asigna;
    private String id_grupo;

    public AsignasGrupo() {}

    public String getId_asigna() {
        return id_asigna;
    }

    public void setId_asigna(String id_asigna) {
        this.id_asigna = id_asigna;
    }

    public String getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(String id_grupo) {
        this.id_grupo = id_grupo;
    }
    
}
