package com.memorand.servlets.users;

import com.memorand.beans.User;
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
        
        ArrayList<String> user_fields = new ArrayList<>();
        String user_img = "";
        
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
        
        Generador generador = new Generador();
        
//        String user_type = null;
//        //String user_type = request.getSession().getAttribute("user_type").toString();
//        
//        if (user_type != null)
//        {
//            switch (user_type) {
//                
//                case "staff":
//                    
//                    User user1 = new User(generador.newID(),"","","","","","","","");
//                    UsersController userc1 = new UsersController();
//                    response.getWriter().println(userc1.ModelCreateUser(user1));
//                    
//                    break;
//                    
//                case "admin":
//                    
//                    if (user_fields.get(0).equals("ch") || user_fields.get(0).equals("wk"))
//                    {
//                        User user2 = new User(generador.newID(),"","","","","","","","");
//                        UsersController userc2 = new UsersController();
//                        response.getWriter().println(userc2.ModelCreateUser(user2));
//                    }
//                    else
//                    {
//                        response.sendRedirect("index.jsp?error=100-FATAL-invalidtype");
//                    }
//                    
//                    break;
//                    
//                case "ch":
//                    
//                    response.sendRedirect("index.jsp?error=100-FATAL-invalidtype");
//                    break;
//                    
//                case "wk":
//                    
//                    response.sendRedirect("index.jsp?error=100-FATAL-invalidtype");
//                    break;
//                    
//                default:
//                    response.sendRedirect("index.jsp?error=100-FATAL-invalidtype");
//                    
//            }
//        }
//        else
//        {
            User user = new User(generador.newID(), user_fields.get(0), user_fields.get(1), user_fields.get(2), user_fields.get(3), user_fields.get(4), user_fields.get(5), user_fields.get(6), user_img);
            UsersController userc = new UsersController();
            response.getWriter().println(userc.modelCreateUser(user));
            //response.sendRedirect("index.jsp?error=101-FATAL-nulltype");
//        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
