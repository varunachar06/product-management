<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
        }

        /* Sidebar */
        .sidebar {
            width: 200px;
            background-color: #333;
            color: white;
            height: 100vh;
            padding: 20px 0;
        }

        .sidebar .logo {
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #444;
        }

        /* Main content */
        .main {
            flex: 1;
        }

        .header {
            background-color: white;
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
            font-size: 18px;
            font-weight: bold;
        }

        .content {
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
        }

        .card {
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            text-align: center;
            border-radius: 4px;
        }

        .card i {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .card h3 {
            margin: 10px 0 5px;
            font-size: 16px;
        }

        .card p {
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">PMS</div>
        <a href="productadd.jsp"><i class="fa fa-plus"></i> Add Product</a>
        <a href="UpdateProductServlet"><i class="fa fa-edit"></i> Update Product</a>
        <a href="productdelete.jsp"><i class="fa fa-trash"></i> Delete Product</a>
        <a href="DisplayProductsServlet"><i class="fa fa-table"></i> View Products</a>
        <a href="ReportCriteriaServlet"><i class="fa fa-chart-bar"></i> Reports</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <div class="header">Product Management System</div>
        <div class="content">
            <a class="card" href="productadd.jsp">
                <i class="fa fa-plus"></i>
                <h3>Add Product</h3>
                <p>Add new items to inventory.</p>
            </a>
            <a class="card" href="UpdateProductServlet">
                <i class="fa fa-edit"></i>
                <h3>Update Product</h3>
                <p>Change existing product info.</p>
            </a>
            <a class="card" href="productdelete.jsp">
                <i class="fa fa-trash"></i>
                <h3>Delete Product</h3>
                <p>Remove items from system.</p>
            </a>
            <a class="card" href="DisplayProductsServlet">
                <i class="fa fa-table"></i>
                <h3>View Products</h3>
                <p>List all available items.</p>
            </a>
            <a class="card" href="ReportCriteriaServlet">
                <i class="fa fa-chart-bar"></i>
                <h3>Reports</h3>
                <p>Generate inventory reports.</p>
            </a>
        </div>
    </div>

</body>
</html>
