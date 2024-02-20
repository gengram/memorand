package com.memorand.servlets.clusters;

import com.memorand.beans.Cluster;
import com.memorand.beans.InClust;
import com.memorand.controller.ClustersController;
import com.memorand.controller.InClustsController;
import com.memorand.util.Generador;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ClusterNew extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);        
        
        response.setContentType("text/html;charset=UTF-8");
        
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        HttpSession session = request.getSession();
        
        ArrayList<String> clust_fields = new ArrayList<>();
        
        String user_type = (String) session.getAttribute("user_type");
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    clust_fields.add(fi.getString());
            }
            
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        if (user_type != null && user_type.equals("admin"))
        {
            
            Generador g1 = new Generador();
            
            String clust_id = g1.newID();
            String inst_id = (String) session.getAttribute("inst_id");
            
            if (inst_id != null)
            {
                String clust_color = clust_fields.get(1).substring(1); 
                
                Cluster cluster = new Cluster(clust_id, clust_fields.get(0), clust_color);
                ClustersController clustc = new ClustersController();
                
                if (clustc.modelCreateCluster(cluster))
                {
                    InClust inclust = new InClust(inst_id, clust_id);
                    InClustsController inclustc = new InClustsController();
                    
                    if(inclustc.modelCreateInClusts(inclust))
                    {
                        response.sendRedirect("admin/departamentos.jsp");
                    }
                    else
                    {
                        response.sendRedirect("index.jsp?error=200-1");
                    }
                }
                else
                {
                    response.sendRedirect("index.jsp?error=200-2");
                }
            }
            else
            {
                    response.sendRedirect("index.jsp?error=200-3");
            }
            
        }
        else
        {
            response.sendRedirect("index.jsp?error=101");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}