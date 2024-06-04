package com.memorand.util;

import java.sql.Timestamp;
import java.time.ZoneId;
import java.time.ZonedDateTime;

public class TimeTransformer
{
    public static Timestamp convertToTimeZone(Timestamp timestampUTC, String timeZoneId)
    {
        ZonedDateTime zonedDateTimeUTC = timestampUTC.toInstant().atZone(ZoneId.of("UTC"));

        ZonedDateTime zonedDateTimeTarget = zonedDateTimeUTC.withZoneSameInstant(ZoneId.of(timeZoneId));

        return Timestamp.from(zonedDateTimeTarget.toInstant());
    }
}