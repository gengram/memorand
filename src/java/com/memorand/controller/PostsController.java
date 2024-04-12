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
    
    public String modelGetAllPostsByCollab(String collab_id)
    {
        String htmlcode = "";

        PostsModel postm = new PostsModel();

        int i = 0;

        for (Post post : postm.getAllPostsByCollab(collab_id))
        {
            i++;

            String post_id = post.getPost_id();

            UsersModel userm = new UsersModel();
            User user = userm.getUserInfoByPost(post_id);

            String user_name = "null";

            if (user != null)
            {
                user_name = user.getUser_name() + " " + user.getUser_pat();
            }

            Instant postInstant = post.getPost_date().toInstant();
            Instant now = Instant.now();
            
            Duration duration = Duration.between(postInstant, now);
            Duracion d = new Duracion();
            
            String timeAgo = d.formatDuration(duration);

            if (i % 4 == 0)
            {
                htmlcode += "<div class='row'>";
            }

            htmlcode += "<div class='col'>"
                    + "<p>" + user_name + " - Hace " + timeAgo
                    + "<p>" + post.getPost_text() + "</p>"
                    + "<p> Bien: " + post.getPost_r1() + " Corazón: " + post.getPost_r3() + " Sorpresa: " + post.getPost_r3() + "</p>"
                    + "</div>";

            if (i % 4 == 0)
            {
                htmlcode += "</div>";
            }
        }

        return htmlcode;
    }
    
    public String modelGetPosts(String collab_id)
    {
        String htmlcode = "<h2 class=\"mb-4\">Nueva publicaci&oacute;n</h2>"
                + "<form action=\"../postnew?id=" + collab_id + "\" method=\"post\" enctype=\"multipart/form-data\" accept-charset=\"UTF-8\">\n"
                + "                        <div class=\"col-12\">\n" 
                + "<textarea class=\"form-control bxshad\" style=\"width: 100%; height: 150px; border-color: #AFB2B3;\" rows=\"4\" name=\"task_info\" id=\"task_info\" placeholder=\"Publica un anuncio, pregunta o duda.\" maxlength=\"1024\" style=\"resize: none\" required></textarea>\n" 
                + "</div>"     
                + "                        <div class=\"col-12 text-end\">\n" 
                + "                        <button class=\"btn mt-3 btn-lg rounded-pill custom-bcollab\" type=\"submit\"><p class=\"mb-1 mt-1 me-5 ms-5\" style=\"font-size: 17px;\">Publicar</p></button>\n"
                + "<hr>"
                + "</div>"     
                + "                    </form>";
        
        PostsModel postm = new PostsModel();
        ArrayList<Post> posts = postm.getAllPostsByCollab(collab_id);
        
        if (posts.isEmpty())
        {
            htmlcode += "<p>No hay publicaciones por mostrar.</p>";
            return htmlcode;
        }
        else
        {
            for (Post p : posts)
            {
                String post_id = p.getPost_id();

                UsersModel userm = new UsersModel();
                User user = userm.getUserInfoByPost(post_id);

                String user_name = "null";

                if (user != null)
                {
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                }

                Instant postInstant = p.getPost_date().toInstant();
                Instant now = Instant.now();

                Duration duration = Duration.between(postInstant, now);
                Duracion d = new Duracion();

                String timeAgo = d.formatDuration(duration);
                
                htmlcode += "<div>"
                    + "<p>" + user_name + " - Hace " + timeAgo
                    + "<p>" + p.getPost_text() + "</p>"
                    + "<p> Bien: " + p.getPost_r1() + " Corazón: " + p.getPost_r3() + " Sorpresa: " + p.getPost_r3() + "</p>"
                    + "</div>";
            }
        }
        
        return htmlcode;
    }
    
    public boolean modelIsAnyPostByCollab(String collab_id)
    {
        PostsModel postm = new PostsModel();
        return postm.isAnyPostByCollab(collab_id);
    }
}