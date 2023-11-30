package bean;

import java.io.Serializable;

public class Sectores implements Serializable {
    
    private String id_sector;
    private String nom_sector;
    
    public Sectores(){}

    public String getId_sector() {
        return id_sector;
    }

    public void setId_sector(String id_sector) {
        this.id_sector = id_sector;
    }

    public String getNom_sector() {
        return nom_sector;
    }

    public void setNom_sector(String nom_sector) {
        this.nom_sector = nom_sector;
    }
    
}
