package bean;

import java.io.Serializable;

public class Tienen implements Serializable {
    
    private String id_tienen;
    private String id_inscrib;
    private String id_sector;

    public Tienen() {}

    public String getId_tienen() {
        return id_tienen;
    }

    public void setId_tienen(String id_tienen) {
        this.id_tienen = id_tienen;
    }

    public String getId_inscrib() {
        return id_inscrib;
    }

    public void setId_inscrib(String id_inscrib) {
        this.id_inscrib = id_inscrib;
    }

    public String getId_sector() {
        return id_sector;
    }

    public void setId_sector(String id_sector) {
        this.id_sector = id_sector;
    }
    
}
