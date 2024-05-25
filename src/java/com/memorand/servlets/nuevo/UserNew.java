package com.memorand.servlets.nuevo;

import com.memorand.beans.InUser;
import com.memorand.beans.User;
import com.memorand.controller.InUsersController;
import com.memorand.controller.UsersController;
import com.memorand.util.Generador;
import com.memorand.util.Modificador;
import com.memorand.util.Sanitizante;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class UserNew extends HttpServlet
{
    private static final String DEFAULT_USER_IMAGE = "XM-Uploads/users/profile/default-user.png";
    private static final String STAFF_HOME = "staff/home.jsp";
    private static final String ADMIN_HOME = "admin/home.jsp";
    private static final String INDEX_PAGE = "index.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);

        if (session != null)
        {
            String user_type = (String) session.getAttribute("user_type");

            if (user_type != null)
            {
                Modificador modificador = new Modificador();
                FileItemFactory fileItemFactory = new DiskFileItemFactory();
                ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

                List<String> userFields = new ArrayList<>();
                String imgDirectory = modificador.getUsersDirectory(request);
                String userImg = handleFileUpload(request, fileUpload, userFields, imgDirectory);

                if (userImg.isEmpty())
                {
                    userImg = DEFAULT_USER_IMAGE;
                }

                processUserCreation(request, response, session, user_type, userFields, userImg);
            }
            else
            {
                redirectWithError(response, INDEX_PAGE, "100-4");
            }
        }
        else
        {
            redirectWithError(response, INDEX_PAGE, "101");
        }
    }

    private String handleFileUpload(HttpServletRequest request, ServletFileUpload fileUpload, List<String> userFields, String imgDirectory) throws IOException
    {
        String userImg = "";
        
        try
        {
            List<FileItem> items = fileUpload.parseRequest(request);
            for (FileItem item : items)
            {
                if (!item.isFormField())
                {
                    String fileName = item.getName();
                    if (!fileName.isEmpty())
                    {
                        String fileExtension = getFileExtension(fileName);
                        if (isValidImageExtension(fileExtension)) 
                        {
                            File tempFile = new File(imgDirectory + fileName);
                            item.write(tempFile);
                            userImg = "XM-Uploads/users/profile/" + convertAndResizeImage(tempFile, imgDirectory);
                        }
                        else
                        {
                            throw new IOException("Invalid file type: " + fileExtension);
                        }
                    }
                }
                else
                {
                    userFields.add(item.getString());
                }
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return userImg;
    }

    private String getFileExtension(String fileName)
    {
        int dotIndex = fileName.lastIndexOf('.');
        return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1).toLowerCase();
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

    private void processUserCreation(HttpServletRequest request, HttpServletResponse response, HttpSession session, String userType, List<String> userFields, String userImg) throws IOException
    {
        switch (userType)
        {
            case "staff":
                handleStaffCreation(request, response, userFields, userImg);
                break;
            case "admin":
                handleAdminCreation(request, response, session, userFields, userImg);
                break;
            default:
                redirectWithError(response, INDEX_PAGE, "100-4");
        }
    }

    private void handleStaffCreation(HttpServletRequest request, HttpServletResponse response, List<String> userFields, String userImg) throws IOException
    {
        String instId = request.getParameter("id");
        createUserAndRedirect(request, response, userFields, userImg, instId, "admin", STAFF_HOME);
    }

    private void handleAdminCreation(HttpServletRequest request, HttpServletResponse response, HttpSession session, List<String> userFields, String userImg) throws IOException
    {
        String instId = (String) session.getAttribute("inst_id");
        String newUserType = request.getParameter("user_type");

        if (newUserType != null)
        {
            createUserAndRedirect(request, response, userFields, userImg, instId, newUserType, ADMIN_HOME);
        }
        else
        {
            redirectWithError(response, ADMIN_HOME, "100-4");
        }
    }

    private void createUserAndRedirect(HttpServletRequest request, HttpServletResponse response, List<String> userFields, String userImg, String instId, String userType, String redirectPage) throws IOException
    {
        Generador generador = new Generador();
        String userId = generador.newID();
        User user = new User(userId, Sanitizante.sanitizar(userFields.get(0)), Sanitizante.sanitizar(userFields.get(1)), userType, Sanitizante.sanitizar(userFields.get(2)), Sanitizante.sanitizar(userFields.get(3)), Sanitizante.sanitizar(userFields.get(4)), "si", userImg);
        UsersController usersController = new UsersController();

        if (!usersController.modelValidateUserEmail(userFields.get(0)))
        {
            if (usersController.modelCreateUser(user))
            {
                InUser inUser = new InUser(instId, userId);
                InUsersController inUsersController = new InUsersController();

                if (inUsersController.modelCreateInUsers(inUser))
                {
                    response.sendRedirect(redirectPage);
                }
                else
                {
                    redirectWithError(response, redirectPage, "100-1");
                }
            }
            else
            {
                redirectWithError(response, redirectPage, "100-2");
            }
        }
        else
        {
            redirectWithError(response, redirectPage, "300");
        }
    }

    private void redirectWithError(HttpServletResponse response, String page, String errorCode) throws IOException
    {
        response.sendRedirect(page + "?error=" + errorCode);
    }
}
