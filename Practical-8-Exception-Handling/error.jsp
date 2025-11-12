<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error - Exception Occurred</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #d32f2f;
            text-align: center;
            margin-bottom: 20px;
        }
        .error-icon {
            text-align: center;
            font-size: 60px;
            color: #d32f2f;
            margin-bottom: 20px;
        }
        .error-box {
            background-color: #ffebee;
            border: 2px solid #ef5350;
            border-radius: 8px;
            padding: 25px;
            margin: 20px 0;
        }
        .error-type {
            font-weight: bold;
            color: #c62828;
            margin-bottom: 10px;
            font-size: 18px;
        }
        .error-message {
            color: #d32f2f;
            font-size: 16px;
            margin: 15px 0;
            padding: 15px;
            background-color: #fff;
            border-left: 4px solid #d32f2f;
        }
        .error-details {
            margin-top: 20px;
            padding: 15px;
            background-color: #fff3e0;
            border-radius: 5px;
            font-size: 14px;
            color: #555;
        }
        .back-btn {
            display: block;
            width: 200px;
            margin: 20px auto 0;
            padding: 12px;
            background-color: #2196F3;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .back-btn:hover {
            background-color: #1976D2;
        }
        .help-text {
            text-align: center;
            color: #757575;
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-icon">⚠️</div>
        <h2>Oops! An Error Occurred</h2>
        
        <div class="error-box">
            <div class="error-type">
                Error Type: <%= exception.getClass().getSimpleName() %>
            </div>
            
            <div class="error-message">
                <strong>Message:</strong><br>
                <%= exception.getMessage() != null ? exception.getMessage() : "An unexpected error occurred" %>
            </div>
            
            <div class="error-details">
                <strong>Common Causes:</strong>
                <ul style="margin: 10px 0; padding-left: 20px;">
                    <% if(exception instanceof NumberFormatException) { %>
                        <li>You entered text instead of numbers</li>
                        <li>Invalid number format (e.g., special characters)</li>
                        <li>Empty input fields</li>
                    <% } else if(exception instanceof ArithmeticException) { %>
                        <li>Division by zero is mathematically undefined</li>
                        <li>Please use a non-zero divisor</li>
                    <% } else { %>
                        <li>Invalid input provided</li>
                        <li>Operation not supported</li>
                        <li>Server error</li>
                    <% } %>
                </ul>
            </div>
        </div>
        
        <div class="help-text">
            Please check your input and try again
        </div>
        
        <a href="index.jsp" class="back-btn">← Back to Calculator</a>
    </div>
</body>
</html>
