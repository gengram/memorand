package com.miaplicacion;

import com.miaplicacion.Pendiente; // Asegúrate de que la importación refleje el paquete correcto
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AgregarPendienteServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String texto = request.getParameter("texto");
        List<Pendiente> pendientes = (List<Pendiente>) getServletContext().getAttribute("pendientes");

        if (pendientes == null) {
            pendientes = new ArrayList<>();
            getServletContext().setAttribute("pendientes", pendientes);
        }

        String fechaExpiracionStr = request.getParameter("fechaExpiracion");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaExpiracion = null;
        try {
            fechaExpiracion = sdf.parse(fechaExpiracionStr);
        } catch (ParseException e) {
            e.printStackTrace(); // Manejo de error simple
        }

        if (texto != null && !texto.trim().isEmpty() && fechaExpiracion != null) {
            pendientes.add(new Pendiente(texto, new Date(), fechaExpiracion));
        } else {
            // Manejar la situación donde la fecha de expiración no es válida o no se proporciona
            // Por ejemplo, podrías establecer una fecha de expiración predeterminada o enviar un mensaje de error.
        }

        response.sendRedirect("/memorand/alumno/pendientes.jsp");
    }

}