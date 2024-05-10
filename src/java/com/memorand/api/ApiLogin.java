package com.memorand.api;

import com.google.gson.Gson;
import com.memorand.beans.User;
import com.memorand.controller.UsersController;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApiLogin extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/plain;charset=UTF-8");
        
        StringBuilder requestBody = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String line;
        
        while ((line = reader.readLine()) != null)
        {
            requestBody.append(line);
        }
        
        reader.close();

        Gson gson = new Gson();

        UsersController userc = new UsersController();
        User user = gson.fromJson(requestBody.toString(), User.class);

        if (userc.modelLoginUser(user))
        {
            response.setStatus(200);
        }
        else
        {
            response.setStatus(400);
        }
            
    }
}
