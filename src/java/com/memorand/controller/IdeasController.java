package com.memorand.controller;

import com.memorand.beans.Idea;
import com.memorand.beans.User;
import com.memorand.model.IdeasModel;
import com.memorand.model.UsersModel;
import com.memorand.util.Duracion;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;

public class IdeasController
{
    public boolean modelCreateIdea(Idea idea)
    {
        IdeasModel ideam = new IdeasModel();
        return ideam.createIdea(idea);
    }

    public boolean modelDeleteIdea(String i_id)
    {
        IdeasModel ideam = new IdeasModel();
        return ideam.deleteIdea(i_id);
    }

    public Idea beanGetIdea(String i_id)
    {
        IdeasModel ideam = new IdeasModel();
        return ideam.getIdea(i_id);
    }

    public String workGetIdeasByTask(String task_id, String u_id)
    {
        String htmlcode = "";

        IdeasModel ideam = new IdeasModel();
        ArrayList<Idea> ideas = ideam.getIdeasByTask(task_id);

        if (ideas.isEmpty())
        {
            htmlcode += "<div class='row'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<p>No hay ideas por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
            
            return htmlcode;
        }
        else
        {
            htmlcode += "<div class='row mb-5'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<div class='row'>";

            for (Idea i : ideas)
            {
                String idea_id = i.getIdea_id();

                UsersModel userm = new UsersModel();
                User user = userm.getUserByTool("ideas","idea_id",idea_id);

                String user_name = "null";
                String user_id = "null";

                if (user != null)
                {
                    user_id = user.getUser_id();
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                }

                Instant ideaInstant = i.getIdea_date().toInstant();
                Instant now = Instant.now();

                Duration duration = Duration.between(ideaInstant, now);
                Duracion d = new Duracion();

                String timeAgo = d.formatDuration(duration);
                
                String htmldelete = "";
                
                if (u_id.equals(user_id))
                    htmldelete = "<li class='me-2'><a style='color: red;' class='dropdown-item' href='../ideadelete?id=" + i.getIdea_id() + "'>Eliminar idea</a></li>\n";
                    
                String htmldrop = "<div class='btn-group dropstart'>"
                                + "<p class='btn custom-p me-2 border-0' data-bs-toggle='dropdown' aria-expanded='false'>"
                                + "<texto style='color: #2A2927;'>"
                                + "<i class='bi bi-three-dots-vertical' style='font-size: 20px'></i>"
                                + "</texto>"
                                + "</p>"
                                + "<ul class='dropdown-menu shadow'>\n"
                                + "<li class='me-2'><a class='dropdown-item' data-bs-toggle='modal' data-bs-target='#modalIdeaEdit"+i.getIdea_id()+"' href=''>Editar idea</a></li>\n"
                                + htmldelete
                                + "</ul>\n"
                                + "</div>\n";

                htmlcode += "<div class=\"col-12 col-md-4 col-lg-3 mb-1\">";

                htmlcode += ""
                        + "<div class=\"card mb-3 border\" style=\"max-width: 18rem; min-height: 16rem; background-color: #" + i.getIdea_color() + ";\">\n"
                        + " <div class=\"card-body\">\n"
                        + "     <div class=\"row mt-0\">\n"
                        + "         <div class=\"col-8\">\n"
                        + "             <button class=\"btn btn-light text-start mb-3\" style=\"padding-bottom: 0rem; padding-top: 0rem;\">\n"
                        + "                 <text style=\"font-size: 13px\">" + user_name + "</text>\n"
                        + "                 <p style=\"font-size: 12px; color: #CEC7C7; padding-bottom: 0rem; padding-top: 0rem;\">hace " + timeAgo + "</p>\n"
                        + "             </button>\n"
                        + "         </div>\n"
                        + "         <div class=\"col-4 text-end\">\n"
                        + htmldrop
                        + "         </div>\n"
                        + "     </div>\n"
                        + "     <b class=\"card-text\" style=\"font-size: 24px; color: #2A2927;\">" + i.getIdea_text() + "</b>\n"
                        + " </div>\n"
                        + "</div>";

                htmlcode += "</div>";
                
                //MODAL
                htmlcode += "<div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" id=\"modalIdeaEdit"+i.getIdea_id()+"\">\n"
                        + "        <div class=\"modal-dialog modal-dialog-centered modal-wIdea\" role=\"document\">\n"
                        + "            <div class=\"modal-content rounded-4 shadow\">\n"
                        + "                <div class=\"modal-header p-5 pb-4 border-bottom-0\">\n"
                        + "                    <h1 class=\"fw-bold mb-0 fs-2\" style=\"color: #2A2927\">Editar idea</h1>\n"
                        + "                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n"
                        + "                </div>\n"
                        + "                <div class=\"modal-body p-5 pt-2\">\n"
                        + "                    <form action=\"../ideaedit?id="+i.getIdea_id()+"\" method=\"post\" enctype=\"multipart/form-data\" accept-charset=\"UTF-8\">\n"
                        + "                        <div class=\"row mb-0\">\n"
                        + "                            <div class=\"col-12\">\n"
                        + "                                <div class=\"mb-0\">\n"
                        + "                                    <label for=\"tag_color\" class=\"form-label\">Color:</label>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                        <div class=\"row mb-3\">\n"
                        + "                            <div class=\"col-12\">\n"
                        + "                                <button class=\"btn btn-color me-2\" type=\"button\" onclick=\"selectColorIdea('#B9D7A2','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #B9D7A2; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <button class=\"btn btn-color me-2\" type=\"button\" onclick=\"selectColorIdea('#96D5D9','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #96D5D9; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <button class=\"btn btn-color me-2\" type=\"button\" onclick=\"selectColorIdea('#A9AFE4','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #A9AFE4; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <button class=\"btn btn-color me-2\" type=\"button\" onclick=\"selectColorIdea('#E2C1E4','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #E2C1E4; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <button class=\"btn btn-color me-2\" type=\"button\" onclick=\"selectColorIdea('#F1B390','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #F1B390; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <button class=\"btn btn-color me-2\" type=\"button\" onclick=\"selectColorIdea('#F8DE9B','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #F8DE9B; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <button class=\"btn btn-color\" type=\"button\" onclick=\"selectColorIdea('#EFA1A1','idea_color"+i.getIdea_id()+"')\"><i style=\"color: #EFA1A1; font-size: 30px;\" class=\"bi bi-square-fill\"></i></button>\n"
                        + "                                <input type=\"hidden\" name=\"idea_color\" id=\"idea_color"+i.getIdea_id()+"\" required>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                        <div class=\"row\">\n"
                        + "                            <div class=\"col-12\" >\n"
                        + "                                <div class=\"mb-3\">\n"
                        + "                                    <label for=\"exampleInputEmail1\" class=\"form-label\">Idea</label>\n"
                        + "                                    <input type=\"text\" name=\"idea_text\" id=\"idea_text\" value=\""+i.getIdea_text()+"\" class=\"form-control-sm rounded-3\" required maxlength=\"75\">\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                        <div class=\"row mb-2\">\n"
                        + "                            <div class=\"col-12\">\n"
                        + "                                <div class=\"mb-0\">\n"
                        + "                                    <button type=\"submit\" class=\"btn btn-lg rounded-pill custom-btarea mb-0 me-5\"><p class=\"mt-1 mb-1 me-2 ms-2\" style=\"font-size: 16px;\">Editar idea</p></button>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                    </form>\n"
                        + "                </div>\n"
                        + "            </div>\n"
                        + "        </div> \n"
                        + "    </div>";
            }

            htmlcode += "</div>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'>"
                    + "</div>"
                    + "</div>";
        }
        return htmlcode;
    }
    
    public boolean modelUpdateIdea(Idea i)
    {
        IdeasModel ideam = new IdeasModel();
        return ideam.updateIdea(i);
    }
}