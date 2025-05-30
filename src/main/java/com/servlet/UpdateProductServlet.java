// UpdateProductServlet.java
package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productIdStr = request.getParameter("productId");
        if (productIdStr != null) {
            try {
                int productId = Integer.parseInt(productIdStr);
                Product product = productDAO.getProductById(productId);
                request.setAttribute("product", product);
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Product ID!");
                request.setAttribute("messageType", "error");
            }
        }
        
        request.getRequestDispatcher("productupdate.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            Product product = new Product(productId, productName, category, price, quantity);
            
            if (productDAO.updateProduct(product)) {
                request.setAttribute("message", "Product updated successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to update product!");
                request.setAttribute("messageType", "error");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid input data!");
            request.setAttribute("messageType", "error");
        }
        
        request.getRequestDispatcher("productupdate.jsp").forward(request, response);
    }
}