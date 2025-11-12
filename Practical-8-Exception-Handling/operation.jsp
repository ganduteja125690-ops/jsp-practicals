<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp" %>
<%
    String aStr = request.getParameter("a");
    String bStr = request.getParameter("b");
    String operation = request.getParameter("op");
    
    double a = Double.parseDouble(aStr);
    double b = Double.parseDouble(bStr);
    double result = 0;
    String opSymbol = "";
    String opName = "";
    
    switch(operation) {
        case "add":
            result = a + b;
            opSymbol = "+";
            opName = "Addition";
            break;
        case "subtract":
            result = a - b;
            opSymbol = "-";
            opName = "Subtraction";
            break;
        case "multiply":
            result = a * b;
            opSymbol = "×";
            opName = "Multiplication";
            break;
        case "divide":
            if(b == 0) {
                throw new ArithmeticException("Division by zero is not allowed!");
            }
            result = a / b;
            opSymbol = "÷";
            opName = "Division";
            break;
        default:
            throw new IllegalArgumentException("Invalid operation!");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Result - <%= opName %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
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
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .result-box {
            background-color: #e8f5e9;
            border: 2px solid #4CAF50;
            border-radius: 8px;
            padding: 25px;
            margin: 20px 0;
            text-align: center;
        }
        .calculation {
            font-size: 24px;
            color: #555;
            margin: 15px 0;
        }
        .result {
            font-size: 36px;
            font-weight: bold;
            color: #4CAF50;
            margin: 20px 0;
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
    </style>
</head>
<body>
    <div class="container">
        <h2><%= opName %> Result</h2>
        <div class="result-box">
            <div class="calculation">
                <%= a %> <%= opSymbol %> <%= b %>
            </div>
            <div class="result">
                = <%= result %>
            </div>
        </div>
        <a href="index.jsp" class="back-btn">← Back to Calculator</a>
    </div>
</body>
</html>
