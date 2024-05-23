package com.memorand.controller;

import com.memorand.beans.Post;
import com.memorand.beans.User;
import com.memorand.model.PostsModel;
import com.memorand.model.UsersModel;
import com.memorand.util.Duracion;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;

public class PostsController
{
    public boolean modelCreatePost(Post post)
    {
        PostsModel postm = new PostsModel();
        return postm.createPost(post);
    }
    
    public boolean modelDeletePost(String post_id)
    {
        PostsModel postm = new PostsModel();
        return postm.deletePost(post_id);
    }
    
    public String modelGetPosts(String u_id, String collab_id)
    {
        String htmlcode = "<div class='row mt-3'>"
                + "<div class='col-1'></div>\n"
                + "<div class='col-10'>"
                + "<h2 class='mb-4'>Nueva publicaci&oacute;n</h2>"
                + "<form action='../postnew?id=" + collab_id + "' method='post' enctype='multipart/form-data' accept-charset='UTF-8'>\n"
                + "<div class='col-12'>\n"
                + "<textarea class='form-control bxshad' style='width: 100%; height: 150px; border-color: #AFB2B3;' rows='4' name='task_info' id='task_info' placeholder='Publica un anuncio, pregunta o duda.' maxlength='1024' required></textarea>\n"
                + "</div>"
                + "<div class='col-12 text-end'>\n"
                + "<button class='btn mt-3 btn-lg rounded-pill custom-bcollab' type='submit'><p class='mb-1 mt-1 me-5 ms-5' style='font-size: 17px;'>Publicar</p></button>\n"
                + "<hr>"
                + "</div>"
                + "<h2 class='mb-4'>Publicaciones</h2>"
                + "</form>"
                + "</div>\n"
                + "<div class='col-1'></div>\n"
                + "</div>";

        PostsModel postm = new PostsModel();
        ArrayList<Post> posts = postm.getAllPostsByCollab(collab_id);

        if (posts.isEmpty())
        {
            htmlcode += "<div class='row'>"
                    + "<div class='col-1'></div>"
                    + "<div class='col-10'>"
                    + "<p>No hay publicaciones por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-1'></div>"
                    + "</div>";
        }
        else
        {
            int i = 1;

            htmlcode += "<div class='mb-4'>";

            for (Post p : posts)
            {
                String post_id = p.getPost_id();

                UsersModel userm = new UsersModel();
                User user = userm.getUserInfoByPost(post_id);

                String user_id = "null";
                String user_name = "null";
                String user_profile = "null";

                if (user != null)
                {
                    user_id = user.getUser_id();
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                    user_profile = user.getUser_profile();
                }

                String htmldelete = "";
                
                if (u_id.equals(user_id))
                {
                    htmldelete = "<div class='btn-group dropstart'>"
                            + "<p class='btn custom-p me-2 border-0' data-bs-toggle='dropdown' aria-expanded='false'>"
                            + "<texto style='color: #2A2927;'>"
                            + "<i class='bi bi-three-dots-vertical' style='font-size: 20px'></i>"
                            + "</texto>"
                            + "</p>"
                            + "<ul class='dropdown-menu shadow'>\n"
                            + "<li><a style='color: red;' class='dropdown-item' href='../postdelete?collab_id=" + collab_id + "&post_id=" + post_id + "'><i class='bi bi-trash3 me-2'></i>Eliminar publicación</a></li>\n"
                            + "</ul>\n"
                            + "</div>\n";
                }

                Instant postInstant = p.getPost_date().toInstant();
                Instant now = Instant.now();

                Duration duration = Duration.between(postInstant, now);
                Duracion d = new Duracion();

                String timeAgo = d.formatDuration(duration);

                htmlcode += "<div class='row card-set' id='cardSet" + i + "'>\n"
                        + "<div class='col-1'></div>\n"
                        + "<div class='col-10'>\n"
                        + "<div class='card mb-3 border border-1'>\n"
                        + "<div class='card-body'>\n"
                        + "<div class='row mt-0'>\n"
                        + "<div class='col-1 card-title' style='padding-top: 0px;'>\n"
                        + "<img src='../" + user_profile + "' width='50' height='50' class='rounded-4 ms-4 mt-1'>\n"
                        + "</div>\n"
                        + "<div class='col-5 card-title mt-1'>\n"
                        + "<p class='custom-p ms-2' style='font-size: 17px'><texto style='color: #2A2927;'>" + user_name + "</texto></p>\n"
                        + "<p class='custom-p ms-2' style='font-size: 15px'><texto style='color: #AFB2B3;'>hace " + timeAgo + "</texto></p>\n"
                        + "</div>\n"
                        + "<div class='col-6 text-end'>\n"
                        + htmldelete
                        + "</div>\n"
                        + "</div>\n"
                        + "<p style='color: #2A2927;' class='ms-4 me-4'>" + p.getPost_text() + "</p>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<div class='col-1'></div>\n"
                        + "</div> ";

                i++;
            }

            htmlcode += "</div>";
        }

        return htmlcode;
    }
}
