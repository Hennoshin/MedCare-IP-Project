/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
@WebServlet(name = "OrderController", urlPatterns = {"/order", "/cart"})
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void viewCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Map<String, Integer> cart;
        ArrayList<Product> products = new ArrayList();
        ArrayList<Integer> qty = new ArrayList();
        cart = (HashMap<String, Integer>)request.getSession().getAttribute("cart");
        
        if (cart != null) {
            for (Map.Entry<String, Integer> c : cart.entrySet()) {
                products.add(Product.find(c.getKey()));
                qty.add(c.getValue());
            }
        }
        
        request.setAttribute("products", products);
        request.setAttribute("quantity", qty);
        
        request.getRequestDispatcher("View/cart.jsp").forward(request, response);
    }
    
    protected void editCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Map<String, Integer> cart = new HashMap();
        
        int counter = 0;
        if (request.getParameterValues("id[]") != null) {
            for (String id : request.getParameterValues("id[]")) {
                cart.put(id, Integer.parseInt(request.getParameterValues("quantity[]")[counter]));
                counter++;
            }
        }
        
        request.getSession().setAttribute("cart", cart);
        
        // Redirect for POST/Redirect/GET with 303 code
        response.setStatus(303);
        response.setHeader("Location", request.getRequestURL().toString());
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
        try {
            viewCart(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            editCart(request, response);
        } catch (SQLException ex) {
            PrintWriter pr = response.getWriter();
            pr.print(ex);
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
