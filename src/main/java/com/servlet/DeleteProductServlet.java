// DeleteProductServlet.java
package com.servlet;

import com.dao.ProductDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            if (productDAO.deleteProduct(productId)) {
                request.setAttribute("message", "Product deleted successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to delete product or product not found!");
                request.setAttribute("messageType", "error");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Product ID!");
            request.setAttribute("messageType", "error");
        }
        
        request.getRequestDispatcher("productdelete.jsp").forward(request, response);
    }
}