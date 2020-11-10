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
public class DestinationDetailDAO extends BaseDAO
{

    public List<DestinationDetail> getByID(int cityID)
    {
        try
        {
            List<DestinationDetail> data = new ArrayList<>();
            String sql = "SELECT * FROM dbo.Destination_Detail WHERE city_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cityID);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                DestinationDetail d = new DestinationDetail(
                        rs.getInt("id"),
                        rs.getInt("city_id"),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getString("img"));
                data.add(d);
            }
            connection.close();
            return data;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public DestinationDetail getOneByID(int id)
    {
        try
        {
            String sql = "SELECT * FROM dbo.Destination_Detail where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next())
            {
                DestinationDetail d = new DestinationDetail(
                        rs.getInt("id"),
                        rs.getInt("city_id"),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getString("img"));
                return d;
            }
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }
}
