/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author songm
 */
public class LoginController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getRequestDispatcher("Login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDAO userDB = new UserDAO();
        User u = userDB.getUser(username, password);
        if (u == null)
        {
            req.setAttribute("loginErr", "Login failed!");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        } else
        {
            for (Feature f : u.getListFeature())
            {
                if (f.getUrl().equalsIgnoreCase("/admin"))
                {
                    HttpSession session = req.getSession(true);
                    session.setAttribute("role", "admin");
                    session.setAttribute("user", u);
                    resp.sendRedirect("/Travel/admin");
                    System.out.println("oce at login controller");
                    return;
                }
            }
            HttpSession session = req.getSession(true);
            session.setAttribute("role", "user");
            session.setAttribute("user", u);
            resp.sendRedirect("/Travel/home");
            System.out.println("oce at login controller");
        }
    }

}
