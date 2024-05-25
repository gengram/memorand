package com.memorand.util;

import java.util.HashMap;
import java.util.Map;

public class HtmlEscapes
{
    private static final Map<Character, String> HTML_ESCAPE_MAP;

    static
    {
        HTML_ESCAPE_MAP = new HashMap<>();
        HTML_ESCAPE_MAP.put('á', "&aacute;");
        HTML_ESCAPE_MAP.put('é', "&eacute;");
        HTML_ESCAPE_MAP.put('í', "&iacute;");
        HTML_ESCAPE_MAP.put('ó', "&oacute;");
        HTML_ESCAPE_MAP.put('ú', "&uacute;");
        HTML_ESCAPE_MAP.put('Á', "&Aacute;");
        HTML_ESCAPE_MAP.put('É', "&Eacute;");
        HTML_ESCAPE_MAP.put('Í', "&Iacute;");
        HTML_ESCAPE_MAP.put('Ó', "&Oacute;");
        HTML_ESCAPE_MAP.put('Ú', "&Uacute;");
        HTML_ESCAPE_MAP.put('ñ', "&ntilde;");
        HTML_ESCAPE_MAP.put('Ñ', "&Ntilde;");
        HTML_ESCAPE_MAP.put('ü', "&uuml;");
        HTML_ESCAPE_MAP.put('Ü', "&Uuml;");
        HTML_ESCAPE_MAP.put('&', "&amp;");
        HTML_ESCAPE_MAP.put('<', "&lt;");
        HTML_ESCAPE_MAP.put('>', "&gt;");
        HTML_ESCAPE_MAP.put('"', "&quot;");
        HTML_ESCAPE_MAP.put('\'', "&#39;");
    }

    public static String escapeHtml(String input)
    {
        StringBuilder escapedString = new StringBuilder();
        
        for (char c : input.toCharArray())
        {
            String escapedChar = HTML_ESCAPE_MAP.get(c);
            if (escapedChar != null)
            {
                escapedString.append(escapedChar);
            }
            else
            {
                escapedString.append(c);
            }
        }
        
        return escapedString.toString();
    }
}
