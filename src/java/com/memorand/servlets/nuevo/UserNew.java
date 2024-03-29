package com.memorand.servlets.nuevo;

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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        HttpSession session = request.getSession();
        
        if(session != null)
        {

            FileItemFactory fif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fif);

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
                        File file = new File("C:\\memorand\\web\\XM-Uploads\\users\\profile\\"+fi.getName());
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

                        String user_id1 = g1.newID();
                        String inst_id1 = user_fields.get(5);

                        User admin = new User(user_id1, user_fields.get(0), user_fields.get(1), "admin", user_fields.get(2), user_fields.get(3), user_fields.get(4), "si", user_img);
                        UsersController userc1 = new UsersController();
                        
                        if(!userc1.modelValidateUserEmail(user_fields.get(0)))
                        {
                            if(userc1.modelCreateUser(admin))
                            {
                                InUser inusers = new InUser(inst_id1, user_id1);
                                InUsersController inusersc = new InUsersController();

                                if (inusersc.modelCreateInUsers(inusers))
                                { response.sendRedirect("staff/administradores.jsp?view=inst&inst_id="+inst_id1); }
                                else
                                { response.sendRedirect("staff/administradores.jsp?view=inst&error=200"); }
                            }
                            else
                            { response.sendRedirect("staff/administradores.jsp?view=inst&error=200"); }
                        }
                        else
                        { response.sendRedirect("staff/administradores.jsp?view=inst&error=300"); }

                        break;

                    case "admin":

                        Generador g2 = new Generador();

                        String user_id2 = g2.newID();
                        String inst_id2 = (String) session.getAttribute("inst_id");
                        String new_type = request.getParameter("user_type");

                        if (new_type != null)
                        {
                            switch (new_type)
                            {
                                case "ch":

                                    User lider = new User(user_id2, user_fields.get(0), user_fields.get(1), "ch", user_fields.get(2), user_fields.get(3), user_fields.get(4), "si", user_img);
                                    UsersController userc2 = new UsersController();
                                    
                                    if(!userc2.modelValidateUserEmail(user_fields.get(0)))
                                    {
                                        if (userc2.modelCreateUser(lider))
                                        {
                                            InUser inlider = new InUser(inst_id2, user_id2);
                                            InUsersController inliderc = new InUsersController();

                                            if (inliderc.modelCreateInUsers(inlider))
                                            { response.sendRedirect("admin/lideres.jsp"); }
                                            else
                                            { response.sendRedirect("admin/lideres.jsp?error=100-1"); }
                                        }
                                        else
                                        { response.sendRedirect("admin/lideres.jsp?error=100-2"); }
                                    }
                                    else
                                    { response.sendRedirect("admin/lideres.jsp?error=300"); }


                                    break;

                                case "wk":

                                    User integrante = new User(user_id2, user_fields.get(0), user_fields.get(1), "wk", user_fields.get(2), user_fields.get(3), user_fields.get(4), "si", user_img);
                                    UsersController userc3 = new UsersController();

                                    if(!userc3.modelValidateUserEmail(user_fields.get(0))) 
                                    {
                                        if (userc3.modelCreateUser(integrante))
                                        {
                                            InUser ininteg = new InUser(inst_id2, user_id2);
                                            InUsersController inintegc = new InUsersController();

                                            if (inintegc.modelCreateInUsers(ininteg))
                                            { response.sendRedirect("admin/integrantes.jsp"); }
                                            else
                                            { response.sendRedirect("admin/integrantes.jsp?error=100-1"); }
                                        }
                                        else
                                        { response.sendRedirect("admin/lideres.jsp?error=100-2"); }
                                    }
                                    else
                                    { response.sendRedirect("admin/lideres.jsp?error=300"); }

                                    break;
                                default:
                                    response.sendRedirect("admin/home.jsp?error=100-3");
                            }
                        }
                        else
                        { response.sendRedirect("admin/home.jsp?error=100-4"); }
                        break;

                    default:
                        response.sendRedirect("index.jsp?error=100-4");
                        break;
                }
            }
            else
            {
                response.sendRedirect("index.jsp?error=101");
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