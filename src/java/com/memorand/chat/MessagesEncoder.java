package com.memorand.chat;

import com.memorand.beans.Message;
import java.io.IOException;
import java.io.Writer;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class MessagesEncoder implements Encoder.TextStream<Message>
{
    @Override
    public void encode(Message object, Writer writer) throws EncodeException, IOException
    {
        JsonObject json = Json.createObjectBuilder()
                .add("msg_canva", object.getMsg_sender())
                .add("msg_sender", object.getMsg_sender())
                .add("msg_time", object.getMsg_time())
                .add("msg_txt", object.getMsg_txt())
                .build();
        
        try (JsonWriter jw = Json.createWriter(writer))
        {
            jw.writeObject(json);
        }
    }

    @Override
    public void init(EndpointConfig config) {}

    @Override
    public void destroy() {}
}