package com.memorand.beans;

import java.io.Serializable;
import javax.websocket.Session;

public class UpdaterSession implements Serializable
{
    private Session upd_session;
    private String upd_type;
    private String upd_id;

    public UpdaterSession() {}

    public UpdaterSession(Session upd_session, String upd_type, String upd_id)
    {
        this.upd_session = upd_session;
        this.upd_type = upd_type;
        this.upd_id = upd_id;
    }

    public Session getUpd_session()
    {
        return upd_session;
    }

    public void setUpd_session(Session upd_session)
    {
        this.upd_session = upd_session;
    }

    public String getUpd_type()
    {
        return upd_type;
    }

    public void setUpd_type(String upd_type)
    {
        this.upd_type = upd_type;
    }

    public String getUpd_id()
    {
        return upd_id;
    }

    public void setUpd_id(String upd_id)
    {
        this.upd_id = upd_id;
    }
}