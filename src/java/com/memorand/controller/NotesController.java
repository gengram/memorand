package com.memorand.controller;

import com.memorand.beans.Note;
import com.memorand.beans.User;
import com.memorand.model.NotesModel;
import com.memorand.model.UsersModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class NotesController
{
    public boolean modelCreateNote(Note n)
    {
        NotesModel notem = new NotesModel();
        return notem.createNote(n);
    }
    
    public boolean modelDeleteNote(String n_id)
    {
        NotesModel notem = new NotesModel();
        return notem.deleteNote(n_id);
    }
    
    public boolean modelUpdateNoteText(String n_id, String n_text) 
    {
        NotesModel notem = new NotesModel();
        return notem.updateNoteText(n_id, n_text);
    }

    public Note beanGetNote(String n_id)
    {
        NotesModel notem = new NotesModel();
        return notem.getNote(n_id);
    }
    
    public String modelGetNoteText(String n_id)
    {
        NotesModel notem = new NotesModel();
        return notem.getNoteText(n_id);
    }

    public String workGetNotesByTask(String task_id, String u_id)
    {
        String htmlcode = "<div class='row mt-2'>"
                + "<div class='col-lg-1 d-none d-lg-block'></div>"
                + "<div class='col-lg-10'>"
                + "<h4>Notas del equipo</h4>"
                + "</div>"
                + "<div class='col-lg-1 d-none d-lg-block'></div>"
                + "</div>";

        NotesModel notem = new NotesModel();
        ArrayList<Note> notes = notem.getNotesByTask(task_id);

        if (notes.isEmpty())
        {
            htmlcode +=  "<div class='row mt-3'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<p>No hay notas por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
            return htmlcode;
        }
        else
        {
            htmlcode += "<div class='row mt-3'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<table class='table mb-5'>"
                    + "<thead>\n"
                    + "                    <tr>\n"
                    + "                        <th scope='col'></th>\n"
                    + "                        <th scope='col'>Nombre</th>\n"
                    + "                        <th scope='col'>Creada el:</th>\n"
                    + "                        <th scope='col'>&Uacute;ltima modificaci&oacute;n</th>\n"
                    + "                        <th scope='col'></th>\n"
                    + "                    </tr>\n"
                    + "                </thead>\n"
                    + "                <tbody id='table-body'>";

            for (Note n : notes)
            {
                String note_id = n.getNote_id();
                
                UsersModel userm = new UsersModel();
                User user = userm.getUserByTool("notes","note_id",note_id);
                
                String user_name = "null";
                String user_id = "null";

                if (user != null)
                {
                    user_id = user.getUser_id();
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                }

                SimpleDateFormat sdf1 = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd 'de' MMMM 'a la(s):' hh:mm a", new Locale("es"));

                String note_cdate = sdf1.format(n.getNote_cdate());
                String note_mdate = sdf2.format(n.getNote_mdate());
                
                String htmldelete = "";
                
                if (u_id.equals(user_id))
                    htmldelete = "<li class='me-2'><a style='color: red;' class='dropdown-item' href='../notedelete?id=" + n.getNote_id() + "'>Eliminar nota</a></li>\n";
                    
                String htmldrop = "<div class='btn-group dropstart'>"
                                + "<p class='btn custom-p me-2 border-0' data-bs-toggle='dropdown' aria-expanded='false'>"
                                + "<texto style='color: #2A2927;'>"
                                + "<i class='bi bi-three-dots-vertical' style='font-size: 20px'></i>"
                                + "</texto>"
                                + "</p>"
                                + "<ul class='dropdown-menu shadow'>\n"
                                + "<li class='me-2'><a class='dropdown-item' data-bs-toggle='modal' data-bs-target='#modalNoteEdit"+n.getNote_id()+"' href=''>Editar nota</a></li>\n"
                                + htmldelete
                                + "</ul>\n"
                                + "</div>\n";

                htmlcode += "<tr>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>"+ htmldrop +"</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + n.getNote_name() + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'>" + note_cdate + "</td>\n"
                        + "                        <td cstyle='padding: 20px;' class='align-middle'>" + note_mdate + "</td>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'><a href='nota.jsp?id=" + note_id + "'><i style='color: #2A2927; font-size: 18px;' class='bi bi-chevron-right'></i></a></td>\n"
                        + "                    </tr>";
            }

            htmlcode += "</tbody>\n"
                    + "            </table>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
        }

        return htmlcode;
    }
}