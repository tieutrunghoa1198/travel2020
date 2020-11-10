/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author songm
 */
public class PlaceDAO extends BaseDAO
{

    public Place getPlaceByID(int id)
    {
        try
        {
            String sql = "SELECT * FROM dbo.Place WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next())
            {
                Place p = new Place(
                        rs.getInt("id"),
                        rs.getString("content"),
                        rs.getString("name"),
                        rs.getString("video"));
                return p;
            }
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }
}
