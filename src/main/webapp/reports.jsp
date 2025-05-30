<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reports Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #6a11cb, #2575fc);
            --card-bg: #ffffff;
            --primary: #2563eb;
            --secondary: #6b7280;
            --success: #22c55e;
            --success-dark: #16a34a;
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
            max-width: 900px;
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
            margin-bottom: 12px;
        }

        .description {
            text-align: center;
            font-size: 1rem;
            color: #6b7280;
            margin-bottom: 30px;
        }

        .report-menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .report-item {
            background-color: var(--success);
            color: white;
            padding: 30px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 12px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 14px var(--shadow);
        }

        .report-item:hover {
            background-color: var(--success-dark);
            transform: translateY(-3px);
        }

        .report-item h3 {
            margin: 0 0 10px 0;
            font-size: 1.25rem;
        }

        .report-item p {
            margin: 0;
            font-size: 0.95rem;
            opacity: 0.95;
        }

        .btn-secondary {
            background-color: var(--secondary);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            margin-top: 40px;
            font-size: 15px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-secondary:hover {
            background-color: #4b5563;
            transform: translateY(-1px);
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
            .report-item {
                padding: 20px;
            }

            .btn-secondary {
                width: 100%;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📊 Reports Dashboard</h2>
        <p class="description">Generate various reports for your product inventory.</p>
        
        <div class="report-menu">
            <a href="ReportCriteriaServlet" class="report-item">
                <h3>Custom Reports</h3>
                <p>Generate reports based on specific criteria</p>
            </a>
            <!-- You can add more report items here if needed -->
        </div>
        
        <div style="text-align: center;">
            <a href="index.jsp" class="btn-secondary">🏠 Back to Home</a>
        </div>
    </div>
</body>
</html>
