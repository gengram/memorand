package com.memorand.controller;

import com.memorand.beans.Institution;
import com.memorand.model.InstitutionsModel;
import java.util.ArrayList;

public class InstitutionsController {

    private final String htmlInstTable = "<table class='table'>"
            + "                <thead>\n"
            + "                    <tr>\n"
            + "                        <th scope='col'></th>\n"
            + "                        <th scope='col'>Nombre</th>\n"
            + "                        <th scope='col'>L&iacute;deres</th>\n"
            + "                        <th scope='col'>Integrantes</th>\n"
            + "                        <th scope='col'>Grupos</th>\n"
            + "                        <th scope='col'>Proyectos</th>\n"
            + "                        <th scope='col'></th>\n"
            + "                    </tr>\n"
            + "                </thead>\n"
            + "                <tbody id='table-body'>";

    private final String htmlNoInst = "<p><i>No hay instituciones disponibles.</i></p>";

    public boolean modelCreateInst(Institution inst) {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.createInst(inst);
    }

    public boolean modelUpdateInstStatus(String inst_id, String inst_status) {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.updateInstStatus(inst_id, inst_status);
    }

    public boolean modelUpdateInst(Institution inst) {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.updateInst(inst);
    }

    public Institution modelGetInst(String inst_id) {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstById(inst_id);
    }

    public Institution modelGetInstByUser(String user_id) {
        InstitutionsModel instm = new InstitutionsModel();
        return instm.getInstByUser(user_id);
    }

    public String modelGetResourceCount(String inst_id, String res_name) {
        InstitutionsModel instm = new InstitutionsModel();
        return String.valueOf(instm.getResourceCount(inst_id, res_name));
    }

    public String modelGetInstTable(String inst_id) {
        String htmlcode = htmlInstTable;

        InstitutionsModel instm = new InstitutionsModel();

        Institution i = instm.getInstById(inst_id);

        if (i != null) {
            InstitutionsModel inst_counter = new InstitutionsModel();

            String circleFillgreen;
            if (i.getInst_status().equals("si")) {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            } else {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
            }

            htmlcode
                    += "<tr>\n"
                    + "     <td>" + circleFillgreen + "</td>"
                    + "     <td> <img class='me-2' src='../" + i.getInst_profile() + "' width='40'></img>" + i.getInst_name() + " " + i.getInst_type() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCount(i.getInst_id(), "ch") + "/" + i.getLim_ch() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCount(i.getInst_id(), "wk") + "/" + i.getLim_wk() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCount(i.getInst_id(), "teams") + "/" + i.getLim_gp() + "</td>\n"
                    + "     <td>" + inst_counter.getResourceCount(i.getInst_id(), "projects") + "/" + i.getLim_ks() + "</td>\n"
                    + "     <td>"
                    + "         <a href='institucion.jsp?id=" + i.getInst_id() + "'><i style='color: #7473C0; font-size: 25px' class=\"bi bi-chevron-right\"></i></a>"
                    + "     </td>\n"
                    + "</tr>\n";
        }

        htmlcode += "</tbody>\n"
                + "</table>";

        return htmlcode;
    }

    public String modelGetInsts(String inst_status) {
        String htmlcode = htmlInstTable;

        InstitutionsModel instm = new InstitutionsModel();
        ArrayList<Institution> insts = instm.getInsts(inst_status);

        if (insts.isEmpty()) {
            htmlcode = htmlNoInst;
            return htmlcode;
        } else {
            for (Institution i : insts) {
                InstitutionsModel inst_counter = new InstitutionsModel();

                String circleFillgreen;

                if (i.getInst_status().equals("si")) {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
                } else {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
                }

                htmlcode
                        += "<tr>\n"
                        + "     <td class='align-middle'>" + circleFillgreen + "</td>\n"
                        + "     <td class='align-middle'> <img class='me-2' src='../" + i.getInst_profile() + "' width='48'></img> " + i.getInst_name() + " - " + i.getInst_type() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getResourceCount(i.getInst_id(), "ch") + "/" + i.getLim_ch() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getResourceCount(i.getInst_id(), "wk") + "/" + i.getLim_wk() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getResourceCount(i.getInst_id(), "teams") + "/" + i.getLim_gp() + "</td>\n"
                        + "     <td class='align-middle'>" + inst_counter.getResourceCount(i.getInst_id(), "projects") + "/" + i.getLim_ks() + "</td>\n"
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
