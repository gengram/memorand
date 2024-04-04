package com.memorand.service;

public class ServicesUtil
{
    public String transformServiceStatus(String s) 
    {
        String service_status;
        
        switch (s)
        {
            case "si":
                service_status = "Activo";
                break;
            case "no":
                service_status = "Inactivo";
                break;
            default:
                service_status = "null";
                break;
        }
        
        return service_status;
    }
    
    public String transformActionStatus(String s) 
    {
        String action_status;
        
        switch (s)
        {
            case "si":
                action_status = "Desactivar";
                break;
            case "no":
                action_status = "Activar";
                break;
            default:
                action_status = "null";
                break;
        }
        
        return action_status;
    }
}
