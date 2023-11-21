package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class GrupoApunte implements Serializable{
    private String id_grupo;
    private String id_apunte;
    
    public GrupoApunte(){}

    public String getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(String id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getId_apunte() {
        return id_apunte;
    }

    public void setId_apunte(String id_apunte) {
        this.id_apunte = id_apunte;
    }
    
}
