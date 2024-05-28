package com.memorand.chat;

import com.memorand.beans.Message;
import java.io.IOException;
import java.io.Reader;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class MessagesDecoder implements Decoder.TextStream<Message>
{
    @Override
    public Message decode(Reader reader) throws DecodeException, IOException
    {
        Message m = new Message();
        
        try (JsonReader jr = Json.createReader(reader))
        {
            JsonObject json = jr.readObject();
            m.setMsg_canva(json.getString("msg_canva"));
            m.setMsg_sender(json.getString("msg_sender"));
            m.setMsg_time(json.getInt("msg_time"));
            m.setMsg_txt(json.getString("msg_txt"));
        }
        
        return m;
    }

    @Override
    public void init(EndpointConfig config) {}

    @Override
    public void destroy() {}
}