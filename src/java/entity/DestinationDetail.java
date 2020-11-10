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
public class DestinationDetail
{

    private int id;
    private int cityID;
    private String name;
    private String content;
    private String img;

    public DestinationDetail()
    {
    }

    public DestinationDetail(int id, int cityID, String name, String content, String video)
    {
        this.id = id;
        this.cityID = cityID;
        this.name = name;
        this.content = content;
        this.img = video;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getCityID()
    {
        return cityID;
    }

    public void setCityID(int cityID)
    {
        this.cityID = cityID;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
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
