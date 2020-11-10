/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author songm
 */
public class UserDAO extends BaseDAO
{

    public List<User> getAllUser()
    {
        try
        {
            List<User> data = new ArrayList<>();
            String sql = "SELECT * FROM dbo.[User]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                User u = new User();
                u.setEmail(rs.getString("email"));
                u.setFullname(rs.getString("fullname"));
                u.setUsername(rs.getString("userid"));
                u.setStatus(rs.getBoolean("status"));
                data.add(u);
            }
            return data;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public User getUser(String username, String password)
    {
        try
        {
            String sql = "SELECT * FROM [dbo].[User] \n"
                    + "WHERE [status] = 1\n"
                    + "AND userid = ?\n"
                    + "AND [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next())
            {
                User u = new User();
                u.setStatus(rs.getBoolean("status"));
                u.setPassword(rs.getString("password"));
                u.setUsername(rs.getString("userid"));
                u.setEmail(rs.getString("email"));
                u.setFullname(rs.getString("fullname"));
                u.setListFeature(getFeature(rs.getString("userid")));
                System.out.println(u.getListFeature().size());
                System.out.println(u.getListFeature().get(0).getUrl());
                return u;
            }
            connection.close();
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public List<Feature> getFeature(String username)
    {
        try
        {
            List<Feature> data = new ArrayList<>();
            String sql = "SELECT f.fid, f.url FROM [dbo].[User] u\n"
                    + "LEFT JOIN dbo.User_Feature uf ON uf.userid = u.userid\n"
                    + "RIGHT JOIN dbo.Feature f ON f.fid = uf.fid\n"
                    + "WHERE u.userid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Feature f = new Feature();
                f.setId(rs.getInt("fid"));
                f.setUrl(rs.getString("url"));
                data.add(f);
            }
            return data;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    public int createAccount(User u)
    {
        try
        {
            String sql = "INSERT dbo.[User]\n"
                    + "        ( userid ,\n"
                    + "          fullname ,\n"
                    + "          email ,\n"
                    + "          [password] ,\n"
                    + "          [status]\n"
                    + "        )\n"
                    + "VALUES  ( ?, -- userid - nvarchar(150)\n"
                    + "          ?, -- fullname - nvarchar(300)\n"
                    + "          ?, -- email - nvarchar(300)\n"
                    + "          ?, -- password - nvarchar(50)\n"
                    + "          1  -- status - bit\n"
                    + "        )";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u.getUsername());
            stm.setString(2, u.getFullname());
            stm.setString(3, u.getEmail());
            stm.setString(4, u.getPassword());
            int rowAffected = stm.executeUpdate();
            return rowAffected;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return 0;
    }

    public void addFeature(String username)
    {
        try
        {
            String sql = "INSERT dbo.User_Feature\n"
                    + "        ( userid, fid )\n"
                    + "VALUES  ( ?, -- userid - nvarchar(150)\n"
                    + "          1  -- fid - int\n"
                    + "          )";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.executeQuery();
        } catch (Exception e)
        {
            System.out.println(e);
        }
    }

    public int manageUser(String username, int option)
    {
        try
        {
            String sql = "UPDATE dbo.[User]\n"
                    + "SET [status] = ? \n"
                    + "WHERE userid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, option);
            stm.setString(2, username);
            int status = stm.executeUpdate();
            return status;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return 0;
    }

    public int changePass(String username, String password)
    {
        try
        {
            String sql = "UPDATE dbo.[User]\n"
                    + "SET password = ?\n"
                    + "WHERE userid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, username);
            int status = stm.executeUpdate();
            return status;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return 0;
    }

    public int changePassWithEmail(String email, String password)
    {
        try
        {
            String sql = "UPDATE dbo.[User]\n"
                    + "SET password = ?\n"
                    + "WHERE email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, email);
            int status = stm.executeUpdate();
            return status;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return 0;
    }

    public boolean isEmailExist(String email)
    {
        try
        {
            String sql = "SELECT * FROM dbo.[User] WHERE email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next())
            {
                return true;
            }
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return false;
    }
}
