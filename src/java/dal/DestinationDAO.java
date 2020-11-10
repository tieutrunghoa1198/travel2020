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
public class DestinationDAO extends BaseDAO
{

    public List<Destination> getAllDestination()
    {

        try
        {
            List<Destination> data = new ArrayList<>();
            String sql = "SELECT * FROM dbo.Destination";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Destination d = new Destination(
                        rs.getInt("city_id"),
                        rs.getString("city_name"),
                        rs.getString("descriptions"),
                        rs.getString("img"));
                data.add(d);
            }
            return data;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public List<Destination> getAllDestinationByID(int countryID)
    {
        try
        {
            List<Destination> data = new ArrayList<>();
            String sql = "SELECT * FROM dbo.Destination\n"
                    + "WHERE country_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, countryID);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Destination d = new Destination(
                        rs.getInt("city_id"),
                        rs.getString("city_name"),
                        rs.getString("descriptions"),
                        rs.getString("img"));
                data.add(d);
            }
            return data;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public Destination getByID(int destinationID)
    {
        try
        {
            Destination d = null;
            String sql = "SELECT * FROM dbo.Destination WHERE city_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, destinationID);
            ResultSet rs = stm.executeQuery();
            if (rs.next())
            {
                d = new Destination(
                        rs.getInt("city_id"),
                        rs.getString("city_name"),
                        rs.getString("descriptions"),
                        rs.getString("img"));
            }
            return d;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }
}
