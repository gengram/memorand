// memorand by Gengram
package bean;

import java.io.Serializable;

public class Instituciones implements Serializable {

    private String id_inst;
    private String nom_inst;
    private String tipo_inst;
    private String lim_lider;
    private String lim_part;
    private String lim_grupo;
    private String lim_sector;

    public Instituciones() {}

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

    public String getTipo_inst() {
        return tipo_inst;
    }

    public void setTipo_inst(String tipo_inst) {
        this.tipo_inst = tipo_inst;
    }

    public String getLim_lider() {
        return lim_lider;
    }

    public void setLim_lider(String lim_lider) {
        this.lim_lider = lim_lider;
    }

    public String getLim_part() {
        return lim_part;
    }

    public void setLim_part(String lim_part) {
        this.lim_part = lim_part;
    }

    public String getLim_grupo() {
        return lim_grupo;
    }

    public void setLim_grupo(String lim_grupo) {
        this.lim_grupo = lim_grupo;
    }

    public String getLim_sector() {
        return lim_sector;
    }

    public void setLim_sector(String lim_sector) {
        this.lim_sector = lim_sector;
    }
    
}
