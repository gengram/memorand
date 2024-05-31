package com.memorand.controller;

import com.memorand.beans.Institution;
import com.memorand.model.InstitutionsModel;
import java.util.ArrayList;

public class InstitutionsController
{
    private static final String HTML_INST_TABLE = "<table class='table'>"
            + "<thead>\n"
            + "<tr>\n"
            + "<th scope='col'></th>\n"
            + "<th scope='col'>Nombre</th>\n"
            + "<th scope='col'>L&iacute;deres</th>\n"
            + "<th scope='col'>Integrantes</th>\n"
            + "<th scope='col'>Grupos</th>\n"
            + "<th scope='col'>Proyectos</th>\n"
            + "<th scope='col'></th>\n"
            + "</tr>\n"
            + "</thead>\n"
            + "<tbody id='table-body'>";

    private static final String HTML_NO_INST = "<p><i>No hay instituciones disponibles.</i></p>";

    public boolean modelCreateInstitution(Institution i)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.createInstitution(i);
    }

    public boolean modelUpdateInstitution(Institution i)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.updateInstitution(i);
    }
    
    public boolean modelUpdateInstitutionStatus(String i_id, String i_status)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.updateInstitutionStatus(i_id, i_status);
    }

    public Institution beanGetInstitutions(String i_id)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstitution(i_id);
    }

    public Institution beanGetInstitutionByUser(String u_id)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstitutionByUser(u_id);
    }

    public String modelGetInstitutionResource(String i_id, String resource)
    {
        InstitutionsModel instm = new InstitutionsModel();
        return String.valueOf(instm.getInstitutionResource(i_id, resource));
    }

    // STAFF - ADMIN.JSP
    public String sGetInstitutionInfo(String inst_id)
    {
        String htmlcode = HTML_INST_TABLE;

        InstitutionsModel instm = new InstitutionsModel();

        Institution i = instm.getInstitution(inst_id);

        if (i != null)
        {
            InstitutionsModel inst_counter = new InstitutionsModel();

            String circleFillgreen;
            
            if (i.getInst_status().equals("si"))
            {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            }
            else
            {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
            }

            htmlcode
                    += "<tr>\n"
                    + "     <td>" + circleFillgreen + "</td>"
                    + "     <td> <img class='me-2' src='../" + i.getInst_profile() + "' width='40'></img>" + i.getInst_name() + " " + i.getInst_type() + "</td>\n"
                    + "     <td>" + inst_counter.getInstitutionResource(i.getInst_id(), "ch") + "/" + i.getLim_ch() + "</td>\n"
                    + "     <td>" + inst_counter.getInstitutionResource(i.getInst_id(), "wk") + "/" + i.getLim_wk() + "</td>\n"
                    + "     <td>" + inst_counter.getInstitutionResource(i.getInst_id(), "teams") + "/" + i.getLim_gp() + "</td>\n"
                    + "     <td>" + inst_counter.getInstitutionResource(i.getInst_id(), "projects") + "/" + i.getLim_ks() + "</td>\n"
                    + "     <td>"
                    + "         <a href='institucion.jsp?id=" + i.getInst_id() + "'><i style='color: #7473C0; font-size: 25px' class=\"bi bi-chevron-right\"></i></a>"
                    + "     </td>\n"
                    + "</tr>\n";
        }

        htmlcode += "</tbody>\n"
                + "</table>";

        return htmlcode;
    }

    //STAFF - HOME.JSP
    public String sGetAllInstitutions(String i_status)
    {
        String htmlcode = HTML_INST_TABLE;

        InstitutionsModel instm = new InstitutionsModel();
        ArrayList<Institution> insts = instm.getInstitutions(i_status);

        if (insts.isEmpty())
        {
            htmlcode = HTML_NO_INST;
            return htmlcode;
        }
        else
        {
            for (Institution i : insts)
            {
                InstitutionsModel inst_counter = new InstitutionsModel();

                String circleFillgreen;

                if (i.getInst_status().equals("si"))
                {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
                }
                else
                {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
                }

                htmlcode
                        += "<tr>\n"
                        + "     <td class='align-middle'>" + circleFillgreen + "</td>\n"
                        + "     <td class='align-middle'> <img class='me-2' src='../" + i.getInst_profile() + "' width='48'></img> " + i.getInst_name() + " - " + i.getInst_type() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getInstitutionResource(i.getInst_id(), "ch") + "/" + i.getLim_ch() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getInstitutionResource(i.getInst_id(), "wk") + "/" + i.getLim_wk() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getInstitutionResource(i.getInst_id(), "teams") + "/" + i.getLim_gp() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getInstitutionResource(i.getInst_id(), "projects") + "/" + i.getLim_ks() + "</td>\n"
                        + "     <td class='align-middle'>"
                        + "         <a href='institucion.jsp?id=" + i.getInst_id() + "'><i style='color: #2A2927; font-size: 18px;' class='bi bi-chevron-right'></i></a>"
                        + "     </td>\n"
                        + "</tr>\n";
            }

            htmlcode += "</tbody>\n"
                    + "</table>";
        }

        return htmlcode;
    }
}