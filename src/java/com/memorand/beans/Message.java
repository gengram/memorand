package com.memorand.beans;

public class Message
{
    private String msg_canva;
    private String msg_sender;
    private int msg_time;
    private String msg_txt;

    public Message() {}

    public Message(String msg_canva, String msg_sender, int msg_time, String msg_txt)
    {
        this.msg_canva = msg_canva;
        this.msg_sender = msg_sender;
        this.msg_time = msg_time;
        this.msg_txt = msg_txt;
    }
    
    public String getMsg_canva()
    {
        return msg_canva;
    }
    
    public void setMsg_canva(String msg_canva)
    {
        this.msg_canva = msg_canva;
    }

    public String getMsg_txt()
    {
        return msg_txt;
    }

    public void setMsg_txt(String msg_txt)
    {
        this.msg_txt = msg_txt;
    }
    
    public String getMsg_sender()
    {
        return msg_sender;
    }

    public void setMsg_sender(String msg_sender)
    {
        this.msg_sender = msg_sender;
    }

    public int getMsg_time()
    {
        return msg_time;
    }

    public void setMsg_time(int msg_time)
    {
        this.msg_time = msg_time;
    }
}