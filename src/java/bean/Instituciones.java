package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Instituciones implements Serializable{
    private String id_inst;
    private String nom_inst;
    private String lim_profes;
    private String lim_alumnos;
    
    public Instituciones(){}

    public String getId_inst() {
        return id_inst;
    }

    public void setId_inst(String id_inst) {
        this.id_inst = id_inst;
    }

    public String getNom_inst() {
        return nom_inst;
    }

    public void setNom_inst(String nom_inst) {
        this.nom_inst = nom_inst;
    }

    public String getLim_profes() {
        return lim_profes;
    }

    public void setLim_profes(String lim_profes) {
        this.lim_profes = lim_profes;
    }

    public String getLim_alumnos() {
        return lim_alumnos;
    }

    public void setLim_alumnos(String lim_alumnos) {
        this.lim_alumnos = lim_alumnos;
    }
    
}
