package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Usuarios implements Serializable{
    private String id_usuario;
    private String correo_usuario;
    private String pass_usuario;
    private String tipo_usuario;
    private String nom_usuario;
    private String pat_usuario;
    private String mat_usuario;
    
    public Usuarios(){}

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getCorreo_usuario() {
        return correo_usuario;
    }

    public void setCorreo_usuario(String correo_usuario) {
        this.correo_usuario = correo_usuario;
    }

    public String getPass_usuario() {
        return pass_usuario;
    }

    public void setPass_usuario(String pass_usuario) {
        this.pass_usuario = pass_usuario;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getNom_usuario() {
        return nom_usuario;
    }

    public void setNom_usuario(String nom_usuario) {
        this.nom_usuario = nom_usuario;
    }

    public String getPat_usuario() {
        return pat_usuario;
    }

    public void setPat_usuario(String pat_usuario) {
        this.pat_usuario = pat_usuario;
    }

    public String getMat_usuario() {
        return mat_usuario;
    }

    public void setMat_usuario(String mat_usuario) {
        this.mat_usuario = mat_usuario;
    }
}
