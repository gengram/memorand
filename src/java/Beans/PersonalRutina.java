package Beans;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class PersonalRutina implements Serializable{
    private String id_personal;
    private String id_rutina;
    
    public PersonalRutina(){}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_rutina() {
        return id_rutina;
    }

    public void setId_rutina(String id_rutina) {
        this.id_rutina = id_rutina;
    }
    
}
