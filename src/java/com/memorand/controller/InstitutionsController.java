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
                    + "<a href='instituciones/editar.jsp?inst_id="+ i.getInst_id()+"'>Editar</a><br>"
                    + "<a href='administradores.jsp?inst_id="+ i.getInst_id()+"'>Ver administradores</a>"
                  + "</td>\n" +
"           </tr>";
        }
        
        return htmlcode;
        
    }
}
