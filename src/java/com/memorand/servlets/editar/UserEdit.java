package com.memorand.servlets.editar;

import com.memorand.beans.User;
import com.memorand.controller.UsersController;
import com.memorand.util.Modificador;
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

public class UserEdit extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String user_id = request.getParameter("id");
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null)
        {
            if (user_type.equals("staff") || user_type.equals("admin"))
            {
                Modificador m = new Modificador();
                FileItemFactory fif = new DiskFileItemFactory();
                ServletFileUpload sfu = new ServletFileUpload(fif);

                ArrayList<String> user_fields = new ArrayList<>();

                String img_directory = m.getInstsDirectory(request);
                String user_img = "";
                
                try
                {
                    List items = sfu.parseRequest(request);

                    for (int i = 0; i < items.size(); i++)
                    {
                        FileItem fi = (FileItem) items.get(i);

                        if (!fi.isFormField())
                        {
                            if (!fi.getName().isEmpty())
                            {
                                File file = new File(img_directory+fi.getName());
                                fi.write(file);
                                user_img = "XM-Uploads/users/profile/"+fi.getName();
                            }
                            else
                            {
                                user_img = "XM-Uploads/users/profile/default-user.png";
                            }
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
                
                String user_name = user_fields.get(0).trim();
                String user_pat = user_fields.get(1).trim();
                String user_mat = user_fields.get(2).trim();
                
                User user = new User(user_id, user_name, user_pat, user_mat, user_img);
                UsersController userc = new UsersController();
                
                if (userc.modelUpdateUserProfile(user))
                {
                    switch (user_type)
                    {
                        case "staff":
                            response.sendRedirect("staff/admin.jsp?id="+user_id);
                            break;
                        case "admin":
                            response.sendRedirect("admin/home.jsp");
                            break;
                        default:
                            response.sendRedirect("index.jsp");
                            break;
                    }
                }
                else
                {
                    response.sendRedirect("index.jsp");
                }
            }
            else
            {
                session.invalidate();
                response.sendRedirect("index.jsp?error=InvalidUser");
            }
        }
        else
        {
            session.invalidate();
            response.sendRedirect("index.jsp?error=InvalidUser");
        }
    }
}