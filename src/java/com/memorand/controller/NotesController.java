package com.memorand.controller;

import com.memorand.beans.Note;
import com.memorand.model.NotesModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class NotesController {

    public boolean modelCreateNote(Note note) {
        NotesModel notem = new NotesModel();
        return notem.createNote(note);
    }
    
    public boolean modelUpdateNoteText(String note_id, String note_text) 
    {
        NotesModel notem = new NotesModel();
        return notem.updateNoteText(note_id, note_text);
    }

    public Note modelGetNoteById(String n_id) {
        NotesModel notem = new NotesModel();
        return notem.getNote(n_id);
    }
    
    public String modelGetNoteTextById(String n_id)
    {
        NotesModel notem = new NotesModel();
        return notem.getNoteText(n_id);
    }

    public String modelGetNotesByTask(String task_id) {
        String htmlcode = "<div class='row'>"
                + "<div class='col-lg-1 d-none d-lg-block'></div>"
                + "<div class='col-lg-10'>"
                + "<h3>Notas del equipo</h3>"
                + "</div>"
                + "<div class='col-lg-1 d-none d-lg-block'></div>"
                + "</div>";

        NotesModel notem = new NotesModel();
        ArrayList<Note> notes = notem.getNotesByTask(task_id);

        if (notes.isEmpty()) {
            htmlcode +=  "<div class='row mt-3'>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "<div class='col-lg-10'>"
                    + "<p>No hay notas por mostrar.</p>"
                    + "</div>"
                    + "<div class='col-lg-1 d-none d-lg-block'></div>"
                    + "</div>";
            return htmlcode;
        } else {
            htmlcode += "<diV class='row'>"
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

            for (Note n : notes) {
                String note_id = n.getNote_id();

                SimpleDateFormat sdf1 = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd 'de' MMMM 'a la(s):' hh:mm a", new Locale("es"));

                String note_cdate = sdf1.format(n.getNote_cdate());
                String note_mdate = sdf2.format(n.getNote_mdate());

                htmlcode += "<tr>\n"
                        + "                        <td style='padding: 20px;' class='align-middle'><i class=\"bi bi-three-dots-vertical\"></i></td>\n"
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
