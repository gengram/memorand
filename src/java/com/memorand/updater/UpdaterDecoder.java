package com.memorand.updater;

import com.memorand.beans.Updater;
import java.io.IOException;
import java.io.Reader;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class UpdaterDecoder implements Decoder.TextStream<Updater>
{

    @Override
    public Updater decode(Reader reader) throws DecodeException, IOException
    {
        Updater u = new Updater();
        
        try (JsonReader jr = Json.createReader(reader))
        {
            JsonObject json = jr.readObject();
            u.setUpd_type(json.getString("upd_type"));
            u.setUpd_id(json.getString("upd_id"));
            u.setUpd_msg(json.getString("upd_msg"));
        }
        
        return u;
    }

    @Override
    public void init(EndpointConfig config) {}

    @Override
    public void destroy() {}
}