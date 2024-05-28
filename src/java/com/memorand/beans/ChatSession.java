package com.memorand.beans;

import javax.websocket.Session;

public class ChatSession
{
    private Session chat_session;
    private String chat_canva;

    public ChatSession() {}

    public ChatSession(Session chat_session, String chat_canva)
    {
        this.chat_session = chat_session;
        this.chat_canva = chat_canva;
    }

    public String getChat_canva()
    {
        return chat_canva;
    }

    public void setChat_canva(String chat_canva)
    {
        this.chat_canva = chat_canva;
    }

    public Session getChat_session()
    {
        return chat_session;
    }

    public void setChat_session(Session chat_session)
    {
        this.chat_session = chat_session;
    }
}