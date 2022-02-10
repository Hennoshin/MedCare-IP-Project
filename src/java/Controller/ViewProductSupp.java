/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author A S U S
 */
@WebServlet(name = "ViewProductSupp", urlPatterns = {"/ViewProductSupp"})
public class ViewProductSupp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void viewProductSupp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String patstr = request.getParameter("search") == null ? "" : request.getParameter("search");
        Pattern pat = Pattern.compile(patstr, Pattern.CASE_INSENSITIVE);
        
        ResultSet products = Product.all();
        
        ArrayList<Product> prods = new ArrayList();
        while (products.next()) {
            Product p = new Product(products);
            Matcher matcher = pat.matcher(p.getProductName());
            if (matcher.find()) {
                prods.add(p);
            }
        }
        
        request.setAttribute("products", prods);
        request.getRequestDispatcher("View/viewProduct.jsp").forward(request, response);
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
            viewProductSupp(request, response);
        } catch (SQLException ex) {
            PrintWriter prn = response.getWriter();
            prn.print(ex);
            Logger.getLogger(ViewProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewProduct.class.getName()).log(Level.SEVERE, null, ex);
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
       // try {
            //addProduct(request, response);
        //} catch (SQLException ex) {
          //  Logger.getLogger(ViewProduct.class.getName()).log(Level.SEVERE, null, ex);
        //} catch (ClassNotFoundException ex) {
          //  Logger.getLogger(ViewProduct.class.getName()).log(Level.SEVERE, null, ex);
        //}
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
