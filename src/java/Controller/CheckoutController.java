/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Order;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
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
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void checkout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Map<String, Integer> cart = (Map<String, Integer>) request.getSession().getAttribute("cart");
        
        Order order = new Order();
        order.setOrderDate(new Date());
        
        User user = (User) request.getSession().getAttribute("user");
        order.setUserId(user);
        order.setAddress(user.getAddress());
        if (order.save()) {
            for (Map.Entry<String, Integer> pr : cart.entrySet()) {
                order.attachOrderedProduct(pr.getKey(), pr.getValue());
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/");
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
        response.sendRedirect(request.getContextPath() + "/cart");
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
            if ((request.getSession().getAttribute("authenticated") != null) && (boolean)request.getSession().getAttribute("authenticated")) {
                checkout(request, response);
            }
            else {
                response.sendRedirect("View/login.jsp");
            }
        } catch (SQLException ex) {
            response.getWriter().print(ex);
            Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
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
