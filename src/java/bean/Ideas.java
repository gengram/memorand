package bean;

import java.io.Serializable;

public class Ideas implements Serializable {
    
    String id_idea;
    String texto_idea;
    String fecha_idea;

    public Ideas() {}

    public String getId_idea() {
        return id_idea;
    }

    public void setId_idea(String id_idea) {
        this.id_idea = id_idea;
    }

    public String getTexto_idea() {
        return texto_idea;
    }

    public void setTexto_idea(String texto_idea) {
        this.texto_idea = texto_idea;
    }

    public String getFecha_idea() {
        return fecha_idea;
    }

    public void setFecha_idea(String fecha_idea) {
        this.fecha_idea = fecha_idea;
    }
    
}
