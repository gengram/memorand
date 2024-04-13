package com.memorand.controller;

import com.memorand.beans.Task;
import com.memorand.model.TasksModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class TasksController {

    public boolean modelCreateTask(Task task) {
        TasksModel taskm = new TasksModel();
        return taskm.createTask(task);
    }

    public Task modelGetTaskInfoById(String t_id) {
        TasksModel taskm = new TasksModel();
        return taskm.getTaskInfoById(t_id);
    }

    public boolean modelIsAnyTaskByCollab(String collab_id) {
        TasksModel taskm = new TasksModel();
        return taskm.isAnyTaskByCollab(collab_id);
    }

    //DEPRECIADO
    public String modelGetAllTasksByCollab(String collab_id, String arg) {
        String htmlcode = "";

        TasksModel taskm = new TasksModel();

        int i = 0;

        for (Task task : taskm.getAllTasksByCollab(collab_id, arg)) {
            i++;

            SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));

            String task_edate = sdf.format(task.getTask_edate());
            String task_sdate = sdf.format(task.getTask_sdate());

            if (i % 4 == 0) {
                htmlcode += "<div class='row'>";
            }

            htmlcode += "<div class='col'>"
                    + "<p>" + task.getTask_name() + " <a href='tarea.jsp?task_id=" + task.getTask_id() + "'>Ver apuntes</a> </p>"
                    + "<p> Inicio: " + task_sdate + " - Final: " + task_edate + "</p>"
                    + "<p> Estatus: " + task.getTask_status() + " Prioridad: " + task.getTask_prior() + " Dificultad: " + task.getTask_diff() + "</p>"
                    + "</div>";

            if (i % 4 == 0) {
                htmlcode += "</div>";
            }
        }

        return htmlcode;
    }

    public String modelGetTasksTable(String collab_id, String task_order) {
        String htmlcode = "<a href='tasknew.jsp?id=" + collab_id + "'>Nueva tarea</a>\n"
                + "                        <a href='tagnew.jsp?id=" + collab_id + "'>Nueva etiqueta</a>\n"
                + "                        <p>Vista <button id=\"task_panel\">Panel</button> <button id=\"task_table\">Tabla</button></p>";
        htmlcode += "<div id=\"tasks_zone\">";

        TasksModel taskm = new TasksModel();
        ArrayList<Task> tasks = taskm.getAllTasksByCollab(collab_id, task_order);

        if (tasks.isEmpty()) {
            htmlcode += "<p>No hay tareas por mostrar.</p>";
            return htmlcode;
        } else {
            htmlcode += "<table border=\"1\">\n"
                    + "             <thead>\n"
                    + "                 <tr>\n"
                    + "                     <th>Etiqueta</th>\n"
                    + "                     <th>Nombre</th>\n"
                    + "                     <th>Fecha l&iacute;mite</th>\n"
                    + "                     <th>Estatus</th>\n"
                    + "                     <th>Prioridad</th>\n"
                    + "                     <th></th>\n"
                    + "                 </tr>\n"
                    + "             </thead>\n"
                    + "             <tbody>";

            for (Task t : tasks) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));

                String task_edate = sdf.format(t.getTask_edate());

                htmlcode += "<tr>\n"
                        + "                               <td></td>\n"
                        + "                               <td>" + t.getTask_name() + "</td>\n"
                        + "                               <td>" + task_edate + "</td>\n"
                        + "                               <td>" + t.getTask_status() + "</td>\n"
                        + "                               <td>" + t.getTask_prior() + "</td>\n"
                        + "                               <td><a href='tarea.jsp?id=" + t.getTask_id() + "'>Ver</a></td>\n"
                        + "                           </tr>";
            }

            htmlcode += "</tbody>\n"
                    + "                </table>";
        }

        htmlcode += "</div>\n";

        return htmlcode;
    }

    public String modelGetTasksPanel(String collab_id, String task_order) {
        String htmlcode = "<div class=\"row\">"
                + "<div class=\"col-6\" >"
                + "<div class=\"row\">"
                + "<div class=\"col-4 text-start\">"
                + "<label for=\"inputPassword6\" class=\"col-form-label\">Filtrar por etiqueta:</label>"
                + "</div>"
                + "<div class=\"col-8 mt-1\">"
                + "<select class=\"form-select border-gray\" aria-label=\"Default select\">"
                + "<option selected>Selecciona uno</option>"
                + "<option value=\"1\">One</option>"
                + "<option value=\"2\">Two</option>"
                + "<option value=\"3\">Three</option>"
                + "</select>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "<div class=\"col-6\" >"
                + "<div class=\"row ms-5\">"
                + "<div class=\"col-6 text-end \">"
                + "<label for=\"inputPassword6\" class=\"col-form-label\" >Ordenar por: </label>"
                + "</div>"
                + "<div class=\"col-6 mt-1 text-end\">"
                + "<div class=\"btn-group\" role=\"group\" aria-label=\"Vertical radio toggle button group\">"
                + "<input type=\"radio\" class=\"btn-check\" name=\"vbtn-radioEtiquet\" id=\"vbtn-radioFecha\" autocomplete=\"off\" checked>"
                + "<label class=\"btn btn-outline-gray border\" for=\"vbtn-radioFecha\" style=\"padding: 0.375rem 0.75rem; font-size: 0.8rem;\">Fecha Lim.</label>"
                + "<input type=\"radio\" class=\"btn-check\" name=\"vbtn-radioEtiquet\" id=\"vbtn-radioEsta\" autocomplete=\"off\">"
                + "<label class=\"btn btn-outline-gray border\" for=\"vbtn-radioEsta\" style=\"padding: 0.375rem 0.75rem; font-size: 0.8rem;\">Estatus</label>"
                + "<input type=\"radio\" class=\"btn-check\" name=\"vbtn-radioEtiquet\" id=\"vbtn-radioPriori\" autocomplete=\"off\">"
                + "<label class=\"btn btn-outline-gray border\" for=\"vbtn-radioPriori\" style=\"padding: 0.375rem 0.75rem; font-size: 0.8rem;\">Prioridad</label>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</div>"
                /*Filtros ↑*/
                + "<div class=\"row mt-4\" >"
                + "<div class=\"col-6 text-start\">"
                + "<a href='tasknew.jsp?id=" + collab_id + "'>"
                + "<button class=\"btn btn-lg rounded-pill custom-bcollab mb-2\">\n"
                + "                            <p class=\"mb-1 mt-1 me-2 ms-2\" style=\"font-size: 18px;\"><i class=\"bi bi-plus-lg me-2\" style=\"font-size: 20px;\"></i>Nueva tarea</p> \n"
                + "                        </button>" + "</a>\n"
                + "                        <a href='tagnew.jsp?id=" + collab_id + "'>"
                + "<button class=\"btn btn-lg rounded-pill custom-bcollab ms-4 mb-2\">\n"
                + "                            <p class=\"mb-1 mt-1 me-2 ms-2\" style=\"font-size: 18px;\"><i class=\"bi bi-plus-lg me-2\" style=\"font-size: 20px;\"></i> Nueva etiqueta</p> \n"
                + "                        </button></a>\n"
                + "</div>"
                + "<div class=\"col-6 text-end\">"
                + "                        <div class=\"btn-group mb-2\" role=\"group\" aria-label=\"Vertical radio toggle button group\">\n"
                + "                        <input type=\"radio\" class=\"btn-check\" name=\"btnradio-Vista\" id=\"vbtn-radioPanel\" autocomplete=\"off\" checked>\n"
                + "                        <label class=\"btn btn-outline-gray border\" for=\"vbtn-radioPanel\" id=\"task_panel\" style=\"padding: 0.375rem 0.75rem; font-size: 1rem;\"><i class=\"bi bi-grid-fill\"></i></label>\n"
                + "\n"
                + "                        <input type=\"radio\" class=\"btn-check\" name=\"btnradio-Vista\" id=\"vbtn-radioTabla\" autocomplete=\"off\">\n"
                + "                        <label class=\"btn btn-outline-gray border\" for=\"vbtn-radioTabla\" id=\"task_table\" style=\"padding: 0.375rem 0.75rem; font-size: 1rem;\"><i class=\"bi bi-list\" style=\"color: #2A2927\"></i></label>\n"
                + "                    </div>"
                + "                    </div>"
                + "                    </div>";
        htmlcode += "<div class=\"mb-5\" id=\"tasks_zone\">";

        TasksModel taskm = new TasksModel();
        ArrayList<Task> tasks = taskm.getAllTasksByCollab(collab_id, task_order);

        if (tasks.isEmpty()) {
            htmlcode += "<p>No hay tareas por mostrar.</p>";
            return htmlcode;
        } else {
            for (int i = 0; i < tasks.size(); i++) {
                Task t = tasks.get(i);
                SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                String task_edate = sdf.format(t.getTask_edate());

                if (i == 0 || i % 2 == 0) {
                    htmlcode += "<div class=\"row\">";
                }

                htmlcode += "<div class=\"col-6 mt-2\">"; // Usa col-6 para ocupar la mitad del row
                htmlcode += "<div class=\"card mb-3 border border-2\">\n"
                        + "<div class=\"card-body\">\n"
                        + "<div class=\"row\">\n"
                        + "<div class=\"col-6 card-title\">\n"
                        + "<p class=\"custom-p ms-2\" style=\"font-size: 22px\"><b style=\"color: #2A2927;\">" + t.getTask_name() + "</b></p>\n"
                        + "</div>\n"
                        + "<div class=\"col-6 text-end\">\n"
                        + "<p class=\"custom-p me-2\"><texto style=\"color: #AFB2B3;\">" + t.getTask_sdate() + "</texto></p>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<button class=\"btn btn-light rounded-pill\" style=\"background-color: #F0F2FF\"><i class=\"bi bi-circle-fill me-3\" style=\"color: darkturquoise\"></i> Etiqueta</button>\n"
                        + "<p class=\"custom-p ms-2\"><texto style=\"color: #AFB2B3;\">Fecha L&iacute;mite: </texto><texto style=\"color: #2A2927;\">" + t.getTask_edate() + "</texto></p>\n"
                        + "<p class=\"custom-p ms-2\"><texto style=\"color: #AFB2B3;\">Estatus: </texto><texto style=\"color: #F3894D;\">" + t.getTask_status() + "</texto></p>\n"
                        + "<div class=\"row\">\n"
                        + "<div class=\"col-6 \">\n"
                        + "<p class=\"custom-p\"><texto style=\"color: #AFB2B3;margin-left:  0.5rem\">Prioridad: </texto><b style=\"color: #2A2927;\">" + t.getTask_prior() + "</b></p>\n"
                        + "</div>\n"
                        + "<div class=\"col-6 text-end\">\n"
                        + "<a href='tarea.jsp?id=" + t.getTask_id() + "' class='task-link'><p style=\"color: #000; font-size: 15px; margin-right: 0.4rem\"><i  class=\"bi bi-chevron-right\"></i></p></a>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>";

                if (i == tasks.size() - 1 || i % 2 == 1) {
                    htmlcode += "</div>"; // Cierra el row
                }
            }
        }

        return htmlcode;
    }

}
