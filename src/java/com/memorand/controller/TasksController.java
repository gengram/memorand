package com.memorand.controller;

import com.memorand.beans.Task;
import com.memorand.model.TasksModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class TasksController
{
    public boolean modelCreateTask(Task task)
    {
        TasksModel taskm = new TasksModel();
        return taskm.createTask(task);
    }
    
    public Task modelGetTaskInfoById(String t_id)
    {
        TasksModel taskm = new TasksModel();
        return taskm.getTaskInfoById(t_id);
    }
    
    public boolean modelIsAnyTaskByCollab(String collab_id)
    {
        TasksModel taskm = new TasksModel();
        return taskm.isAnyTaskByCollab(collab_id);
    }
    
    //DEPRECIADO
    public String modelGetAllTasksByCollab(String collab_id, String arg)
    {
        String htmlcode = "";
        
        TasksModel taskm = new TasksModel();
        
        int i = 0;
        
        for (Task task : taskm.getAllTasksByCollab(collab_id, arg))
        {
            i++;
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
            
            String task_edate = sdf.format(task.getTask_edate());
            String task_sdate = sdf.format(task.getTask_sdate());
            
            if (i % 4 == 0)
            {
                htmlcode += "<div class='row'>";
            }
            
            htmlcode += "<div class='col'>"
                    + "<p>"+ task.getTask_name() + " <a href='tarea.jsp?task_id="+ task.getTask_id()+"'>Ver apuntes</a> </p>"
                    + "<p> Inicio: "+ task_sdate +" - Final: "+ task_edate +"</p>"
                    + "<p> Estatus: " + task.getTask_status() + " Prioridad: " + task.getTask_prior() + " Dificultad: " + task.getTask_diff() + "</p>"
                    + "</div>";
            
            if (i % 4 == 0)
            {
                htmlcode += "</div>";
            }
        }
        
        return htmlcode;
    }
    
    public String modelGetTasksTable(String collab_id, String task_order)
    {
        String htmlcode = "<a href='tasknew.jsp?id=" + collab_id + "'>Nueva tarea</a>\n"
                + "                    <a href='tagnew.jsp?id=" + collab_id + "'>Nueva etiqueta</a>\n"
                + "\n"
                + "                    <p>Vista <button id=\"task_panel\">Panel</button> <button id=\"task_tabla\">Tabla</button></p>\n"
                + "\n"
                + "                    <div id=\"content_tasks\">";
        
        TasksModel taskm = new TasksModel();
        ArrayList<Task> tasks = taskm.getAllTasksByCollab(collab_id, task_order);
        
        if (tasks.isEmpty())
        {
            htmlcode += "<p>No hay tareas por mostrar.</p>";
            return htmlcode;
        }
        else
        {
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
            
            for (Task t : tasks)
            {
                SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                
                String task_edate = sdf.format(t.getTask_edate());
                
                htmlcode += "<tr>\n" +
"                               <td></td>\n" +
"                               <td>"+ t.getTask_name() +"</td>\n" +
"                               <td>"+ task_edate +"</td>\n" +
"                               <td>"+ t.getTask_status() +"</td>\n" +
"                               <td>"+ t.getTask_prior() +"</td>\n" +
"                               <td><a href='tarea.jsp?id="+ t.getTask_id() +"'>Ver</a></td>\n" +
"                           </tr>";
            } 
            
            htmlcode += "</tbody>\n" +
"                </table>";
        }
        
        htmlcode += "</div>\n"
                + "<script src=\"scripts/tasks.js\"></script>";
        
        return htmlcode;
    }
    
}