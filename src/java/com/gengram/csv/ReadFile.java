package com.gengram.csv;

import com.memorand.beans.InUser;
import com.memorand.beans.User;
import com.memorand.controller.InUsersController;
import com.memorand.controller.UsersController;
import com.memorand.util.Generador;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ReadFile extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession();

        Part filePart = request.getPart("file");
        InputStream fileContent = filePart.getInputStream();
        
        try (BufferedReader br = new BufferedReader(new InputStreamReader(fileContent)))
        {
            boolean firstLine = true;
            boolean flag = true;
            
            String line;
            
            String inst_id = (String) session.getAttribute("inst_id");
            
            ArrayList<String[]> rows = new ArrayList<>();
            
            while ((line = br.readLine()) != null)
            {
                if (!firstLine)
                {
                    String[] data = line.split(",");
                    rows.add(data);
                }
                else
                {
                    firstLine = false;
                }
            }
            
            for (int i = 0; i < rows.size(); i++)
            {
                UsersController userc = new UsersController();
                
                Generador g = new Generador();
                
                String[] row = rows.get(i);
                
                String user_id = g.newID();
                String user_email = row[0].replace("\"", "");
                
                if (!userc.modelValidateUserEmail(user_email))
                {
                    String user_pass = row[1].replace("\"", "");
                    String user_type = row[2].replace("\"", "");
                    String user_name = row[3].replace("\"", "");
                    String user_pat = row[4].replace("\"", "");
                    String user_mat = row[5].replace("\"", "");
                    
                    User user = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, "si", "XM-Uploads/users/profile/default-user.png");
                    
                    if (userc.modelCreateUser(user))
                    {
                        InUser inuser = new InUser(inst_id, user_id);
                        InUsersController inusersc = new InUsersController();
                        
                        flag = inusersc.modelCreateInUsers(inuser);
                    }
                    else
                    {
                        flag = false;
                    }
                }
            }
            
            if (flag)
            {
                request.setAttribute("rows", rows);
                request.getRequestDispatcher("admin/listado.jsp").forward(request, response);
            } 
        }
        
        catch (Exception e)
        {
            response.sendRedirect("admin/integrantes/home.jsp?error=300");
        }
        
    }

}