// memorand by Gengram
package bean;

import java.io.Serializable;

public class Pertenecen implements Serializable {
    
    private String id_perten;
    private String id_inst;
    private String id_usuario;

    public Pertenecen() {}

    public String getId_perten() {
        return id_perten;
    }

    public void setId_perten(String id_perten) {
        this.id_perten = id_perten;
    }
    
    public String getId_inst() {
        return id_inst;
    }

    public void setId_inst(String id_inst) {
        this.id_inst = id_inst;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

}
