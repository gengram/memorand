package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Rutinas implements Serializable{
    private String id_rutina;
    private String nom_rutina;
    private String info_rutina;
    private String dias_rutina;
    private String hora_rutina;
    
    public Rutinas(){}

    public String getId_rutina() {
        return id_rutina;
    }

    public void setId_rutina(String id_rutina) {
        this.id_rutina = id_rutina;
    }

    public String getNom_rutina() {
        return nom_rutina;
    }

    public void setNom_rutina(String nom_rutina) {
        this.nom_rutina = nom_rutina;
    }

    public String getInfo_rutina() {
        return info_rutina;
    }

    public void setInfo_rutina(String info_rutina) {
        this.info_rutina = info_rutina;
    }

    public String getDias_rutina() {
        return dias_rutina;
    }

    public void setDias_rutina(String dias_rutina) {
        this.dias_rutina = dias_rutina;
    }

    public String getHora_rutina() {
        return hora_rutina;
    }

    public void setHora_rutina(String hora_rutina) {
        this.hora_rutina = hora_rutina;
    }
    
}
