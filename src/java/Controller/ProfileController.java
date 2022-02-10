/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
@WebServlet(name = "Profile", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {

    
    protected void viewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        if ((request.getSession().getAttribute("authenticated") == null) || !(Boolean)request.getSession().getAttribute("authenticated") ||
                ((Integer)request.getSession().getAttribute("auth_type")) != 1) {
            response.sendRedirect(request.getContextPath() + "/login");
        }
        else {
            request.getRequestDispatcher("View/profile.jsp").forward(request, response);
        }
    }
    
    protected void editProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException, InvalidKeySpecException {
        User user = (User) request.getSession().getAttribute("user");
        
        user.setName(request.getParameter("name"));
        user.setAddress(request.getParameter("address"));
        
        String newPass = request.getParameter("new_password");
        String pass = request.getParameter("password") == null ? "" : request.getParameter("password");
        if (newPass != null) {
            if (!user.comparePassword(pass)) {
                response.sendError(403, "Current password is incorrect");
                return;
            }
            else {
                user.setPassword(newPass);
            }
        }
        
        user.save();
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
            throws ServletException, IOException {
        viewProfile(request, response);
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
            throws ServletException, IOException {
        try {
            editProfile(request, response);
        } catch (SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(500, ex.toString());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
