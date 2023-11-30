package bean;

import java.io.Serializable;

public class InstGrupos implements Serializable {

    private String id_inst;
    private String id_grupo;

    public InstGrupos() {}

    public String getId_inst() {
        return id_inst;
    }

    public void setId_inst(String id_inst) {
        this.id_inst = id_inst;
    }

    public String getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(String id_grupo) {
        this.id_grupo = id_grupo;
    }

}
