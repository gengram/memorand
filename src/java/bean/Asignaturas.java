package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Asignaturas implements Serializable{
    private String id_asigna;
    private String nom_asigna;
    private String color_asigna;
    
    public Asignaturas(){}

    public String getId_asigna() {
        return id_asigna;
    }

    public void setId_asigna(String id_asigna) {
        this.id_asigna = id_asigna;
    }

    public String getNom_asigna() {
        return nom_asigna;
    }

    public void setNom_asigna(String nom_asigna) {
        this.nom_asigna = nom_asigna;
    }

    public String getColor_asigna() {
        return color_asigna;
    }

    public void setColor_asigna(String color_asigna) {
        this.color_asigna = color_asigna;
    }
    
}
