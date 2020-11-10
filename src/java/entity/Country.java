/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;

/**
 *
 * @author songm
 */
public class Country
{
    private int id; 
    private String name; 
    private String description;
    private List<Destination> destinations;

    public int getId()
    {
        return id;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }
    
    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public List<Destination> getDestinations()
    {
        return destinations;
    }

    public void setDestinations(List<Destination> destinations)
    {
        this.destinations = destinations;
    }
    
    
}
