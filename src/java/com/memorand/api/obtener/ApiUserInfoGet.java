package com.memorand.api.obtener;

import com.google.gson.Gson;
import com.memorand.beans.User;
import com.memorand.controller.UsersController;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApiUserInfoGet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        
        // LEER JSON
        StringBuilder requestBody = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String line;
        
        while ((line = reader.readLine()) != null)
        {
            requestBody.append(line);
        }
        
        reader.close();
        
        //RESPUESTA EN JSON
        Gson gson = new Gson();
        
        UsersController userc = new UsersController();
        User userinput = gson.fromJson(requestBody.toString(), User.class);
        
        String user_id = userinput.getUser_id();
        
        User user = userc.modelGetUserInfoById(user_id);
        
        if (user != null)
        {
            String user_info = gson.toJson(user);
        
            try (PrintWriter out = response.getWriter())
            {
                out.println(user_info);
            }
        }
        else
        {
            response.setStatus(400);
        }
    }
}
