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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ReadFile extends HttpServlet {
private static final long serialVersionUID = 1L;
    
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
        
        HttpSession session = request.getSession();

        Part filePart = request.getPart("file");
        InputStream fileContent = filePart.getInputStream();
        
        try (BufferedReader br = new BufferedReader(new InputStreamReader(fileContent))) {
            String line;
            List<String[]> rows = new ArrayList<>();
            boolean firstLine = true;
            while ((line = br.readLine()) != null) {
                if (!firstLine) {
                    String[] data = line.split(",");
                    rows.add(data);
                } else {
                    firstLine = false;
                }
            }
            
            String inst_id = (String)session.getAttribute("inst_id");
            
            boolean flag = true;
            
            for (int i = 0; i < rows.size(); i++) {
                String[] row = rows.get(i);
                
                Generador g = new Generador();
                
                String user_id = g.newID();
                String user_email = row[0].replace("\"", "");
                
                UsersController userc = new UsersController();
                if (!userc.modelValidateUserEmail(user_email)) {
                    
                    String user_pass = row[1].replace("\"", "");
                    String user_type = row[2].replace("\"", "");
                    String user_name = row[3].replace("\"", "");
                    String user_pat = row[4].replace("\"", "");
                    String user_mat = row[5].replace("\"", "");
                    
                    User user = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, "si", "XM-Uploads/users/profile/user_icon.png");
                    
                    if (userc.modelCreateUser(user)) {
                        InUser inuser = new InUser(inst_id, user_id);
                        InUsersController inusersc = new InUsersController();
                        if (inusersc.modelCreateInUsers(inuser)) {
                            flag = true;
                        } else{
                            flag = false;
                        }
                    } else{
                        flag = false;
                    }
                } 
            }
            if (flag) {
                request.setAttribute("rows", rows);
                request.getRequestDispatcher("admin/integrantes/listado.jsp").forward(request, response);
            } 
            
            
        } catch (Exception e) {
            response.getWriter().println("Error al leer el archivo CSV: " + e.getMessage());
        }
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
