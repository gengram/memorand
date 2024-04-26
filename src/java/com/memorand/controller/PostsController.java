package com.memorand.controller;

import com.memorand.beans.Post;
import com.memorand.beans.User;
import com.memorand.model.PostsModel;
import com.memorand.model.UsersModel;
import com.memorand.util.Duracion;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;

public class PostsController {

    public boolean modelCreatePost(Post post) {
        PostsModel postm = new PostsModel();
        return postm.createPost(post);
    }

    public String modelGetAllPostsByCollab(String collab_id) {
        String htmlcode = "";

        PostsModel postm = new PostsModel();

        int i = 0;

        for (Post post : postm.getAllPostsByCollab(collab_id)) {
            i++;

            String post_id = post.getPost_id();

            UsersModel userm = new UsersModel();
            User user = userm.getUserInfoByPost(post_id);

            String user_name = "null";

            if (user != null) {
                user_name = user.getUser_name() + " " + user.getUser_pat();
            }

            Instant postInstant = post.getPost_date().toInstant();
            Instant now = Instant.now();

            Duration duration = Duration.between(postInstant, now);
            Duracion d = new Duracion();

            String timeAgo = d.formatDuration(duration);

            if (i % 4 == 0) {
                htmlcode += "<div class='row'>";
            }

            htmlcode += "<div class='col'>"
                    + "<p>" + user_name + " - Hace " + timeAgo
                    + "<p>" + post.getPost_text() + "</p>"
                    + "<p> Bien: " + post.getPost_r1() + " Corazón: " + post.getPost_r3() + " Sorpresa: " + post.getPost_r3() + "</p>"
                    + "</div>";

            if (i % 4 == 0) {
                htmlcode += "</div>";
            }
        }

        return htmlcode;
    }

