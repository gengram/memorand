package com.memorand.controller;

import com.memorand.beans.AppRequest;
import com.memorand.model.AppRequestsModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class AppRequestsController
{
    private final String htmlReqTable = "<table class='table'>"
                + "                <thead>\n"
                + "                    <tr>\n"
                + "                        <th scope='col'></th>\n"
                + "                        <th scope='col'>Nombre</th>\n"
                + "                        <th scope='col'>Correo</th>\n"
                + "                        <th scope='col'>Fecha</th>\n"
                + "                        <th scope='col'></th>\n"
                + "                    </tr>\n"
                + "                </thead>\n"
                + "                <tbody id='table-body'>";
    
    private final String htmlNoReq = "<p><i>No hay solicitudes disponibles.</i></p>";
    
    public boolean modelCreateRequest(AppRequest req)
    {
        AppRequestsModel reqm = new AppRequestsModel();
        return reqm.createRequest(req);
    }
    
    public String modelGetRequests(String req_status)
    {
        String htmlcode = "";
        
        AppRequestsModel reqm = new AppRequestsModel();
        ArrayList<AppRequest> reqs = reqm.getRequests(req_status);
        
        if (reqs.isEmpty())
        {
            htmlcode = htmlNoReq;
            return htmlcode;
        }
        else
        {
            for (AppRequest r : reqs)
            {
                SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));

                String task_edate = sdf.format(r.getReq_date());
                
                String circleFillgreen;
            
                if(r.getReq_status().equals("si"))
                {
                     circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
                }
                else
                {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
                }
                
                htmlcode += "<tr>\n"
                        + "     <td class='align-middle'>"+ circleFillgreen +"</td>\n"
                        + "     <td class='align-middle'>"+ r.getReq_inst() +"</td>\n"
                        + "     <td class='align-middle'>"+ r.getReq_email() +"</td>\n"
                        + "     <td class='align-middle'>"+ task_edate +"</td>\n"
                        + "     <td class='align-middle'><a href='solicitud.jsp?id="+ r.getReq_id() +"'>Ver</a></td>\n"
                        + "</tr>\n";
            }
            
            htmlcode += "</tbody>\n"
                 + "</table>";
        }
        
        return htmlcode;
    }
    
    public boolean modelUpdateRequestStatus(String req_id, String req_status)
    {
        AppRequestsModel reqm = new AppRequestsModel();
        return reqm.updateRequestStatus(req_id, req_status);
    }
}
