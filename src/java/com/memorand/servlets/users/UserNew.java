package com.memorand.servlets.users;

import com.memorand.beans.InUser;
import com.memorand.beans.User;
import com.memorand.controller.InUsersController;
import com.memorand.controller.UsersController;
import com.memorand.util.Generador;
import java.io.File;
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

public class UserNew extends HttpServlet {

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
        
        ArrayList<String> user_fields = new ArrayList<>();
        
        String user_img = "";
        String user_type = (String) session.getAttribute("user_type");
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (!fi.isFormField())
                {
                    File file = new File("C:\\Users\\nicojrz\\Proyectos\\memorand\\web\\XM-Uploads\\users\\profile\\"+fi.getName());
                    fi.write(file);
                    user_img = "XM-Uploads/users/profile/"+fi.getName();
                }
                else
                {
                    user_fields.add(fi.getString());
                }
            }
            
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        if (user_type != null)
        {
            switch (user_type)
            {
                case "staff":
                    
                    Generador g1 = new Generador();
                    
                    String user_id = g1.newID();
                    String inst_id = user_fields.get(5);
                    
                    User admin = new User(user_id, user_fields.get(0), user_fields.get(1), "admin", user_fields.get(2), user_fields.get(3), user_fields.get(4), "si", user_img);
                    UsersController userc1 = new UsersController();
                    
                    if(userc1.modelCreateUser(admin))
                    {
                        InUser inusers = new InUser(inst_id, user_id);
                        InUsersController inusersc = new InUsersController();
                        
                        if (inusersc.modelCreateInUsers(inusers))
                        {
                            response.sendRedirect("staff/administradores.jsp?view=inst&inst_id="+inst_id);
                        }
                        else
                        {
                            response.sendRedirect("staff/administradores.jsp?view=inst&error=200");
                        }
                    }
                    else
                    {
                        response.sendRedirect("staff/administradores.jsp?view=inst&error=200");
                    }
                    
                    break;
                    
                case "admin":
                    
                    Generador g2 = new Generador();
                    User user = new User(g2.newID(), user_fields.get(0), user_fields.get(1), "admin", user_fields.get(2), user_fields.get(3), user_fields.get(4), "si", user_img);
                    UsersController userc2 = new UsersController();
                    response.getWriter().println(userc2.modelCreateUser(user));
                    break;
                    
                default:
                    response.sendRedirect("index.jsp?error=100");
                    break;
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
