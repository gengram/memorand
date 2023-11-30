package bean;

import java.io.Serializable;

public class Inscriben implements Serializable {

    private String id_inscrib;
    private String id_perten;
    private String id_grupos;

    public Inscriben() {}

    public String getId_inscrib() {
        return id_inscrib;
    }

    public void setId_inscrib(String id_inscrib) {
        this.id_inscrib = id_inscrib;
    }

    public String getId_perten() {
        return id_perten;
    }

    public void setId_perten(String id_perten) {
        this.id_perten = id_perten;
    }

    public String getId_grupos() {
        return id_grupos;
    }

    public void setId_grupos(String id_grupos) {
        this.id_grupos = id_grupos;
    }

}
