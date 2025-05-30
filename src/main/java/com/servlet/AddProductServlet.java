// AddProductServlet.java
package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            Product product = new Product(productId, productName, category, price, quantity);
            
            if (productDAO.addProduct(product)) {
                request.setAttribute("message", "Product added successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to add product!");
                request.setAttribute("messageType", "error");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid input data!");
            request.setAttribute("messageType", "error");
        }
        
        request.getRequestDispatcher("productadd.jsp").forward(request, response);
    }
}