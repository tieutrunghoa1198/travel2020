/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import entity.EmailUtility;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import entity.*;

/**
 *
 * @author songm
 */
public class SendMailController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String recipent = request.getParameter("email");
        String subject = "VitR Change Password";
        String newPass = Captcha.generate();

        UserDAO db = new UserDAO();

        if (db.isEmailExist(recipent))
        {
            try
            {
                EmailUtility.sendEmail(recipent, subject, newPass);
                db.changePassWithEmail(recipent, newPass);
                request.setAttribute("msg", "Your password has been reset! Please check your mailbox.");
                request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
            } catch (Exception e)
            {
                e.printStackTrace();
                request.setAttribute("msg", "There was an error! Cannot reset password");
            }
        } else
        {
            request.setAttribute("msg", "Oh, this email hasn't been registerd yet!");
            request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
