package com.memorand.controller;

import com.memorand.beans.Idea;
import com.memorand.beans.User;
import com.memorand.model.IdeasModel;
import com.memorand.model.UsersModel;
import com.memorand.util.Duracion;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;

public class IdeasController {

    public boolean modelCreateIdea(Idea idea) {
        IdeasModel ideam = new IdeasModel();
        return ideam.createIdea(idea);
    }

    public Idea modelGetIdeaById(String i_id) {
        IdeasModel ideam = new IdeasModel();
        return ideam.getIdeaById(i_id);
    }

    public String modelGetIdeasByTask(String task_id) {
        String htmlcode = "";

        IdeasModel ideam = new IdeasModel();
        ArrayList<Idea> ideas = ideam.getIdeasByTask(task_id);

        if (ideas.isEmpty()) {
            htmlcode += "<div class='row'>"
                    + "<div class='col-1'></div>"
                    + "<div class='col-10'>"
                    + "<p>No hay ideas por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-1'></div>"
                    + "</div>";
            return htmlcode;
        } else {
            int j = 0;
            htmlcode += "<div class=\"row ms-4\">";
            for (Idea i : ideas) {
                j++;
                String idea_id = i.getIdea_id();

                UsersModel userm = new UsersModel();
                User user = userm.getUserInfoByIdea(idea_id);

                String user_name = "null";

                if (user != null) {
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                }

                Instant ideaInstant = i.getIdea_date().toInstant();
                Instant now = Instant.now();

                Duration duration = Duration.between(ideaInstant, now);
                Duracion d = new Duracion();

                String timeAgo = d.formatDuration(duration);

                // Insertar col-4 para la tarjeta y controlar la cantidad de tarjetas por fila
                htmlcode += "<div class=\"col-3 me-4 ms-4 mb-1\">";

                htmlcode += "<div class=\"card mb-3 border\" style=\"max-width: 18rem; min-height: 16rem ;background-color: #" + i.getIdea_color() + ";\">\n"
                        + "<div class=\"card-body\">\n"
                        + "<div class=\"row mt-0\">\n"
                        + "<div class=\"col-10\">\n"
                        + "<button class=\"btn btn-light text-start mb-3\" style=\"padding-bottom: 0rem; padding-top: 0rem;\">\n"
                        + "<text style=\"font-size: 13px\">" + user_name + "</text>\n"
                        + "<p style=\"font-size: 12px; color: #CEC7C7; padding-bottom: 0rem; padding-top: 0rem;\">hace  " + timeAgo + "</p>\n"
                        + "</button>\n"
                        + "</div>\n"
                        + "<div class=\"col-2 text-end\">\n"
                        + "<i class=\"bi bi-three-dots-vertical\"  style=\"color: #2A2927;\"></i>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<b class=\"card-text\" style=\"font-size: 24px; color: #2A2927;\">" + i.getIdea_text() + "</b>\n"
                        + "</div>\n"
                        + "</div>";

                htmlcode += "</div>";

                // Si se han generado tres tarjetas, cerrar la fila y comenzar una nueva
                if (j % 3 == 0) {
                    htmlcode += "</div><div class=\"row ms-4\">";
                }
            }
            htmlcode += "</div>";
        }
        return htmlcode;
    }

}