    public String modelGetPosts(String collab_id) {
        String htmlcode = "<div class=\"row mt-3\">"
                + "<div class=\"col-1\"></div>\n"
                + "<div class=\"col-10\">"
                + "<h2 class=\"mb-4\">Nueva publicaci&oacute;n</h2>"
                + "<form action=\"../postnew?id=" + collab_id + "\" method=\"post\" enctype=\"multipart/form-data\" accept-charset=\"UTF-8\">\n"
                + "                        <div class=\"col-12\">\n"
                + "<textarea class=\"form-control bxshad\" style=\"width: 100%; height: 150px; border-color: #AFB2B3;\" rows=\"4\" name=\"task_info\" id=\"task_info\" placeholder=\"Publica un anuncio, pregunta o duda.\" maxlength=\"1024\" style=\"resize: none\" required></textarea>\n"
                + "</div>"
                + "                        <div class=\"col-12 text-end\">\n"
                + "                        <button class=\"btn mt-3 btn-lg rounded-pill custom-bcollab\" type=\"submit\"><p class=\"mb-1 mt-1 me-5 ms-5\" style=\"font-size: 17px;\">Publicar</p></button>\n"
                + "<hr>"
                + "</div>"
                + "</form>"
                + "</div>\n"
                + "<div class=\"col-1\"></div>\n"
                + "</div>";

        PostsModel postm = new PostsModel();
        ArrayList<Post> posts = postm.getAllPostsByCollab(collab_id);

        if (posts.isEmpty()) {
            htmlcode += "<p>No hay publicaciones por mostrar.</p>";
            return htmlcode;
        } else {
            int cardSetCounter = 1; // Contador de conjuntos de cards
            htmlcode += "<div class=\"mb-4\">";  // Div exterior para envolver todas las cards

            for (Post p : posts) {
                String post_id = p.getPost_id();

                UsersModel userm = new UsersModel();
                User user = userm.getUserInfoByPost(post_id);

                String user_name = "null";
                String user_profile = "null";

                if (user != null) {
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                    user_profile = user.getUser_profile();
                }

                Instant postInstant = p.getPost_date().toInstant();
                Instant now = Instant.now();

                Duration duration = Duration.between(postInstant, now);
                Duracion d = new Duracion();

                String timeAgo = d.formatDuration(duration);

                htmlcode += "<div class=\"row card-set\" id=\"cardSet" + cardSetCounter + "\">\n"
                        + "<div class=\"col-1\"></div>\n"
                        + "                <div class=\"col-10\">\n"
                        + "                    <div class=\"card mb-3 border border-2\">\n"
                        + "                        <div class=\"card-body\">\n"
                        + "                            <div class=\"row mt-0\">\n"
                        + "                                <div class=\"col-1 card-title\" style=\" padding-top: 0px;\">\n"
                        + "                                    <img src='../"+ user_profile +"' width='50' height='50' class='rounded-4 ms-4 mt-1'>\n"
                        + "                                </div>\n"
                        + "                                <div class=\"col-5 card-title mt-1\" style=\"\">\n"
                        + "                                    <p class=\"custom-p ms-2\" style=\"font-size: 17px\"><texto style=\"color: #2A2927;\">" + user_name + "</texto></p>\n"
                        + "                                    <p class=\"custom-p ms-2\" style=\"font-size: 15px\"><texto style=\"color: #AFB2B3;\">hace " + timeAgo + "</texto></p>\n"
                        + "                                </div>\n"
                        + "                                <div class=\"col-6 text-end\">\n"
                        + "                                    <div class=\"btn-group dropstart\">"
                        + "<p class=\"btn custom-p me-2 border-0\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">"
                        + "<texto class='' style=\"color: #2A2927;\">"
                        + "<i class=\"bi bi-three-dots-vertical\" style=\"font-size: 20px\">"
                        + "</i></texto>"
                        + "</p><ul class=\"dropdown-menu shadow\">\n"
                        + "    <li><a style=\"color: red;\" class=\"dropdown-item\" href=\"#\"><i class=\"bi bi-trash3 me-2\"></i>Eliminar publicac&oacute;n</a></li>\n"
                        + "  </ul>\n"
                        + "</div>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                            <p style=\"color: #2A2927;\" class=\"ms-4 me-4\">" + p.getPost_text() + "</p>\n"
                        + "                            <hr class=\"ms-4 me-4 mt-2\" style=\"color: #7F7F7F\">\n"
                        + "                            <div class=\"row\">\n"
                        + "                                <div class=\"col-12 ms-4\">\n"
                        + "                                    <button class=\"btn btn-light navPub rounded-pill btnReactions\"><i class=\"bi bi-emoji-smile-fill me-2\"></i>" + p.getPost_r1() + "</button>\n"
                        + "                                    <button class=\"btn btn-light navPub rounded-pill btnReactions activeP\">\n"
                        + "                                        <svg class=\"mb-0\" xmlns=\"http://www.w3.org/2000/svg\" width=\"19\" height=\"19\" fill=\"currentColor\" class=\"bi bi-emoji-surprise-fill\" viewBox=\"0 0 19 19\">\n"
                        + "                                        <path d=\"M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M7 5.5C7 4.672 6.552 4 6 4s-1 .672-1 1.5S5.448 7 6 7s1-.672 1-1.5m4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 7 10 7s1-.672 1-1.5M8 13a2 2 0 1 0 0-4 2 2 0 0 0 0 4\"/>\n"
                        + "                                        </svg>" + p.getPost_r2() + "</button>\n"
                        + "                                    <button class=\"btn btn-light navPub rounded-pill btnReactions\"><i class=\"bi bi-emoji-frown-fill me-2\"></i>" + p.getPost_r3() + "</button>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                    </div>\n"
                        + "                </div>\n"
                        + "                <div class=\"col-1\"></div>\n"
                        + "            </div> ";

                cardSetCounter++; // Incrementa el contador de conjuntos de cards
            }

            htmlcode += "</div>"; // Cierra el div exterior de las cards
        }

        return htmlcode;
    }

    public boolean modelIsAnyPostByCollab(String collab_id) {
        PostsModel postm = new PostsModel();
        return postm.isAnyPostByCollab(collab_id);
    }
}
