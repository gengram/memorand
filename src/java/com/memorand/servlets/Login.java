package com.memorand.servlets;

import com.memorand.beans.Institution;
import com.memorand.beans.User;
import com.memorand.controller.InstitutionsController;
import com.memorand.controller.UsersController;
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

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        
        ArrayList<String> user_fields = new ArrayList<>();
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    user_fields.add(fi.getString());
                
            }
            
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        Institution inst = new Institution();
        InstitutionsController instc = new InstitutionsController();
        
        User user = new User(user_fields.get(0), user_fields.get(1));
        UsersController userc = new UsersController();
        
        if (userc.modelLoginUser(user))
        {
            User user_info = userc.modelGetUserInfoByLogin(user);
            
            if ("si".equals(user_info.getUser_status()))
            {
                switch (user_info.getUser_type())
                {
                    case "staff":
                        SetUserInfo(request, response, user_info);
                        response.sendRedirect("staff/home.jsp");
                        break;
                    case "admin":
                        inst = instc.modelGetInstByUser(user_info.getUser_id());
                        SetUserInfo(request, response, user_info);
                        SetInstInfo(request, response, inst);
                        response.sendRedirect("admin/home.jsp");
                        break;
                    case "ch":
                        inst = instc.modelGetInstByUser(user_info.getUser_id());
                        SetUserInfo(request, response, user_info);
                        SetInstInfo(request, response, inst); 
                        response.sendRedirect("work/home.jsp");
                        break;
                    case "wk":
                        inst = instc.modelGetInstByUser(user_info.getUser_id());
                        SetUserInfo(request, response, user_info);
                        SetInstInfo(request, response, inst); 
                        response.sendRedirect("work/home.jsp");
                        break;
                    default:
                        throw new AssertionError();
                }
            }
            
        }
        else
        {
            response.sendRedirect("index.jsp?error=300-invalidlogin");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public void SetUserInfo(HttpServletRequest request, HttpServletResponse response, User user_info)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        session.setAttribute("user_id", user_info.getUser_id());
        session.setAttribute("user_email", user_info.getUser_email());
        session.setAttribute("user_pass", user_info.getUser_pass());
        session.setAttribute("user_type", user_info.getUser_type());
        session.setAttribute("user_name", user_info.getUser_name());
        session.setAttribute("user_pat", user_info.getUser_pat());
        session.setAttribute("user_mat", user_info.getUser_mat());
        session.setAttribute("user_status", user_info.getUser_status());
        session.setAttribute("user_profile", user_info.getUser_profile());
        
    }
    
    public void SetInstInfo(HttpServletRequest request, HttpServletResponse response, Institution inst_info)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        session.setAttribute("inst_id", inst_info.getInst_id());
        session.setAttribute("inst_name", inst_info.getInst_name());
        session.setAttribute("inst_type", inst_info.getInst_type());
        session.setAttribute("inst_profile", inst_info.getInst_profile());
        session.setAttribute("lim_ch", inst_info.getLim_ch());
        session.setAttribute("lim_wk", inst_info.getLim_wk());
        session.setAttribute("lim_gp", inst_info.getLim_gp());
        session.setAttribute("lim_ks", inst_info.getLim_ks());
        
    }

}