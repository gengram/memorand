package com.memorand.service;

public class ServicesController
{
    public boolean modelUpdateServiceStatus(String service_id, String service_status)
    {
        ServicesModel servicem = new ServicesModel();
        return servicem.updateServiceStatus(service_id, service_status);
    }
}
