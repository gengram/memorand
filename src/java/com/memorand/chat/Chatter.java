package com.memorand.chat;

import com.memorand.beans.ChatSession;
import com.memorand.beans.Message;
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

@ServerEndpoint(value="/chat", encoders = {MessagesEncoder.class}, decoders = {MessagesDecoder.class}, configurator = HttpConfigurator.class)

public class Chatter
{
    private static final ArrayList<ChatSession> sessions = new ArrayList<>();
    
    @OnOpen
    public void onLogin (Session session)
    {
        HttpSession httpSession = (HttpSession) session.getUserProperties().get(HttpSession.class.getName());

        if (httpSession != null)
        {
            String canva_session = (String) httpSession.getAttribute("canva_id");
            
            if (canva_session != null)
            {
                ChatSession chatSession = new ChatSession(session, canva_session);
                sessions.add(chatSession);
            }
        }
    }
    
    @OnClose
    public void onLogout (Session session)
    {
        Iterator<ChatSession> iterator = sessions.iterator();
        
        while (iterator.hasNext())
        {
            ChatSession chatSession = iterator.next();
            if (chatSession.getChat_session().equals(session))
            {
                iterator.remove();
                break;
            }
        }
    }
    
    @OnMessage
    public void onMessage (Message message, Session session) throws IOException, EncodeException
    {
        for (ChatSession cs : sessions)
        {
            if (cs.getChat_canva().equals(message.getMsg_canva()))
            {
                Session s = cs.getChat_session();
                s.getBasicRemote().sendObject(message);
            }
        }
    }
}