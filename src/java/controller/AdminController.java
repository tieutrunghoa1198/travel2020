/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import entity.*;

/**
 *
 * @author songm
 */
public class AdminController extends BaseAuthController
{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // get all current account
        UserDAO userDB = new UserDAO();
        List<User> users = userDB.getAllUser();
        request.setAttribute("users", users);
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

}
