<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Data</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: whitesmoke;
        }
        table {
            width: 80%;
            background:white;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 3px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: skyblue;
            color: black;
        }
        .action-btn {
            color: white;
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 18px;
            padding: 5px;
        }
        .delete-icon {
            color: red;
        }
        .update-icon {
            color: green;
        }
        .action-btn:hover .delete-icon {
            color: darkred;
        }
        .action-btn:hover .update-icon {
            color: darkgreen;
        }
        form.filter-form {
            text-align: center;
            margin: 20px;
            padding:8px;
            border-radius:2px solid black;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">User History</h2>


<form class="filter-form" method="get" action="">
    <label for="filterText">Filter by Username or Full Name:</label>
    <input type="text" id="filterText" name="filterText" value="<%= request.getParameter("filterText") != null ? request.getParameter("filterText") : "" %>">
    <button type="submit">Filter</button>
</form>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String dbURL = "jdbc:mysql://localhost:3306/fitness_tracker"; 
    String dbUser = "root"; 
    String dbPassword = "Pubali@2004"; 

    
    String filterText = request.getParameter("filterText") != null ? request.getParameter("filterText") : "";

    try {
        
        Class.forName("com.mysql.cj.jdbc.Driver");

        
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Create the SQL query with filtering by username or fullname
        String sql = "SELECT id, name, activity_type,calories_burned FROM user_activity WHERE name LIKE ? OR activity_type LIKE ? OR calories_burned LIKE ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + filterText + "%");
        pstmt.setString(2, "%" + filterText + "%");
        pstmt.setString(3, "%" + filterText + "%");

        // Execute the query
        rs = pstmt.executeQuery();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Activities</th>
        <th>Calories</th>
        <th>Action</th>
    </tr>

    <%
        // Loop through the result set and display the data in a table
        while (rs.next()) {
            int id = rs.getInt("id");
            String username = rs.getString("name");
            String activity_type = rs.getString("activity_type");
            String calories_burned = rs.getString("calories_burned");
    %>
    <tr>
        <td><%= id %></td>
        <td><%= username %></td>
        <td><%= activity_type %></td>
        <td><%= calories_burned %></td>
        <td>
            <!-- Delete Icon -->
            <form action="deleteUser.jsp" method="post" style="display: inline;">
                <input type="hidden" name="userId" value="<%= id %>">
                <button type="submit" class="action-btn">
                    <i class="fas fa-trash delete-icon"></i>
                </button>
            </form>
            <!-- Update Icon -->
            <form action="updateUser.jsp" method="get" style="display: inline;">
                <input type="hidden" name="userId" value="<%= id %>">
                <button type="submit" class="action-btn">
                    <i class="fas fa-edit update-icon"></i>
                </button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
