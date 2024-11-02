<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    // Retrieve form data
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    float weight = Float.parseFloat(request.getParameter("weight"));
    String activityType = request.getParameter("activity_type");
    int duration = Integer.parseInt(request.getParameter("duration"));

    // Validate input
    if (age <= 0 || weight <= 0 || duration <= 0) {
        out.println("<h2>Please enter valid positive values for age, weight, and duration.</h2>");
        return;
    }

    // Calculate calories burned based on activity type (MET value)
    float caloriesBurned = 0;
    switch(activityType) {
        case "Running":
            caloriesBurned = 0.0175f * 8 * weight * duration; // MET value for running
            break;
        case "Cycling":
            caloriesBurned = 0.0175f * 6 * weight * duration; // MET value for cycling
            break;
        case "Swimming":
            caloriesBurned = 0.0175f * 9.8f * weight * duration; // MET value for swimming
            break;
        case "Walking":
            caloriesBurned = 0.0175f * 3.8f * weight * duration; // MET value for walking
            break;
    }

    // Format the calories burned to 2 decimal places
    DecimalFormat df = new DecimalFormat("0.00");
    String caloriesBurnedFormatted = df.format(caloriesBurned);

    // Database connection settings
    String url = "jdbc:mysql://localhost:3306/fitness_tracker";
    String user = "root";  // Use your MySQL username
    String password = "Pubali@2004";  // Use your MySQL password

    try {
        // Load the MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        Connection conn = DriverManager.getConnection(url, user, password);

        // SQL query to insert the activity data including calories burned
        String sql = "INSERT INTO user_activity (name, age, gender, weight, activity_type, duration, calories_burned) VALUES (?, ?, ?, ?, ?, ?, ?)";

        // Create a PreparedStatement to prevent SQL injection and set the values
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, gender);
        ps.setFloat(4, weight);
        ps.setString(5, activityType);
        ps.setInt(6, duration);
        ps.setFloat(7, caloriesBurned); // Add calories burned to the query

        // Execute the query to insert the data into the database
        int result = ps.executeUpdate();
        
        // Check if the data was inserted successfully and provide feedback
        if(result > 0) {
            out.println("<h2>Activity saved successfully!</h2>");
            out.println("<p>You burned approximately " + caloriesBurnedFormatted + " calories from " + duration + " minutes of " + activityType + ".</p>");
        } else {
            out.println("<h2>Error saving activity!</h2>");
        }

        // Close resources
        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("<h2>An error occurred: " + e.getMessage() + "</h2>");
        e.printStackTrace(); // Optional: log the error to a file
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calories Burned</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: #28a745;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
      <a href = 'index.jsp'>track another activity</a> 
    </div>
</body>
</html>
