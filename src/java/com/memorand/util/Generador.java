package com.memorand.util;

import java.util.UUID;

public class Generador
{
    public String newID()
    {
        return UUID.randomUUID().toString();
    }
}