package bean;

import java.io.Serializable;

public class Pendientes implements Serializable {
    
    private String id_pend;
    private String nom_pend;
    private String info_pend;
    private String fecha_pend;
    private String inicio_pend;
    private String final_pend;
    private String estado_pend;

    public Pendientes() {}

    public String getId_pend() {
        return id_pend;
    }

    public void setId_pend(String id_pend) {
        this.id_pend = id_pend;
    }

    public String getNom_pend() {
        return nom_pend;
    }

    public void setNom_pend(String nom_pend) {
        this.nom_pend = nom_pend;
    }

    public String getInfo_pend() {
        return info_pend;
    }

    public void setInfo_pend(String info_pend) {
        this.info_pend = info_pend;
    }

    public String getFecha_pend() {
        return fecha_pend;
    }

    public void setFecha_pend(String fecha_pend) {
        this.fecha_pend = fecha_pend;
    }

    public String getInicio_pend() {
        return inicio_pend;
    }

    public void setInicio_pend(String inicio_pend) {
        this.inicio_pend = inicio_pend;
    }

    public String getFinal_pend() {
        return final_pend;
    }

    public void setFinal_pend(String final_pend) {
        this.final_pend = final_pend;
    }

    public String getEstado_pend() {
        return estado_pend;
    }

    public void setEstado_pend(String estado_pend) {
        this.estado_pend = estado_pend;
    }
    
}
