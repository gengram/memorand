package com.memorand.controller;

import com.memorand.beans.Task;
import com.memorand.model.TasksModel;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class TasksController
{
    public boolean modelCreateTask(Task task)
    {
        TasksModel taskm = new TasksModel();
        return taskm.createTask(task);
    }
    
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
    
    public boolean modelIsAnyTaskByCollab(String collab_id)
    {
        TasksModel taskm = new TasksModel();
        return taskm.isAnyTaskByCollab(collab_id);
    }
}