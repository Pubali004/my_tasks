<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: silver;
        }
        form {
            width: 50%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .message {
            text-align: center;
            margin-top: 20px;
        }
    </style>
<body>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String dbURL = "jdbc:mysql://localhost:3306/fitness_tracker"; 
    String dbUser = "root"; 
    String dbPassword = "Pubali@2004"; 
    String userId = request.getParameter("userId");
    String name = "";
    String activity_type = "";
    String calories_burned = "";
    String message = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Update user details
            name = request.getParameter("name");
            activity_type = request.getParameter("activity_type");
            calories_burned = request.getParameter("calories_burned");

            String updateSQL = "UPDATE user_activity SET name=?, activity_type=?, calories_burned=? WHERE id=?";
            pstmt = conn.prepareStatement(updateSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, activity_type);
            pstmt.setString(3, calories_burned);
            pstmt.setInt(4, Integer.parseInt(userId));

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                message = "User updated successfully!";
            } else {
                message = "Update failed!";
            }
        } else {
            // Retrieve the user details for the initial form display
            String fetchSQL = "SELECT name, activity_type, calories_burned FROM user_activity WHERE id=?";
            pstmt = conn.prepareStatement(fetchSQL);
            pstmt.setInt(1, Integer.parseInt(userId));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                activity_type = rs.getString("activity_type");
                calories_burned = rs.getString("calories_burned");
            } else {
                message = "User not found.";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "An error occurred: " + e.getMessage();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<h2>Update User</h2>

<% if (!message.isEmpty()) { %>
    <p><%= message %></p>
<% } %>

<form method="post" action="updateUser.jsp?userId=<%= userId %>">
    <label for="name">Username:</label>
    <input type="text" name="name" id="name" value="<%= name %>" required><br>

    <label for="activity_type">Activity Type:</label>
    <input type="text" name="activity_type" id="activity_type" value="<%= activity_type %>" required><br>

    <label for="calories_burned">Calories Burned:</label>
    <input type="text" name="calories_burned" id="calories_burned" value="<%= calories_burned %>" required><br>

    <button type="submit">Update</button>
</form>

<!-- Link back to user list -->
<a href="Viewhistory.jsp">Back to User List</a>

</body>
</html>
