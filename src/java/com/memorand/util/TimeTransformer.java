package com.memorand.util;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.Instant;

public class TimeTransformer
{
    public static Timestamp convertToTimeZone(Timestamp timestampUTC, int horas)
    {
        Instant instant = timestampUTC.toInstant();
        Instant newInstant = instant.minus(Duration.ofHours(horas));

        return Timestamp.from(newInstant);
    }
}