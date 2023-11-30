package bean;

import java.io.Serializable;

public class Apuntes implements Serializable {
    
    private String id_apunte;
    private String nom_apunte;
    private String texto_apunte;
    private String fecha_apunte;
    private String autor_apunte;
    private String usado_apunte;

    public Apuntes() {}

    public String getId_apunte() {
        return id_apunte;
    }

    public void setId_apunte(String id_apunte) {
        this.id_apunte = id_apunte;
    }

    public String getNom_apunte() {
        return nom_apunte;
    }

    public void setNom_apunte(String nom_apunte) {
        this.nom_apunte = nom_apunte;
    }

    public String getTexto_apunte() {
        return texto_apunte;
    }

    public void setTexto_apunte(String texto_apunte) {
        this.texto_apunte = texto_apunte;
    }

    public String getFecha_apunte() {
        return fecha_apunte;
    }

    public void setFecha_apunte(String fecha_apunte) {
        this.fecha_apunte = fecha_apunte;
    }

    public String getAutor_apunte() {
        return autor_apunte;
    }

    public void setAutor_apunte(String autor_apunte) {
        this.autor_apunte = autor_apunte;
    }

    public String getUsado_apunte() {
        return usado_apunte;
    }

    public void setUsado_apunte(String usado_apunte) {
        this.usado_apunte = usado_apunte;
    }
    
}
