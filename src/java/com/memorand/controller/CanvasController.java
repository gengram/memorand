package com.memorand.controller;

import com.memorand.beans.Canva;
import com.memorand.model.CanvasModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class CanvasController {

    public boolean modelCreateCanva(Canva canva) {
        CanvasModel canvam = new CanvasModel();
        return canvam.createCanva(canva);
    }

    public Canva modelGetCanvaById(String c_id) {
        CanvasModel canvam = new CanvasModel();
        return canvam.getCanvaById(c_id);
    }

    public String modelGetCanvasByTask(String task_id) {
        String htmlcode = "<div class='row'>"
                + "<div class='col-1'></div>"
                + "<div class='col-10'>"
                + "<h3>Lienzos del equipo</h3>"
                + "</div>"
                + "<div class='col-1'></div>"
                + "</div>";

        CanvasModel canvam = new CanvasModel();
        ArrayList<Canva> canvas = canvam.getCanvasByTask(task_id);

        if (canvas.isEmpty()) {
            htmlcode += "<p>No hay lienzos por mostrar</p>";
            return htmlcode;
        } else {
            htmlcode += "<diV class='row'>"
                    + "<div class='col-1'></div>"
                    + "<div class='col-10'>"
                    + "<table class='table mb-5'>"
                    + "                <thead>\n"
                    + "                    <tr>\n"
                    + "                        <th scope='col'></th>\n"
                    + "                        <th scope='col'>Nombre</th>\n"
                    + "                        <th scope='col'>Creado el:</th>\n"
                    + "                        <th scope='col'>&Uacute;ltima modificaci&oacute;n</th>\n"
                    + "                        <th scope='col'></th>\n"
                    + "                    </tr>\n"
                    + "                </thead>\n"
                    + "                <tbody id='table-body'>";

            for (Canva c : canvas) {
                String canva_id = c.getCanva_id();

                SimpleDateFormat sdf1 = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd 'de' MMMM 'a la(s):' hh:mm a", new Locale("es"));

                String canva_cdate = sdf1.format(c.getCanva_cdate());
                String canva_mdate = sdf2.format(c.getCanva_mdate());

                htmlcode += "<tr>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'><i class=\"bi bi-three-dots-vertical\"></i></td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + c.getCanva_name() + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + canva_cdate + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + canva_mdate + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'><a href='lienzo.jsp?id=" + canva_id + "'><i style='color: #2A2927; font-size: 18px;' class='bi bi-chevron-right'></i></a></td>\n"
                        + "                    </tr>";
            }

            htmlcode += "</tbody>\n"
                    + "            </table>"
                    + "</div>"
                    + "<div class='col-1'></div>"
                    + "</div>";
        }

        return htmlcode;
    }
}
