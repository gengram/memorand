package com.memorand.controller;

import com.memorand.beans.Institution;
import com.memorand.model.InstitutionsModel;

public class InstitutionsController {

    public boolean modelCreateInst(Institution inst) {
        
        InstitutionsModel instm = new InstitutionsModel();
        return instm.createInst(inst);
        
    }
    
    public String modelGetAllInst() {
    
        String htmlcode = "";
        
        InstitutionsModel instm = new InstitutionsModel();
        
        for (Institution i : instm.getAllInst())
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ i.getInst_id() +"</td>\n" +
"                    <td>"+ i.getInst_name()+"</td>\n" +
"                    <td>"+ i.getInst_type()+"</td>\n" +
"                    <td> <img src='../"+ i.getInst_profile() +"' width='40'></img> </td>\n" +
"                    <td>"+ i.getLim_ch()+"</td>\n" +
"                    <td>"+ i.getLim_wk() +"</td>\n" +
"                    <td>"+ i.getLim_gp() +"</td>\n" +
"                    <td>"+ i.getLim_ks() +"</td>\n" +
"                    <td>"
                    + "<a href='instituciones/ver.jsp?inst_id="+ i.getInst_id()+"'>Ver</a><br>"
                  + "</td>\n" +
"           </tr>";
        }
        
        return htmlcode;
        
    }
    
    public String modelGetLimInst() {
    
        String htmlcode = "";
        
        InstitutionsModel instm = new InstitutionsModel();
        
        for (Institution i : instm.getAllInst())
        {
            htmlcode +=
            "<tr>\n" +
"                    <td> <img src='../"+ i.getInst_profile() +"' width='40'></img> </td>\n" +
"                    <td>"+ i.getInst_name()+"</td>\n" +
"                    <td>"
                    + "<a href='administradores.jsp?view=inst&inst_id="+ i.getInst_id()+"'>Ver administradores</a>"
                  + "</td>\n" +
"           </tr>";
        }
        
        return htmlcode;
        
    }
    
    public String modelGetOptionInst() {
    
        String htmlcode = "";
        
        InstitutionsModel instm = new InstitutionsModel();
        
        for (Institution i : instm.getAllInst())
        {
            htmlcode +=
            "<option value='"+ i.getInst_id() +"'>"+ i.getInst_name() +"</option>";
        }
    
        return htmlcode;
    }
    
    public Institution modelGetInstById(String i_id) {
    
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstInfoById(i_id);
        
    }
    
    public Institution modelGetInstByUser(String user_id) {
    
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstInfoByUser(user_id);
        
    }
    
}
