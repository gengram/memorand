package bean;

import java.io.Serializable;

public class GrupoApunte implements Serializable {
    
    private String id_tienen;
    private String id_apunte;

    public GrupoApunte() {}

    public String getId_tienen() {
        return id_tienen;
    }

    public void setId_tienen(String id_tienen) {
        this.id_tienen = id_tienen;
    }

    public String getId_apunte() {
        return id_apunte;
    }

    public void setId_apunte(String id_apunte) {
        this.id_apunte = id_apunte;
    }
    
}
