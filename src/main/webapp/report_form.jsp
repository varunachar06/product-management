<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate Report</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #6a11cb, #2575fc);
            --card-bg: #ffffff;
            --primary: #2563eb;
            --secondary: #6b7280;
            --danger-bg: #f8d7da;
            --danger-text: #721c24;
            --danger-border: #f5c6cb;
            --hover: #f3f4f6;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            background: var(--bg-gradient);
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 600px;
            background-color: var(--card-bg);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 32px var(--shadow);
            animation: fadeIn 0.6s ease;
        }

        h2 {
            text-align: center;
            color: #1f2937;
            margin-bottom: 30px;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #374151;
        }

        select,
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
            background-color: #f9fafb;
            transition: border 0.3s;
        }

        select:focus,
        input:focus {
            border-color: var(--primary);
            outline: none;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
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

        .criteria-section {
            display: none;
            background-color: #f9fafb;
            padding: 20px;
            border-radius: 10px;
            margin-top: 10px;
            border: 1px solid #e5e7eb;
            transition: all 0.3s ease;
        }

        .message {
            padding: 16px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
            font-size: 0.95rem;
        }

        .error {
            background-color: var(--danger-bg);
            color: var(--danger-text);
            border: 1px solid var(--danger-border);
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

        @media (max-width: 500px) {
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
    <script>
        function showCriteria() {
            const reportType = document.getElementById('reportType').value;
            const sections = document.querySelectorAll('.criteria-section');
            sections.forEach(section => section.style.display = 'none');
            
            if (reportType) {
                const section = document.getElementById(reportType + 'Section');
                if (section) {
                    section.style.display = 'block';
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>📊 Generate Report</h2>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message <%= request.getAttribute("messageType") %>">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <form action="ReportServlet" method="post">
            <div class="form-group">
                <label for="reportType">Select Report Type:</label>
                <select id="reportType" name="reportType" onchange="showCriteria()" required>
                    <option value="">-- Select Report Type --</option>
                    <option value="priceGreater">Products with Price Greater Than</option>
                    <option value="category">Products by Category</option>
                    <option value="topProducts">Top Products by Quantity</option>
                </select>
            </div>

            <!-- Price Greater Than -->
            <div id="priceGreaterSection" class="criteria-section">
                <div class="form-group">
                    <label for="price">Minimum Price:</label>
                    <input type="number" id="price" name="price" step="0.01" min="0" placeholder="Enter minimum price">
                </div>
            </div>

            <!-- Category -->
            <div id="categorySection" class="criteria-section">
                <div class="form-group">
                    <label for="category">Category:</label>
                    <input type="text" id="category" name="category" placeholder="Enter category name">
                </div>
            </div>

            <!-- Top Products -->
            <div id="topProductsSection" class="criteria-section">
                <div class="form-group">
                    <label for="limit">Number of Top Products:</label>
                    <input type="number" id="limit" name="limit" min="1" max="100" placeholder="Enter number of top products">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Generate Report</button>
            <a href="index.jsp" class="btn btn-secondary">← Back to Home</a>
        </form>
    </div>
</body>
</html>
