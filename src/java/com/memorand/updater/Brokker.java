package com.memorand.updater;

import com.memorand.beans.Updater;
import com.memorand.beans.UpdaterSession;
import com.memorand.util.HttpConfigurator;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/updater", encoders = {UpdaterEncoder.class}, decoders = {UpdaterDecoder.class}, configurator = HttpConfigurator.class)

public class Brokker
{
    private static final ArrayList<UpdaterSession> sessions = new ArrayList<>();
    
    @OnOpen
    public void onLogin (Session session)
    {
        HttpSession httpSession = (HttpSession) session.getUserProperties().get(HttpSession.class.getName());
        
        if (httpSession != null)
        {
            String upd_type = (String) httpSession.getAttribute("upd_type");
            String upd_id = (String) httpSession.getAttribute("upd_id");
            
            if (upd_type != null || upd_id != null)
            {
                UpdaterSession updaterSession = new UpdaterSession(session, upd_type, upd_id);
                sessions.add(updaterSession);
            }
        }
    }
    
    @OnClose
    public void onLogout (Session session)
    {
        Iterator<UpdaterSession> iterator = sessions.iterator();
        
        while (iterator.hasNext())
        {
            UpdaterSession updaterSession = iterator.next();
            if (updaterSession.getUpd_session().equals(session))
            {
                iterator.remove();
                break;
            }
        }
    }
    
    @OnMessage
    public void onMessage (Updater updater, Session session) throws IOException, EncodeException
    {
        for (UpdaterSession us : sessions)
        {
            System.out.println("Session type: " + us.getUpd_type());
            System.out.println("Session id: " + us.getUpd_id());
            System.out.println("Updater type: " + updater.getUpd_type());
            System.out.println("Updater id: " + updater.getUpd_id());
            
            if (us.getUpd_type().equals(updater.getUpd_type()) && us.getUpd_id().equals(updater.getUpd_id()))
            {
                Session s = us.getUpd_session();
                s.getBasicRemote().sendObject(updater);
            }
        }
    }
}