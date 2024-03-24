package com.gengram.csv;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadFile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el nombre del archivo CSV de los parámetros de la URL
        String fileName = request.getParameter("fileName");
        
        // Construir la ruta absoluta del archivo CSV usando el nombre del archivo
        String filePath = getServletContext().getRealPath("/uploads/" + fileName);
        
        // Crear un objeto File para el archivo CSV
        File file = new File(filePath);
        
        if (file.exists()) {
            // Configurar los encabezados de la respuesta para la descarga del archivo
            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            // Abrir un flujo de entrada para leer el archivo CSV
            try (FileInputStream fis = new FileInputStream(file)) {
                // Crear un búfer de bytes para almacenar los datos del archivo CSV
                byte[] buffer = new byte[1024];
                int bytesRead;
                
                // Escribir los datos del archivo CSV en el flujo de salida de la respuesta
                while ((bytesRead = fis.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }
            }
        } else {
            // Si el archivo no existe, enviar una respuesta de error
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "El archivo CSV no existe.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
