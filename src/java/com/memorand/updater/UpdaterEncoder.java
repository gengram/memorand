package com.memorand.updater;

import com.memorand.beans.Updater;
import java.io.IOException;
import java.io.Writer;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class UpdaterEncoder implements Encoder.TextStream<Updater>
{

    @Override
    public void encode(Updater object, Writer writer) throws EncodeException, IOException
    {
        JsonObject json = Json.createObjectBuilder()
                .add("upd_type", object.getUpd_type())
                .add("upd_id", object.getUpd_id())
                .add("upd_msg", object.getUpd_msg())
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