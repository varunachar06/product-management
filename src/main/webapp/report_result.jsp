<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #6a11cb, #2575fc);
            --card-bg: #ffffff;
            --primary: #2563eb;
            --secondary: #6b7280;
            --hover: #f3f4f6;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 40px 20px;
            font-family: 'Inter', sans-serif;
            background: var(--bg-gradient);
            display: flex;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            background: var(--card-bg);
            width: 100%;
            max-width: 1100px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 32px var(--shadow);
            animation: fadeIn 0.6s ease;
        }

        h2 {
            text-align: center;
            color: #1f2937;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .report-title {
            text-align: center;
            font-style: italic;
            font-size: 1.1rem;
            color: #4b5563;
            margin-bottom: 30px;
        }

        .summary {
            background-color: #f1f5f9;
            padding: 16px;
            border-radius: 8px;
            text-align: center;
            font-weight: 600;
            color: #374151;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }

        th {
            background-color: #f9fafb;
            color: #1f2937;
            font-weight: 600;
        }

        tr:hover {
            background-color: var(--hover);
        }

        .no-results {
            text-align: center;
            font-style: italic;
            color: #6b7280;
            padding: 40px 0;
        }

        .actions {
            text-align: center;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            margin: 0 10px 10px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: #1d4ed8;
        }

        .btn-secondary {
            background-color: var(--secondary);
            color: white;
        }

        .btn-secondary:hover {
            background-color: #4b5563;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 600px) {
            table th, table td {
                padding: 10px;
            }

            .btn {
                width: 100%;
                margin-bottom: 10px;
            }

            .actions {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📈 Report Results</h2>
        <div class="report-title"><%= request.getAttribute("reportTitle") %></div>

        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
        %>
            <div class="summary">
                Total Results: <%= products.size() %> product(s)
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : products) { %>
                        <tr>
                            <td><%= product.getProductId() %></td>
                            <td><%= product.getProductName() %></td>
                            <td><%= product.getCategory() %></td>
                            <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                            <td><%= product.getQuantity() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="no-results">No products found matching the specified criteria.</div>
        <% } %>

        <div class="actions">
            <a href="ReportCriteriaServlet" class="btn btn-primary">🔁 Generate Another Report</a>
            <a href="index.jsp" class="btn btn-secondary">🏠 Back to Home</a>
        </div>
    </div>
</body>
</html>
