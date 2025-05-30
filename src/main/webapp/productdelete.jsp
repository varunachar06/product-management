<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 50%, #ff4757 100%);
            --warning-gradient: linear-gradient(135deg, #feca57 0%, #ff9ff3 100%);
            --secondary-gradient: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            --glass-bg: rgba(255, 255, 255, 0.1);
            --glass-border: rgba(255, 255, 255, 0.2);
            --text-primary: #2d3748;
            --text-secondary: #4a5568;
            --shadow-light: 0 8px 32px rgba(0, 0, 0, 0.1);
            --shadow-heavy: 0 20px 60px rgba(255, 107, 107, 0.25);
            --danger-shadow: 0 15px 35px rgba(255, 107, 107, 0.4);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 30%, #ff4757 70%, #2d3436 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated warning background */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.03) 1px, transparent 1px);
            background-size: 60px 60px;
            animation: warningFloat 25s ease-in-out infinite;
            z-index: -1;
        }

        @keyframes warningFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0.5; }
            50% { transform: translateY(-30px) rotate(180deg); opacity: 0.8; }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 24px;
            padding: 50px 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: var(--shadow-heavy);
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
            background: var(--danger-gradient);
            border-radius: 24px 24px 0 0;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
        }

        .header-icon {
            width: 90px;
            height: 90px;
            background: var(--danger-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            box-shadow: var(--danger-shadow);
            animation: dangerPulse 2s ease-in-out infinite;
            position: relative;
        }

        .header-icon::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: var(--danger-gradient);
            animation: dangerRipple 2s ease-out infinite;
            z-index: -1;
        }

        .header-icon i {
            font-size: 36px;
            color: white;
            animation: shake 0.5s ease-in-out infinite alternate;
        }

        @keyframes dangerPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.08); }
        }

        @keyframes dangerRipple {
            0% { transform: scale(1); opacity: 1; }
            100% { transform: scale(1.3); opacity: 0; }
        }

        @keyframes shake {
            0% { transform: rotate(-2deg); }
            100% { transform: rotate(2deg); }
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            color: #e74c3c;
            margin-bottom: 8px;
            text-shadow: 0 2px 4px rgba(231, 76, 60, 0.2);
        }

        .subtitle {
            color: var(--text-secondary);
            font-size: 16px;
            font-weight: 400;
            line-height: 1.5;
        }

        .warning-box {
            background: linear-gradient(135deg, rgba(255, 193, 7, 0.1), rgba(255, 87, 34, 0.1));
            border: 2px solid rgba(255, 193, 7, 0.3);
            border-radius: 16px;
            padding: 20px;
            margin: 30px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .warning-box::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -100%;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, transparent, rgba(255,193,7,0.8), transparent);
            animation: warningSlide 2s ease-in-out infinite;
        }

        @keyframes warningSlide {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .warning-text {
            font-weight: 600;
            color: #d68910;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .warning-text i {
            font-size: 18px;
            animation: warningBlink 1.5s ease-in-out infinite;
        }

        @keyframes warningBlink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 12px;
            color: var(--text-primary);
            font-size: 15px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #e74c3c;
            font-size: 18px;
            z-index: 2;
        }

        input[type="number"] {
            width: 100%;
            padding: 18px 18px 18px 55px;
            border: 2px solid transparent;
            border-radius: 14px;
            font-size: 16px;
            font-weight: 500;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            font-family: 'Poppins', sans-serif;
        }

        input:focus {
            outline: none;
            border-color: #e74c3c;
            background: rgba(255, 255, 255, 1);
            box-shadow: 0 8px 25px rgba(231, 76, 60, 0.2);
            transform: translateY(-2px);
        }

        input:focus + i {
            color: #c0392b;
            animation: inputFocus 0.3s ease-out;
        }

        @keyframes inputFocus {
            0% { transform: translateY(-50%) scale(1); }
            50% { transform: translateY(-50%) scale(1.2); }
            100% { transform: translateY(-50%) scale(1); }
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 40px;
        }

        .btn {
            flex: 1;
            padding: 18px 24px;
            border: none;
            border-radius: 14px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-light);
            font-family: 'Poppins', sans-serif;
        }

        .btn-danger {
            background: var(--danger-gradient);
            color: white;
            border: 2px solid transparent;
        }

        .btn-danger:hover {
            transform: translateY(-4px);
            box-shadow: var(--danger-shadow);
            animation: dangerHover 0.3s ease-out;
        }

        @keyframes dangerHover {
            0% { transform: translateY(-4px) scale(1); }
            50% { transform: translateY(-4px) scale(1.02); }
            100% { transform: translateY(-4px) scale(1); }
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.9);
            color: var(--text-primary);
            border: 2px solid rgba(116, 185, 255, 0.3);
        }

        .btn-secondary:hover {
            background: var(--secondary-gradient);
            color: white;
            transform: translateY(-4px);
            box-shadow: 0 15px 35px rgba(116, 185, 255, 0.4);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .message {
            padding: 18px 24px;
            margin-bottom: 30px;
            border-radius: 14px;
            text-align: center;
            font-weight: 500;
            position: relative;
            animation: messageSlide 0.5s ease-out;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        @keyframes messageSlide {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .success {
            background: linear-gradient(135deg, rgba(39, 174, 96, 0.15), rgba(46, 204, 113, 0.15));
            color: #27ae60;
            border: 2px solid rgba(39, 174, 96, 0.4);
        }

        .error {
            background: linear-gradient(135deg, rgba(231, 76, 60, 0.15), rgba(192, 57, 43, 0.15));
            color: #c0392b;
            border: 2px solid rgba(231, 76, 60, 0.4);
        }

        .floating-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .danger-particle {
            position: absolute;
            opacity: 0.1;
            animation: floatDanger 20s ease-in-out infinite;
        }

        .danger-particle:nth-child(1) {
            top: 15%;
            left: 8%;
            width: 6px;
            height: 6px;
            background: #e74c3c;
            border-radius: 50%;
            animation-delay: 0s;
        }

        .danger-particle:nth-child(2) {
            top: 70%;
            right: 12%;
            width: 8px;
            height: 8px;
            background: #f39c12;
            transform: rotate(45deg);
            animation-delay: 7s;
        }

        .danger-particle:nth-child(3) {
            bottom: 25%;
            left: 15%;
            width: 10px;
            height: 10px;
            background: #e67e22;
            border-radius: 30%;
            animation-delay: 14s;
        }

        @keyframes floatDanger {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            25% { transform: translateY(-20px) rotate(90deg); }
            50% { transform: translateY(-10px) rotate(180deg); }
            75% { transform: translateY(-25px) rotate(270deg); }
        }

        /* Confirmation modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.6);
            backdrop-filter: blur(5px);
        }

        .modal-content {
            background: white;
            margin: 15% auto;
            padding: 30px;
            border-radius: 20px;
            width: 90%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            animation: modalSlide 0.3s ease-out;
        }

        @keyframes modalSlide {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .modal-icon {
            font-size: 48px;
            color: #e74c3c;
            margin-bottom: 20px;
        }

        .modal-buttons {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 40px 30px;
                margin: 10px;
            }
            
            .btn-group {
                flex-direction: column;
            }
            
            h2 {
                font-size: 24px;
            }

            .modal-content {
                margin: 25% auto;
                padding: 25px;
            }

            .modal-buttons {
                flex-direction: column;
            }
        }

        /* Loading animation */
        .btn-danger.loading {
            pointer-events: none;
            background: linear-gradient(135deg, #95a5a6, #7f8c8d);
        }

        .btn-danger.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255,255,255,0.3);
            border-top: 2px solid white;
            border-radius: 50%;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: translateY(-50%) rotate(0deg); }
            100% { transform: translateY(-50%) rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="floating-elements">
            <div class="danger-particle"></div>
            <div class="danger-particle"></div>
            <div class="danger-particle"></div>
        </div>
        
        <div class="header">
            <div class="header-icon">
                <i class="fas fa-trash-alt"></i>
            </div>
            <h2>Delete Product</h2>
            <p class="subtitle">Enter the Product ID to permanently remove it from your inventory</p>
        </div>

        <div class="warning-box">
            <div class="warning-text">
                <i class="fas fa-exclamation-triangle"></i>
                This action cannot be undone. Please proceed with caution.
            </div>
        </div>

        <%-- Display messages --%>
        <% if (request.getAttribute("message") != null) { %>
            <div class="message <%= request.getAttribute("messageType") %>">
                <i class="fas fa-<%= "success".equals(request.getAttribute("messageType")) ? "check-circle" : "exclamation-circle" %>"></i>
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <form action="DeleteProductServlet" method="post" id="deleteForm">
            <div class="form-group">
                <label for="productId">Product ID</label>
                <div class="input-wrapper">
                    <input type="number" id="productId" name="productId" required placeholder="Enter ID to delete">
                    <i class="fas fa-hashtag"></i>
                </div>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-danger" id="deleteBtn">
                    <i class="fas fa-trash-alt"></i> Delete Product
                </button>
                <a href="index.jsp" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Home
                </a>
            </div>
        </form>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <div class="modal-icon">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            <h3 style="color: #e74c3c; margin-bottom: 15px;">Confirm Deletion</h3>
            <p style="color: #666; margin-bottom: 25px;">Are you sure you want to delete Product ID <span id="productIdDisplay" style="font-weight: bold; color: #e74c3c;"></span>?</p>
            <p style="color: #999; font-size: 14px; margin-bottom: 25px;">This action is permanent and cannot be undone.</p>
            <div class="modal-buttons">
                <button type="button" class="btn btn-danger" id="confirmDelete">
                    <i class="fas fa-trash"></i> Yes, Delete
                </button>
                <button type="button" class="btn btn-secondary" id="cancelDelete">
                    <i class="fas fa-times"></i> Cancel
                </button>
            </div>
        </div>
    </div>

    <script>
        const deleteBtn = document.getElementById('deleteBtn');
        const confirmModal = document.getElementById('confirmModal');
        const confirmDelete = document.getElementById('confirmDelete');
        const cancelDelete = document.getElementById('cancelDelete');
        const productIdInput = document.getElementById('productId');
        const productIdDisplay = document.getElementById('productIdDisplay');
        const deleteForm = document.getElementById('deleteForm');

        // Show confirmation modal
        deleteBtn.addEventListener('click', function(e) {
            e.preventDefault();
            const productId = productIdInput.value.trim();
            
            if (!productId) {
                productIdInput.focus();
                productIdInput.style.borderColor = '#e74c3c';
                setTimeout(() => {
                    productIdInput.style.borderColor = '';
                }, 2000);
                return;
            }

            productIdDisplay.textContent = productId;
            confirmModal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        });

        // Confirm deletion
        confirmDelete.addEventListener('click', function() {
            confirmModal.style.display = 'none';
            document.body.style.overflow = '';
            
            // Add loading state
            deleteBtn.classList.add('loading');
            deleteBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Deleting...';
            
            // Submit form
            deleteForm.submit();
        });

        // Cancel deletion
        cancelDelete.addEventListener('click', function() {
            confirmModal.style.display = 'none';
            document.body.style.overflow = '';
        });

        // Close modal when clicking outside
        window.addEventListener('click', function(e) {
            if (e.target === confirmModal) {
                confirmModal.style.display = 'none';
                document.body.style.overflow = '';
            }
        });

        // Enhanced input interactions
        productIdInput.addEventListener('focus', function() {
            this.parentElement.parentElement.style.transform = 'translateY(-3px)';
        });
        
        productIdInput.addEventListener('blur', function() {
            this.parentElement.parentElement.style.transform = 'translateY(0)';
        });

        // Add ripple effect to buttons
        document.querySelectorAll('.btn').forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                    background: rgba(255,255,255,0.4);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple 0.6s ease-out;
                    pointer-events: none;
                `;
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Enhanced keyboard support
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && confirmModal.style.display === 'block') {
                confirmModal.style.display = 'none';
                document.body.style.overflow = '';
            }
        });

        // Add ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>