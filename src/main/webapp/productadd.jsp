<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* ==== CSS VARIABLES ==== */
        :root {
            --gradient-primary: linear-gradient(135deg, #667eea, #764ba2);
            --gradient-secondary: linear-gradient(135deg, #f093fb, #f5576c);
            --gradient-success: linear-gradient(135deg, #4facfe, #00f2fe);
            --bg-glass: rgba(255, 255, 255, 0.1);
            --border-glass: rgba(255, 255, 255, 0.2);
            --text-dark: #2d3748;
            --text-gray: #4a5568;
            --shadow-light: 0 8px 32px rgba(0, 0, 0, 0.1);
            --shadow-heavy: 0 20px 60px rgba(0, 0, 0, 0.15);
        }

        /* ==== RESET ==== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2, #f093fb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            overflow-x: hidden;
            position: relative;
        }

        /* ==== BACKGROUND ANIMATION ==== */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: floatBackground 20s ease-in-out infinite;
            z-index: -1;
        }

        @keyframes floatBackground {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        /* ==== CONTAINER ==== */
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 24px;
            padding: 50px 40px;
            max-width: 480px;
            width: 100%;
            backdrop-filter: blur(20px);
            box-shadow: var(--shadow-heavy);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-primary);
            border-radius: 24px 24px 0 0;
        }

        /* ==== HEADER ==== */
        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header-icon {
            width: 80px;
            height: 80px;
            background: var(--gradient-primary);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px;
            animation: pulse 2s infinite;
            box-shadow: var(--shadow-light);
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .header-icon i {
            color: white;
            font-size: 32px;
        }

        h2 {
            font-size: 28px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 8px;
        }

        .subtitle {
            color: var(--text-gray);
            font-size: 16px;
            font-weight: 300;
        }

        /* ==== FORM ==== */
        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            font-weight: 500;
            color: var(--text-dark);
            font-size: 14px;
            display: block;
            margin-bottom: 8px;
            text-transform: uppercase;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 16px 16px 16px 50px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.8);
            font-size: 16px;
            border: 2px solid transparent;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: #667eea;
            background: #fff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.15);
        }

        /* ==== BUTTONS ==== */
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 40px;
        }

        .btn {
            flex: 1;
            padding: 16px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            border: none;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: var(--gradient-primary);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: white;
            border: 2px solid rgba(102, 126, 234, 0.2);
            color: var(--text-dark);
        }

        .btn-secondary:hover {
            background: #fff;
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        /* ==== MESSAGES ==== */
        .message {
            padding: 16px 20px;
            margin-bottom: 30px;
            border-radius: 12px;
            text-align: center;
            font-weight: 500;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .success {
            background: rgba(16, 185, 129, 0.1);
            color: #065f46;
            border: 2px solid rgba(16, 185, 129, 0.3);
        }

        .error {
            background: rgba(239, 68, 68, 0.1);
            color: #991b1b;
            border: 2px solid rgba(239, 68, 68, 0.3);
        }

        /* ==== RESPONSIVE ==== */
        @media (max-width: 600px) {
            .container { padding: 40px 30px; }
            .btn-group { flex-direction: column; }
            h2 { font-size: 24px; }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="header-icon">
            <i class="fas fa-plus"></i>
        </div>
        <h2>Add New Product</h2>
        <p class="subtitle">Fill in the details to add a new product</p>
    </div>

    <%-- Feedback Message --%>
    <% if (request.getAttribute("message") != null) { %>
        <div class="message <%= request.getAttribute("messageType") %>">
            <i class="fas fa-<%= "success".equals(request.getAttribute("messageType")) ? "check-circle" : "exclamation-triangle" %>"></i>
            <%= request.getAttribute("message") %>
        </div>
    <% } %>

    <form action="AddProductServlet" method="post" id="productForm">
        <div class="form-group">
            <label for="productId">Product ID</label>
            <div class="input-wrapper">
                <i class="fas fa-hashtag"></i>
                <input type="number" id="productId" name="productId" required>
            </div>
        </div>

        <div class="form-group">
            <label for="productName">Product Name</label>
            <div class="input-wrapper">
                <i class="fas fa-box"></i>
                <input type="text" id="productName" name="productName" required>
            </div>
        </div>

        <div class="form-group">
            <label for="category">Category</label>
            <div class="input-wrapper">
                <i class="fas fa-tags"></i>
                <input type="text" id="category" name="category" required>
            </div>
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <div class="input-wrapper">
                <i class="fas fa-dollar-sign"></i>
                <input type="number" step="0.01" min="0" id="price" name="price" required>
            </div>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <div class="input-wrapper">
                <i class="fas fa-cubes"></i>
                <input type="number" id="quantity" name="quantity" min="0" required>
            </div>
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-primary" id="submitBtn">
                <i class="fas fa-plus-circle"></i> Add Product
            </button>
            <a href="index.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </form>
</div>

<script>
    // Submit animation
    document.getElementById('productForm').addEventListener('submit', function () {
        const btn = document.getElementById('submitBtn');
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Adding Product...';
        btn.classList.add('loading');
    });
</script>
</body>
</html>
