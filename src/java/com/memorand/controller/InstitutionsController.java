package com.memorand.controller;

import com.memorand.beans.Institution;
import com.memorand.model.InstitutionsModel;
import java.util.ArrayList;

public class InstitutionsController {

    public boolean modelCreateInst(Institution inst)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.createInst(inst);
    }
    
    public Institution modelGetInstById(String i_id)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstInfoById(i_id);
    }
    
    public String modelInstTableById(String i_id)
    {
        String htmlcode = "<table border=\"1\">\n"
                + "                <thead>\n"
                + "                    <tr>\n"
                + "                        <th></th>\n"
                + "                        <th>Nombre</th>\n"
                + "                        <th>L&iacute;deres</th>\n"
                + "                        <th>Integrantes</th>\n"
                + "                        <th>Grupos</th>\n"
                + "                        <th>Proyectos</th>\n"
                + "                        <th></th>\n"
                + "                    </tr>\n"
                + "                </thead>\n"
                + "                <tbody>";
        
        InstitutionsModel instm = new InstitutionsModel();

        Institution i = instm.getInstInfoById(i_id);
        
        if (i != null)
        {
            InstitutionsModel inst_counter = new InstitutionsModel();

            htmlcode
                    += "<tr>\n"
                    + "     <td>" + i.getInst_status() +"</td>"
                    + "     <td> <img src='../" + i.getInst_profile() + "' width='40'></img>" + i.getInst_name() + " " + i.getInst_type() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "ch") + "/" + i.getLim_ch() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "wk") + "/" + i.getLim_wk() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "teams") + "/" + i.getLim_gp() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "projects") + "/" + i.getLim_ks() + "</td>\n"
                    + "     <td>"
                    + "         <a href='institucion.jsp?id=" + i.getInst_id() + "'>Ver</a>"
                    + "     </td>\n"
                    + "</tr>\n";
        }

        htmlcode += "</tbody>\n"
            + "</table>";
        
        return htmlcode;
    }
    
    public Institution modelGetInstByUser(String user_id)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstInfoByUser(user_id);
    }
    
    public String modelGetResourceCountById(String inst_id, String res_name)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return String.valueOf(instm.getResourceCountById(inst_id, res_name));
    }
    
    public String modelGetAllInstByStatus(String i_status)
    {
        String htmlcode = "<table border=\"1\">\n"
                + "                <thead>\n"
                + "                    <tr>\n"
                + "                        <th></th>\n"
                + "                        <th>Nombre</th>\n"
                + "                        <th>L&iacute;deres</th>\n"
                + "                        <th>Integrantes</th>\n"
                + "                        <th>Grupos</th>\n"
                + "                        <th>Proyectos</th>\n"
                + "                        <th></th>\n"
                + "                    </tr>\n"
                + "                </thead>\n"
                + "                <tbody>";
        
        InstitutionsModel instm = new InstitutionsModel();
        ArrayList<Institution> insts = instm.getAllInstByStatus(i_status);
        
        if (insts.isEmpty()) 
            htmlcode = "<p>No hay instituciones disponibles.</p>";
        else
        {
            for (Institution i : insts)
            {
                InstitutionsModel inst_counter = new InstitutionsModel();

                htmlcode
                        += "<tr>\n"
                        + "     <td>" + i.getInst_status() +"</td>"
                        + "     <td> <img src='../" + i.getInst_profile() + "' width='40'></img>" + i.getInst_name() + " " + i.getInst_type() + "</td>\n"
                        + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "ch") + "/" + i.getLim_ch() + "</td>\n"
                        + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "wk") + "/" + i.getLim_wk() + "</td>\n"
                        + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "teams") + "/" + i.getLim_gp() + "</td>\n"
                        + "     <td>" + inst_counter.getResourceCountById(i.getInst_id(), "projects") + "/" + i.getLim_ks() + "</td>\n"
                        + "     <td>"
                        + "         <a href='institucion.jsp?id=" + i.getInst_id() + "'>Ver</a>"
                        + "     </td>\n"
                        + "</tr>\n";
            }

            htmlcode += "</tbody>\n" +
    "            </table>";
        }
        
        return htmlcode;
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllInst() {
        
        String inst_type;
        String htmlcode = "";
        
        InstitutionsModel instm = new InstitutionsModel();
        
        for (Institution i : instm.getAllInst())
        {
            InstitutionsModel inst_counter = new InstitutionsModel();
            
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
"                    <td>"+ inst_counter.getResourceCountById(i.getInst_id(), "ch") +"/"+ i.getLim_ch()+"</td>\n" +
"                    <td>"+ inst_counter.getResourceCountById(i.getInst_id(), "wk") +"/"+ i.getLim_wk() +"</td>\n" +
"                    <td>"+ inst_counter.getResourceCountById(i.getInst_id(), "teams") +"/"+ i.getLim_gp() +"</td>\n" +
"                    <td>"+ inst_counter.getResourceCountById(i.getInst_id(), "projects") +"/"+ i.getLim_ks() +"</td>\n" +
"                    <td>"
                    + "<a href='instituciones/ver.jsp?inst_id="+ i.getInst_id()+"'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a><br>"
                  + "</td>\n" +
"           </tr>";
        }
        
        return htmlcode;
        
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
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
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
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
    
}