package bean;

import java.io.Serializable;

public class InstSector implements Serializable {
    
    private String id_inst;
    private String id_sector;

    public InstSector() {}

    public String getId_inst() {
        return id_inst;
    }

    public void setId_inst(String id_inst) {
        this.id_inst = id_inst;
    }

    public String getId_sector() {
        return id_sector;
    }

    public void setId_sector(String id_sector) {
        this.id_sector = id_sector;
    }
    
}
