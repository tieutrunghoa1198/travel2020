/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author songm
 */
public class ListFavDAO extends BaseDAO
{

    public List<DestinationDetail> getUserFav(String username)
    {
        try
        {
            List<DestinationDetail> data = new ArrayList<>();
            String sql = "SELECT dt.id, dt.city_id, dt.name, dt.img, dt.content FROM dbo.Destination_Detail dt \n"
                    + "LEFT JOIN dbo.List_Fav lf ON lf.destinationid = dt.id\n"
                    + "WHERE lf.userid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                DestinationDetail dt = new DestinationDetail();
                dt.setId(rs.getInt("id"));
                dt.setCityID(rs.getInt("city_id"));
                dt.setName(rs.getString("name"));
                dt.setImg(rs.getString("img"));
                dt.setContent(rs.getString("content"));
                data.add(dt);
            }
            return data;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public int insertListFav(String username, int destinationid)
    {
        try
        {
            String sql = "INSERT dbo.List_Fav\n"
                    + "        ( userid, destinationid )\n"
                    + "VALUES  ( ?, -- userid - nvarchar(150)\n"
                    + "          ?  -- destinationid - int\n"
                    + "          )";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, destinationid);
            int value = stm.executeUpdate();
            return value;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return 0;
    }

    public int removeListFav(String username, int destinationid)
    {
        try
        {
            String sql = "DELETE FROM dbo.List_Fav WHERE \n"
                    + "userid = ? AND \n"
                    + "destinationid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, destinationid);
            int status = stm.executeUpdate();
            return status;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return 0;
    }
}
