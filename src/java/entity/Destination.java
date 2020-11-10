/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author songm
 */
public class Destination
{
    private int id; 
    private String name; 
    private String descript;
    private String img;

    public Destination()
    {
    }

    public Destination(int id, String name, String descript, String img)
    {
        this.id = id;
        this.name = name;
        this.descript = descript;
        this.img = img;
    }
    
    public int getId()
    {
        return id;
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

    public String getDescript()
    {
        return descript;
    }

    public void setDescript(String descript)
    {
        this.descript = descript;
    }

    public String getImg()
    {
        return img;
    }

    public void setImg(String img)
    {
        this.img = img;
    }
    
    
}
