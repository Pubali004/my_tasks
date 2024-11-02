<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            text-align: center;
            padding: 50px;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h2 {
            color: #333;
        }
        .message {
            font-size: 18px;
            padding: 10px;
            color: #fff;
            margin-top: 20px;
            border-radius: 5px;
        }
        .success {
            background-color: #28a745;
        }
        .error {
            background-color: #dc3545;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Delete User</h2>

    <%
        // Initialize variables for database connection and messages
        Connection conn = null;
        PreparedStatement pstmt = null;
        String dbURL = "jdbc:mysql://localhost:3306/fitness_tracker"; 
        String dbUser = "root"; 
        String dbPassword = "Pubali@2004"; 
        String message = "";
        String messageClass = "error";

        // Get the user ID from the request parameter
        String userId = request.getParameter("userId");

        // Check if userId is valid
        if (userId != null && !userId.isEmpty()) {
            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish database connection
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Prepare SQL statement to delete user by ID
                String deleteSQL = "DELETE FROM user_activity WHERE id=?";
                pstmt = conn.prepareStatement(deleteSQL);
                pstmt.setInt(1, Integer.parseInt(userId));

                // Execute delete statement
                int rowsDeleted = pstmt.executeUpdate();
                if (rowsDeleted > 0) {
                    message = "User deleted successfully!";
                    messageClass = "success";
                } else {
                    message = "User not found or could not be deleted.";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                message = "SQL Error: " + e.getMessage();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                message = "Database Driver not found!";
            } finally {
                // Close resources
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        } else {
            message = "Invalid user ID.";
        }
    %>

    <!-- Display success or error message -->
    <div class="message <%= messageClass %>"><%= message %></div>

    <!-- Link to go back to the main user data page -->
    <a href="Viewhistory.jsp">Back to User List</a>
</div>

</body>
</html>
