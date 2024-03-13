package com.gengram.csv;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class UploadFile extends HttpServlet {


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
        
        Part filePart = request.getPart("file");
        String fileName = getFileName(filePart);
        
        File uploadsDir = new File(getServletContext().getRealPath("/uploads"));
        uploadsDir.mkdirs();
        
        File file = new File(uploadsDir, fileName);

        if (file.exists()) {
            String uniqueFileName = getUniqueFileName(uploadsDir, fileName);
            file = new File(uploadsDir, uniqueFileName);
        }

        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        }
        
        response.sendRedirect("admin/home.jsp?fileName=" + fileName);
    }
    
    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private String getUniqueFileName(File directory, String fileName) {
        int count = 0;
        String baseName = fileName.substring(0, fileName.lastIndexOf('.'));
        String extension = fileName.substring(fileName.lastIndexOf('.'));
        String uniqueFileName = fileName;
        while (new File(directory, uniqueFileName).exists()) {
            count++;
            uniqueFileName = baseName + "_" + count + extension;
        }
        return uniqueFileName;
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
