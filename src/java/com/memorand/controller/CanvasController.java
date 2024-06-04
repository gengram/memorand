package com.memorand.controller;

import com.memorand.beans.Canva;
import com.memorand.model.CanvasModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class CanvasController {

    public boolean modelCreateCanva(Canva c) {
        CanvasModel canvam = new CanvasModel();
        return canvam.createCanva(c);
    }

    public boolean modelDeleteCanva(String c_id) {
        CanvasModel canvam = new CanvasModel();
        return canvam.deleteCanva(c_id);
    }

    public boolean modelUpdateCanvaDraw(String c_id, String c_draw) {
        CanvasModel canvam = new CanvasModel();
        return canvam.updateCanvaDraw(c_id, c_draw);
    }

    public Canva beanGetCanva(String c_id) {
        CanvasModel canvam = new CanvasModel();
        return canvam.getCanva(c_id);
    }

    public String workGetCanvasByTask(String task_id) {
        String htmlcode = "<div class='row mt-2'>"
                + "<div class='col-lg-1 d-none d-lg-block'></div>"
                + "<div class='col-lg-10'>"
                + "<h4>Lienzos del equipo</h4>"
                + "</div>"
                + "<div class='col-lg-1 d-none d-lg-block'></div>"
                + "</div>";

        CanvasModel canvam = new CanvasModel();
        ArrayList<Canva> canvas = canvam.getCanvasByTask(task_id);

        if (canvas.isEmpty()) {
            htmlcode += "<div class='row mt-3'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<p class=''>No hay lienzos por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
            return htmlcode;
        } else {
            htmlcode += "<diV class='row mt-3'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
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

                String htmldelete = "";

                htmldelete = ""
                        + "<div class='btn-group dropbottom'>"
                        + " <p class='btn custom-p me-2 border-0' data-bs-toggle='dropdown' aria-expanded='false'>"
                        + "     <texto style='color: #2A2927;'>"
                        + "         <i class='bi bi-three-dots-vertical' style='font-size: 20px'></i>"
                        + "     </texto>"
                        + " </p>"
                        + " <ul class='dropdown-menu shadow'>\n"
                        + "     <li class='me-2'><a style='color: red;' class='dropdown-item' href=''><i class='bi bi-trash3 me-2'></i>Eliminar lienzo</a></li>\n"
                        + " </ul>\n"
                        + "</div>\n";

                htmlcode += "<tr>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>"+ htmldelete +"</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + c.getCanva_name() + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + canva_cdate + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + canva_mdate + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'><a href='lienzo.jsp?id=" + canva_id + "'><i style='color: #2A2927; font-size: 18px;' class='bi bi-chevron-right'></i></a></td>\n"
                        + "                    </tr>";
            }

            htmlcode += "</tbody>\n"
                    + "            </table>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
        }

        return htmlcode;
    }
}
