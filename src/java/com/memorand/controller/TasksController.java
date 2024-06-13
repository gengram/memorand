package com.memorand.controller;

import com.memorand.beans.Task;
import com.memorand.model.TasksModel;
import com.memorand.util.TimeTransformer;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class TasksController
{
    public boolean modelCreateTask(Task t)
    {
        TasksModel taskm = new TasksModel();
        return taskm.createTask(t);
    }
    
    public boolean modelUpdateTask(Task t)
    {
        TasksModel taskm = new TasksModel();
        return taskm.updateTask(t);
    }
    
    public boolean modelUpdateTaskStatus(String task_id, String task_status)
    {
        TasksModel taskm = new TasksModel();
        return taskm.updateTaskStatus(task_id, task_status);
    }

    public Task beanGetTask(String t_id)
    {
        TasksModel taskm = new TasksModel();
        return taskm.getTask(t_id);
    }
    
    public Task beanGetTaskByTool(String tool_table, String tool_name, String tool_id)
    {
        TasksModel taskm = new TasksModel();
        return taskm.getTaskByTool(tool_table, tool_name, tool_id);
    }

    public String modelGetTasksPanel(String collab_id, String order)
    {
        String htmlcode = "<div class=\"row mt-3\" >"
                        + "<div class=\"col-lg-1 d-none d-lg-block\" ></div>"
                        + "<div class=\"col-lg-8\" >"
                        + "<h4>Tareas</h4>"
                        + "</div>"
                        + "<div class=\"col-lg-2\" >"
                        + "<button data-bs-toggle=\"modal\" data-bs-target=\"#modalTaskNew\" class=\"btn btn-lg rounded-pill custom-bcollab mb-2\">\n"
                        + "<p class=\"mb-1 mt-1 me-2 ms-2\" style=\"font-size: 18px;\"><i class=\"bi bi-plus-lg me-2\" style=\"font-size: 20px;\"></i>Nueva tarea</p> \n"
                        + "</button>"
                        + "</div>"
                        + "<div class=\"col-lg-1 d-none d-lg-block\" ></div>"
                        + "</div>"
                        + "</div>";

        htmlcode += "<div class=\"row mt-4 mb-2\">";

        TasksModel taskm = new TasksModel();
        ArrayList<Task> tasks = taskm.getTasksByCollab(collab_id, order);

        if (tasks.isEmpty())
        {
            htmlcode += "<div class='row' class=\"mt-3\">"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<p>No hay tareas por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
        }
        else
        {
            for (int i = 0; i < tasks.size(); i++)
            {
                Task t = tasks.get(i);
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd 'de' MMMM 'a la(s):' hh:mm", new Locale("es"));
                
                String task_sdate = sdf1.format(t.getTask_sdate());
                String task_edate = sdf2.format(t.getTask_edate());
                
                String task_status = t.getTask_status();
                String new_task_status = "";
                
                if (task_status.equals("Incompleta") || task_status.equals("Atrasada"))
                {
                    Date now = new Date();
                    Timestamp now_date = new Timestamp(now.getTime());
                    
                    now_date = TimeTransformer.convertToTimeZone(now_date, 6);
                    
                    if (!now_date.before(t.getTask_edate()))
                        new_task_status = "Atrasada";
                    else
                        new_task_status = "Incompleta";
                    
                    TasksModel taskm1 = new TasksModel();
                    taskm1.updateTaskStatus(t.getTask_id(), new_task_status);
                }
                
                String status_color = "";
                
                switch (task_status)
                {
                    case "Incompleta":
                        status_color = "#fd8d48";
                        break;
                    case "Fuera de plazo":
                    case "Atrasada":
                        status_color = "#ea3323";
                        break;
                    case "Completada":
                        status_color = "#63cb83";
                        break;
                    default:
                        status_color = "black";
                        break;
                }

                if (i % 2 == 0)
                {
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
                        + "<p class=\"custom-p ms-2\"><texto style=\"color: #AFB2B3;\">Estatus: </texto><texto style=\"color:"+ status_color +";\">" + t.getTask_status() + "</texto></p>\n"
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

                if (i % 2 == 1)
                    htmlcode += "<div class=\"col-lg-1 d-none d-lg-block\"></div>"; // Columna vacía solo en pantallas grandes

                if (i % 2 == 1 || i == tasks.size() - 1)
                    htmlcode += "</div><div class=\"row mt-2 mb-2\">"; // Cerrar y abrir fila después de 2 tarjetas o al final

            }
        }

        // Final cierre de la última fila
        htmlcode += "</div>";

        return htmlcode;
    }

    public String modelGetTaskResource(String t_id, String resource)
    {
        TasksModel taskm = new TasksModel();
        return String.valueOf(taskm.getTaskResource(t_id, resource));
    }
    
    public String modelGetTaskResourceByUser(String t_id, String user_id, String resource)
    {
        TasksModel taskm = new TasksModel();
        return String.valueOf(taskm.getTaskResourceByUser(t_id, user_id, resource));
    }
    
    public boolean modelDeleteTask(String t_id)
    {
        TasksModel taskm = new TasksModel();
        return taskm.deleteTask(t_id);
    }
}
