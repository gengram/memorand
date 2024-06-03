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
        return taskm.getTask(t_id);
    }
    
    public Task modelgetTaskByTool(String tool_table, String tool_name, String tool_id) {
        TasksModel taskm = new TasksModel();
        return taskm.getTaskByTool(tool_table, tool_name, tool_id);
    }

    //DEPRECIADO
    public String modelGetAllTasksByCollab(String collab_id, String order) {
        String htmlcode = "";

        TasksModel taskm = new TasksModel();

        int i = 0;

        for (Task task : taskm.getTasksByCollab(collab_id, order)) {
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

    public String modelGetTasksTable(String collab_id, String order) {
        String htmlcode = "<a href='tasknew.jsp?id=" + collab_id + "'>Nueva tarea</a>\n"
                + "<a href='tagnew.jsp?id=" + collab_id + "'>Nueva etiqueta</a>\n"
                + "<p>Vista <button id=\"task_panel\">Panel</button> <button id=\"task_table\">Tabla</button></p>"
                + "<div id=\"tasks_zone\">";

        TasksModel taskm = new TasksModel();
        ArrayList<Task> tasks = taskm.getTasksByCollab(collab_id, order);

        if (tasks.isEmpty()) {
            htmlcode += "<p>No hay tareas por mostrar.</p>";
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

    public String modelGetTasksPanel(String collab_id, String order) {
        String htmlcode
                = "<div class=\"row mt-4\" >"
                + " <div class=\"col-lg-1 d-none d-lg-block\" ></div>"
                + " <div class=\"col-lg-10\" >"
                + "     <button data-bs-toggle=\"modal\" data-bs-target=\"#modalTaskNew\" class=\"btn btn-lg rounded-pill custom-bcollab mb-2\">\n"
                + "         <p class=\"mb-1 mt-1 me-2 ms-2\" style=\"font-size: 18px;\"><i class=\"bi bi-plus-lg me-2\" style=\"font-size: 20px;\"></i>Nueva tarea</p> \n"
                + "     </button>"
                + " </div>"
                + "     <div class=\"col-lg-1 d-none d-lg-block\" ></div>"
                + " </div>"
                + "</div>";

        htmlcode += "<div class=\"row mt-4 mb-2\">";

        TasksModel taskm = new TasksModel();
        ArrayList<Task> tasks = taskm.getTasksByCollab(collab_id, order);

        if (tasks.isEmpty()) {
            htmlcode += "<div class='row' class=\"mt-3\">"
                    + "<div class='col-1'></div>"
                    + "<div class='col-10'>"
                    + "<p>No hay tareas por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-1'></div>"
                    + "</div>";
        } else {
            for (int i = 0; i < tasks.size(); i++) {
                Task t = tasks.get(i);
                SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                String task_sdate = sdf.format(t.getTask_sdate());
                String task_edate = sdf.format(t.getTask_edate());

                if (i % 2 == 0) {
                    htmlcode += "<div class=\"col-lg-1 d-none d-lg-block\"></div>"; // Columna vacía solo en pantallas grandes
                }

                htmlcode += "<div class=\"col-12 col-lg-5 mt-1\">"; // Columna completa en pantallas pequeñas y media en grandes

                htmlcode += "<div class=\"card mb-3 border border-1\">\n"
                        + "<div class=\"card-body\">\n"
                        + "<div class=\"row\">\n"
                        + "<div class=\"col-6 card-title\">\n"
                        + "<p class=\"custom-p ms-2\" style=\"font-size: 22px; color: #2A2927;\">" + t.getTask_name() + "</p>\n"
                        + "</div>\n"
                        + "<div class=\"col-6 text-end\">\n"
                        + "<p class=\"custom-p me-2\"><texto style=\"color: #AFB2B3;\">" + task_sdate + "</texto></p>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<p class=\"custom-p ms-2\"><texto style=\"color: #AFB2B3;\">Fecha L&iacute;mite: </texto><texto style=\"color: #2A2927;\">" + task_edate + "</texto></p>\n"
                        + "<p class=\"custom-p ms-2\"><texto style=\"color: #AFB2B3;\">Estatus: </texto><texto style=\"color: #F3894D;\">" + t.getTask_status() + "</texto></p>\n"
                        + "<div class=\"row\">\n"
                        + "<div class=\"col-6 \">\n"
                        + "<p class=\"custom-p\"><texto style=\"color: #AFB2B3;margin-left:  0.5rem\">Prioridad: </texto><b style=\"color: #2A2927;\">" + t.getTask_prior() + "</b></p>\n"
                        + "</div>\n"
                        + "<div class=\"col-6 text-end\">\n"
                        + "<a href='tarea.jsp?id=" + t.getTask_id() + "' class='task-link'><p style=\"color: #000; font-size: 15px; margin-right: 0.4rem\"><i class=\"bi bi-chevron-right\"></i></p></a>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>";

                htmlcode += "</div>";

                if (i % 2 == 1) {
                    htmlcode += "<div class=\"col-lg-1 d-none d-lg-block\"></div>"; // Columna vacía solo en pantallas grandes
                }

                if (i % 2 == 1 || i == tasks.size() - 1) {
                    htmlcode += "</div><div class=\"row mt-2 mb-2\">"; // Cerrar y abrir fila después de 2 tarjetas o al final
                }
            }
        }

// Final cierre de la última fila
        htmlcode += "</div>";

        return htmlcode;

    }

    public String modelGetResourceCount(String task_id, String resource) {
        TasksModel taskm = new TasksModel();
        return String.valueOf(taskm.getTaskResource(task_id, resource));
    }
}
