<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Inventory</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #6a11cb, #2575fc);
            --card-bg: #ffffff;
            --primary: #2563eb;
            --secondary: #6b7280;
            --hover: #f3f4f6;
            --danger-bg: #fef2f2;
            --danger-text: #991b1b;
            --danger-border: #fecaca;
            --shadow: rgba(0, 0, 0, 0.1);
            --border: #e5e7eb;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: var(--bg-gradient);
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            max-width: 1100px;
            width: 100%;
            background-color: var(--card-bg);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 12px 32px var(--shadow);
            animation: fadeIn 0.6s ease;
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid var(--border);
            font-size: 0.95rem;
        }

        th {
            background-color: var(--hover);
            color: #374151;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f9fafb;
        }

        .btn {
            display: inline-block;
            padding: 10px 16px;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background-color: var(--secondary);
            color: white;
        }

        .btn-secondary:hover {
            background-color: #4b5563;
            transform: translateY(-1px);
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        td .btn {
            padding: 6px 12px;
            font-size: 13px;
        }

        .no-products {
            text-align: center;
            background-color: var(--danger-bg);
            color: var(--danger-text);
            padding: 16px;
            border: 1px solid var(--danger-border);
            border-radius: 10px;
            font-style: italic;
            margin-bottom: 30px;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            td {
                position: relative;
                padding-left: 50%;
                margin-bottom: 12px;
                border-bottom: 1px solid var(--border);
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 16px;
                top: 50%;
                transform: translateY(-50%);
                font-weight: 600;
                color: #6b7280;
            }
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
    </style>
</head>
<body>
    <div class="container">
        <h2>📦 Product Inventory</h2>

        <% 
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) { 
        %>
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : products) { %>
                    <tr>
                        <td data-label="Product ID"><%= product.getProductId() %></td>
                        <td data-label="Product Name"><%= product.getProductName() %></td>
                        <td data-label="Category"><%= product.getCategory() %></td>
                        <td data-label="Price">$<%= String.format("%.2f", product.getPrice()) %></td>
                        <td data-label="Quantity"><%= product.getQuantity() %></td>
                        <td data-label="Actions">
                            <a href="UpdateProductServlet?productId=<%= product.getProductId() %>" class="btn btn-primary">Edit</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="no-products">No products found in inventory.</div>
        <% } %>

        <div class="actions">
            <a href="index.jsp" class="btn btn-secondary">← Back to Home</a>
            <a href="productadd.jsp" class="btn btn-primary">＋ Add New Product</a>
        </div>
    </div>
</body>
</html>
