<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .card {
            background: #fff;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
            max-width: 500px;
            width: 100%;
            animation: fadeIn 0.6s ease;
        }
        h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #34495e;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #dcdde1;
            border-radius: 10px;
            font-size: 1rem;
            transition: border 0.3s;
        }
        input:focus {
            border-color: #6a11cb;
            outline: none;
        }
        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .btn-primary {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
        }
        .btn-primary:hover {
            opacity: 0.9;
        }
        .btn-secondary {
            background: #dfe6e9;
            color: #2d3436;
        }
        .btn-secondary:hover {
            background: #b2bec3;
        }
        .button-row {
            display: flex;
            gap: 12px;
            justify-content: center;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        .message {
            padding: 12px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        .success {
            background: #e0f8ea;
            color: #207044;
        }
        .error {
            background: #fdecea;
            color: #b83b3b;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>🔁 Update Product</h2>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message <%= request.getAttribute("messageType") %>">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <!-- Search Form -->
        <form action="UpdateProductServlet" method="get">
            <div class="form-group">
                <label for="searchProductId">🔍 Enter Product ID</label>
                <input type="number" id="searchProductId" name="productId" placeholder="e.g., 101" required>
            </div>
            <div class="button-row">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>

        <% Product product = (Product) request.getAttribute("product"); %>
        <% if (product != null) { %>
            <form action="UpdateProductServlet" method="post">
                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                <div class="form-group">
                    <label>Product ID</label>
                    <input type="number" value="<%= product.getProductId() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="productName">📝 Product Name</label>
                    <input type="text" id="productName" name="productName" value="<%= product.getProductName() %>" required>
                </div>
                <div class="form-group">
                    <label for="category">📦 Category</label>
                    <input type="text" id="category" name="category" value="<%= product.getCategory() %>" required>
                </div>
                <div class="form-group">
                    <label for="price">💰 Price</label>
                    <input type="number" step="0.01" min="0" id="price" name="price" value="<%= product.getPrice() %>" required>
                </div>
                <div class="form-group">
                    <label for="quantity">🔢 Quantity</label>
                    <input type="number" min="0" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
                </div>
                <div class="button-row">
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </div>
            </form>
        <% } %>

        <div class="button-row">
            <a href="index.jsp" class="btn btn-secondary">← Back to Home</a>
        </div>
    </div>
</body>
</html>
