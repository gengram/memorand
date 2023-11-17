package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class Personales implements Serializable{
    private String id_personal;
    private String color_personal;
    private String fondo_personal;
    
    public Personales(){}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getColor_personal() {
        return color_personal;
    }

    public void setColor_personal(String color_personal) {
        this.color_personal = color_personal;
    }

    public String getFondo_personal() {
        return fondo_personal;
    }

    public void setFondo_personal(String fondo_personal) {
        this.fondo_personal = fondo_personal;
    }
    
    
}
