package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class PersonalApunte implements Serializable{
    private String id_personal;
    private String id_apunte;
    
    public PersonalApunte(){}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_apunte() {
        return id_apunte;
    }

    public void setId_apunte(String id_apunte) {
        this.id_apunte = id_apunte;
    }
    
}
