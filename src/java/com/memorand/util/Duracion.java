package com.memorand.util;

import java.time.Duration;

public class Duracion
{
    public String formatDuration(Duration duration)
    {
        long seconds = duration.getSeconds();
        
        if (seconds < 30)
        {
            return "un instante";
        }
        if (seconds < 60)
        {
            return seconds + " segundo" + (seconds != 1 ? "s" : "");
        }
        
        long minutes = duration.toMinutes();
        
        if (minutes < 60)
        {
            return minutes + " minuto" + (minutes != 1 ? "s" : "");
        }
        
        long hours = duration.toHours();
        
        if (hours < 24)
        {
            return hours + " hora" + (hours != 1 ? "s" : "");
        }
        
        long days = duration.toDays();
        if (days < 30)
        {
            return days + " día" + (days != 1 ? "s" : "");
        }
        
        long months = days / 30;
        if (months < 12)
        {
            return months + " mes" + (months != 1 ? "es" : "");
        }
        
        long years = months / 12;
        return years + " año" + (years != 1 ? "s" : "");
    }
}