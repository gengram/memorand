package com.memorand.servlets.editar;

import com.memorand.beans.Institution;
import com.memorand.controller.InstitutionsController;
import com.memorand.util.Modificador;
import com.memorand.util.Sanitizante;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class InstitutionEdit extends HttpServlet
{
    private static final String DEFAULT_INST_IMAGE = "XM-Uploads/institutions/default.png";
    private static final String STAFF_HOME = "staff/home.jsp";
    private static final String INDEX_PAGE = "index.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);

        if (session != null)
        {
            String user_type = (String) session.getAttribute("user_type");

            if ("staff".equals(user_type))
            {
                String inst_id = request.getParameter("id");

                if (inst_id != null)
                {
                    Modificador modificador = new Modificador();
                    FileItemFactory fileItemFactory = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

                    List<String> instFields = new ArrayList<>();
                    String imgDirectory = modificador.getInstsDirectory(request);
                    String instImg = handleFileUpload(request, fileUpload, instFields, imgDirectory);

                    if (instImg.isEmpty())
                    {
                        instImg = DEFAULT_INST_IMAGE;
                    }

                    processInstitutionUpdate(request, response, session, instFields, instImg, inst_id);
                }
                else
                {
                    redirectWithError(response, STAFF_HOME, "InvalidInst");
                }
            }
            else
            {
                session.invalidate();
                redirectWithError(response, INDEX_PAGE, "InvalidUser");
            }
        }
        else
        {
            redirectWithError(response, INDEX_PAGE, "SessionExpired");
        }
    }

    private String handleFileUpload(HttpServletRequest request, ServletFileUpload fileUpload, List<String> instFields, String imgDirectory) throws IOException
    {
        String instImg = "";

        try
        {
            List<FileItem> items = fileUpload.parseRequest(request);
            
            for (FileItem item : items)
            {
                if (!item.isFormField())
                {
                    if (!item.getName().isEmpty())
                    {
                        String fileName = item.getName();
                        String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                        
                        if (isValidImageExtension(fileExtension))
                        {
                            File file = new File(imgDirectory + fileName);
                            item.write(file);
                            instImg = "XM-Uploads/institutions/" + convertAndResizeImage(file, imgDirectory);
                        }
                        else
                        {
                            throw new ServletException("Invalid file type. Only PNG, JPG, and WEBP files are allowed.");
                        }
                    }
                    else
                    {
                        instImg = DEFAULT_INST_IMAGE;
                    }
                }
                else
                {
                    instFields.add(item.getString());
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new IOException("File upload failed.", e);
        }

        return instImg;
    }

    private boolean isValidImageExtension(String extension)
    {
        return extension.equals("png") || extension.equals("jpg") || extension.equals("jpeg") || extension.equals("webp");
    }

    private String convertAndResizeImage(File file, String outputDirectory) throws IOException
    {
        BufferedImage originalImage = ImageIO.read(file);
        BufferedImage resizedImage = new BufferedImage(1080, 1080, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = resizedImage.createGraphics();
        g2d.drawImage(originalImage, 0, 0, 1080, 1080, null);
        g2d.dispose();

        String outputFileName = outputDirectory + System.currentTimeMillis() + ".jpg";
        File outputFile = new File(outputFileName);
        ImageIO.write(resizedImage, "jpg", outputFile);
        file.delete();

        return outputFile.getName();
    }

    private void processInstitutionUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session, List<String> instFields, String instImg, String instId) throws IOException
    {
        String instName = Sanitizante.sanitizar(instFields.get(0).trim());
        String limCh = Sanitizante.sanitizar(instFields.get(1).trim());
        String limWk = Sanitizante.sanitizar(instFields.get(2).trim());
        String limGp = Sanitizante.sanitizar(instFields.get(3).trim());
        String limKs = Sanitizante.sanitizar(instFields.get(4).trim());

        Institution institution = new Institution(instId, instName, "", instImg, "", limCh, limWk, limGp, limKs);
        InstitutionsController instc = new InstitutionsController();

        if (instc.modelUpdateInstitution(institution))
            response.sendRedirect("staff/institucion.jsp?id=" + instId);
        else
            redirectWithError(response, STAFF_HOME, "Model");
    }

    private void redirectWithError(HttpServletResponse response, String page, String errorCode) throws IOException
    {
        response.sendRedirect(page + "?error=" + errorCode);
    }
}