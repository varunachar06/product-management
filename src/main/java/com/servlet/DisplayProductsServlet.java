// DisplayProductsServlet.java
package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayProductsServlet")
public class DisplayProductsServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
    }
}
