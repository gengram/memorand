package com.memorand.servlets;

import com.memorand.beans.Institution;
import com.memorand.beans.User;
import com.memorand.controller.InstitutionsController;
import com.memorand.controller.UsersController;
import com.memorand.util.Sanitizante;
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

public class Login extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        
        ArrayList<String> userFields = new ArrayList<>();
        
        try
        {
            List<FileItem> items = sfu.parseRequest(request);
            processFormFields(items, userFields);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        Sanitizante s = new Sanitizante();
        
        //String email = s.sanitizar(userFields.get(0));
        //String password = s.sanitizar(userFields.get(1));
        
        String email = userFields.get(0);
        String password = userFields.get(1);
        
        User user = new User(email, password);
        UsersController userController = new UsersController();
        
        if (userController.modelLoginUser(user))
        {
            User userInfo = userController.modelGetUserInfoByLogin(user);
            
            if ("si".equals(userInfo.getUser_status()))
            {
                handleUserLogin(request, response, userInfo);
            }
            else
            {
                response.sendRedirect("index.jsp?error=InactiveAccount");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=InvalidLogin");
        }
    }

    private void processFormFields(List<FileItem> items, List<String> userFields)
    {
        for (FileItem item : items)
        {
            if (item.isFormField())
            {
                userFields.add(item.getString());
            }
        }
    }

    private void handleUserLogin(HttpServletRequest request, HttpServletResponse response, User userInfo)
            throws IOException, ServletException
    {
        if (userInfo.getUser_type().equals("staff"))
        {
            setUserInfo(request, userInfo);
            response.sendRedirect("staff/home.jsp");
        }
        else
        {
            InstitutionsController instController = new InstitutionsController();
            Institution inst = instController.modelGetInstByUser(userInfo.getUser_id());
            
            if ("si".equals(inst.getInst_status()))
            {
                setUserInfo(request, userInfo);
                setInstInfo(request, inst);
                redirectUserByType(response, userInfo.getUser_type());
            }
            else
            {
                response.sendRedirect("index.jsp?error=InnactiveInstitution");
            }
        }
    }

    private void setUserInfo(HttpServletRequest request, User userInfo)
    {
        HttpSession session = request.getSession();
        session.setAttribute("user_id", userInfo.getUser_id());
        session.setAttribute("user_email", userInfo.getUser_email());
        session.setAttribute("user_pass", userInfo.getUser_pass());
        session.setAttribute("user_type", userInfo.getUser_type());
        session.setAttribute("user_name", userInfo.getUser_name());
        session.setAttribute("user_pat", userInfo.getUser_pat());
        session.setAttribute("user_mat", userInfo.getUser_mat());
        session.setAttribute("user_status", userInfo.getUser_status());
        session.setAttribute("user_profile", userInfo.getUser_profile());
    }

    private void setInstInfo(HttpServletRequest request, Institution instInfo)
    {
        HttpSession session = request.getSession();
        session.setAttribute("inst_id", instInfo.getInst_id());
        session.setAttribute("inst_name", instInfo.getInst_name());
        session.setAttribute("inst_type", instInfo.getInst_type());
        session.setAttribute("inst_profile", instInfo.getInst_profile());
        session.setAttribute("lim_ch", instInfo.getLim_ch());
        session.setAttribute("lim_wk", instInfo.getLim_wk());
        session.setAttribute("lim_gp", instInfo.getLim_gp());
        session.setAttribute("lim_ks", instInfo.getLim_ks());
    }

    private void redirectUserByType(HttpServletResponse response, String userType) throws IOException
    {
        switch (userType)
        {
            case "admin":
                response.sendRedirect("admin/home.jsp");
                break;
            case "ch":
            case "wk":
                response.sendRedirect("work/home.jsp");
                break;
            default:
                response.sendRedirect("index.jsp?error=InvalidUserType");
                break;
        }
    }
}