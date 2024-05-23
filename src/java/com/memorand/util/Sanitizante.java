package com.memorand.util;

import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public class Sanitizante
{
    public String sanitizar(String input)
    {
        PolicyFactory policy = new HtmlPolicyBuilder().toFactory();
        
        return policy.sanitize(input);
    }
}