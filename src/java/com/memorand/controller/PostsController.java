package com.memorand.controller;

import com.memorand.beans.Post;
import com.memorand.beans.User;
import com.memorand.model.PostsModel;
import com.memorand.model.UsersModel;
import com.memorand.util.Duracion;
import java.time.Duration;
import java.time.Instant;

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
                    + "<p>" + user_name + " - Hace " + timeAgo + " <a href='publicacion.jsp?post_id="+ post.getPost_id() +"'>Ver comentarios</a> </p>"
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
    
    public boolean modelIsAnyPostByCollab(String collab_id)
    {
        PostsModel postm = new PostsModel();
        return postm.isAnyPostByCollab(collab_id);
    }
}