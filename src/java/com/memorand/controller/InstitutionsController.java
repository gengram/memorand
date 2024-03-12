package com.memorand.controller;

import com.memorand.beans.Institution;
import com.memorand.model.InstitutionsModel;

public class InstitutionsController {

    public boolean modelCreateInst(Institution inst) {
        
        InstitutionsModel instm = new InstitutionsModel();
        return instm.createInst(inst);
        
    }
    
    public String modelGetAllInst() {
        
        String inst_type = null;
        String htmlcode = "";
        
        InstitutionsModel instm = new InstitutionsModel();
        
        for (Institution i : instm.getAllInst())
        {
            switch (i.getInst_type()) {
                case "escuela":
                    inst_type = "Escuela";
                    break;
                case "empresa":
                    inst_type = "Empresa";
                    break;
                default:
                    inst_type = "Error";
                    break;
            }
            
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ "<img class=\"rounded-3 me-2\" src='../"+ i.getInst_profile() +"' width='40'></img>" + i.getInst_name()+"</td>\n" +
"                    <td>"+ inst_type+"</td>\n" +
"                    <td>"+ i.getLim_ch()+"</td>\n" +
"                    <td>"+ i.getLim_wk() +"</td>\n" +
"                    <td>"+ i.getLim_gp() +"</td>\n" +
"                    <td>"+ i.getLim_ks() +"</td>\n" +
"                    <td>"
                    + "<a href='instituciones/ver.jsp?inst_id="+ i.getInst_id()+"'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a><br>"
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
"                    <td> <img class=\"rounded-3\" src='../"+ i.getInst_profile() +"' width='40'></img> </td>\n" +
"                    <td>"+ i.getInst_name()+"</td>\n" +
"                    <td>"
                    + "<a href='administradores.jsp?view=inst&inst_id="+ i.getInst_id()+"'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a>"
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
