package bean;

import java.io.Serializable;

/*Memorand by Gengram © 2023*/
public class PersonalIdea implements Serializable{
    private String id_personal;
    private String id_idea;
    
    public PersonalIdea(){}

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getId_idea() {
        return id_idea;
    }

    public void setId_idea(String id_idea) {
        this.id_idea = id_idea;
    }

}
