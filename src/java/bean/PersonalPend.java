package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class PersonalPend implements Serializable{
    private String id_personal;
    private String id_pend;
    
    public PersonalPend(){}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_pend() {
        return id_pend;
    }

    public void setId_pend(String id_pend) {
        this.id_pend = id_pend;
    }
    
}
