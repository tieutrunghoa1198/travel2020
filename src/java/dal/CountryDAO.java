/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.Country;
import entity.Destination;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author songm
 */
public class CountryDAO extends BaseDAO
{
    public List<Country> getAllCountry()
    {
        try
        {
            List<Country> listCountry = new ArrayList<>();
            String sql = "select * from country";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Country c = new Country();
                c.setId(rs.getInt("country_id"));
                c.setName(rs.getString("country_name"));
                c.setDescription(rs.getString("descriptions"));
                DestinationDAO destiDAO = new DestinationDAO();
                List<Destination> data = destiDAO.getAllDestinationByID(rs.getInt("country_id"));
                c.setDestinations(data);
                listCountry.add(c);
            }
            connection.close();
            return listCountry;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }
    
    
}
