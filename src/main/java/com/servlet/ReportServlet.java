// ReportServlet.java
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

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String reportType = request.getParameter("reportType");
        List<Product> products = null;
        String reportTitle = "";
        
        try {
            switch (reportType) {
                case "priceGreater":
                    double price = Double.parseDouble(request.getParameter("price"));
                    products = productDAO.getProductsByPriceGreaterThan(price);
                    reportTitle = "Products with price greater than $" + price;
                    break;
                    
                case "category":
                    String category = request.getParameter("category");
                    products = productDAO.getProductsByCategory(category);
                    reportTitle = "Products in category: " + category;
                    break;
                    
                case "topProducts":
                    int limit = Integer.parseInt(request.getParameter("limit"));
                    products = productDAO.getTopProductsByQuantity(limit);
                    reportTitle = "Top " + limit + " products by quantity";
                    break;
                    
                default:
                    request.setAttribute("message", "Invalid report type!");
                    request.setAttribute("messageType", "error");
                    request.getRequestDispatcher("report_form.jsp").forward(request, response);
                    return;
            }
            
            request.setAttribute("products", products);
            request.setAttribute("reportTitle", reportTitle);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid input data!");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
        }
    }
}
