<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .header {
            font-family:Monotype-corsiva;
            color:red;
            background-color: Aqua;
            margin: 3px 2px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header a{
            background-color: #f39c12;
            padding: 15px 30px;
            color: black;
            text-decoration: none;
            font-size: 18px;
            display:flex;
            border-radius: 5px;
            align-item:center;
        }
        .header a:hover {
            background-color: #e67e22;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
        }
    </style>
</head>
<body>

    <div class="header">
    <h2>want to view details of previous workouts </h2>
    <a href="http://localhost:8082/Fitness/Viewhistory.jsp">View History</a>
    <a href="http://localhost:8082/Fitness/product.jsp">View Healthy Products</a>
    </div>
    <div class="container">
        <h1>Fitness Tracker</h1>
        <form action="process.jsp" method="post">
            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Age:</label>
            <input type="number" name="age" required>

            <label>Gender:</label>
            <select name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>

            <label>Weight (kg):</label>
            <input type="number" name="weight" required>

            <label>Activity Type:</label>
            <select name="activity_type" required>
                <option value="Running">Running</option>
                <option value="Cycling">Cycling</option>"
                <option value="Swimming">Swimming</option>
                <option value="Walking">Walking</option>
            </select>

            <label>Duration (minutes):</label>
            <input type="number" name="duration" required>

            <button type="submit">Calculate Calories Burned</button>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2024 Fitness Tracker. All rights reserved.</p>
    </div>

</body>
</html>
