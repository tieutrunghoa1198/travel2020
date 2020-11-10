/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author songm
 */
public class ChangePassController extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String confirmpass = request.getParameter("confirmpass");

        UserDAO userDB = new UserDAO();
        HttpSession session = request.getSession(true);
        User u = (User) session.getAttribute("user");

        if (u.getPassword().equals(oldpass))
        {
            if (newpass.equals(confirmpass))
            {
                int status = userDB.changePass(u.getUsername(), confirmpass);
                if (status == 0)
                {
                    request.setAttribute("color", "text-warning");
                    request.setAttribute("status", "Cannot change pass.");
                    request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
                } else
                {
                    request.setAttribute("color", "text-success");
                    request.setAttribute("status", "Your password has changed.");
                    request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
                }
            } else
            {
                request.setAttribute("color", "text-warning");
                request.setAttribute("status", "Password not match.");
                request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
            }
        } else
        {
            request.setAttribute("color", "text-danger");
            request.setAttribute("status", "Wrong Password!");
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
