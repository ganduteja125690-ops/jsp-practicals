<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Arithmetic Operations with Exception Handling</title>
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
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: 20px;
        }
        button {
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        button[name="op"][value="add"] {
            background-color: #4CAF50;
            color: white;
        }
        button[name="op"][value="subtract"] {
            background-color: #2196F3;
            color: white;
        }
        button[name="op"][value="multiply"] {
            background-color: #FF9800;
            color: white;
        }
        button[name="op"][value="divide"] {
            background-color: #f44336;
            color: white;
        }
        button:hover {
            opacity: 0.8;
        }
        label {
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Arithmetic Calculator</h2>
        <form action="operation.jsp" method="post">
            <label for="a">Number A:</label>
            <input type="text" name="a" id="a" required placeholder="Enter first number">
            
            <label for="b">Number B:</label>
            <input type="text" name="b" id="b" required placeholder="Enter second number">
            
            <div class="buttons">
                <button type="submit" name="op" value="add">Addition (+)</button>
                <button type="submit" name="op" value="subtract">Subtraction (-)</button>
                <button type="submit" name="op" value="multiply">Multiplication (×)</button>
                <button type="submit" name="op" value="divide">Division (÷)</button>
            </div>
        </form>
    </div>
</body>
</html>
