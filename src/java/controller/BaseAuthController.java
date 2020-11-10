/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Feature;
import entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author songm
 */
public abstract class BaseAuthController extends HttpServlet
{

    private boolean isAccessGranted(HttpServletRequest request)
    {
        HttpSession session = request.getSession(true);
        User account = (User) session.getAttribute("user");
        if (account == null)
        {
            return false;
        } else
        {
            String url = request.getServletPath();
            for (Feature feature : account.getListFeature())
            {
                if (feature.getUrl().equals(url))
                {
                    System.out.println(feature.getUrl());
                    return true;
                }
            }
            return false;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (isAccessGranted(req))
        {
            processGet(req, resp);
        } else
        {
            System.out.println("admin base get");
            resp.sendRedirect("/Travel/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (isAccessGranted(req))
        {
            processPost(req, resp);
        } else
        {
            System.out.println("admin base post");
            resp.sendRedirect("/Travel/home");
        }
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
}
