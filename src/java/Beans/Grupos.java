package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Grupos implements Serializable{
    private String id_grupo;
    private String nom_grupo;
    
    public Grupos(){}

    public String getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(String id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getNom_grupo() {
        return nom_grupo;
    }

    public void setNom_grupo(String nom_grupo) {
        this.nom_grupo = nom_grupo;
    }
    
}
