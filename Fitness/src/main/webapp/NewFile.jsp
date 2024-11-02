<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
    <style>
       
        body {
            font-family: algerian, sans-serif;
            background-color: skyblue;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .register-container {
            width: 800px;
            background-color: whitesmoke;
            padding: 20px;
            box-shadow: 0 5px 8px rgba(0, 0, 0, 0.43);
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: nowrap;
        }

        .form-section {
            width: 60%;
            padding-right: 20px;
        }

        .form-section h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .input-container .icon {
            width: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #888;
            font-size: 20px;
        }

        .form-section input[type="text"],
        .form-section input[type="password"] {
            width: calc(100% - 40px);
            padding: 10px;
            border: 1px solid black;
            border-radius: 5px;
            margin-left: 10px;
            box-sizing: border-box;
        }

        .form-section input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: blueviolet;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-section input[type="submit"]:hover {
            background-color: blue;
        }

        .image-section {
            width: 40%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .image-section img {
            width: 100%;
            max-width: 300px;
            height: auto;
        }

        @media screen (max-width: 600px) {
            .register-container {
                flex-direction: column;
                align-items: center;
            }

            .form-section, .image-section {
                width: 100%;
                max-width: 100%;
                padding: 0;
            }

            .image-section {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>

<%
    
    String username = request.getParameter("username");
    String fullname = request.getParameter("fullname");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");

    if (username != null && fullname != null && password != null && confirmPassword != null) {
        if (!password.equals(confirmPassword)) {
            out.println("<h3 style='color: red;'>Passwords do not match!</h3>");
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;
            String dbURL = "jdbc:mysql://localhost:3306/project4";
            String dbUser = "root"; 
            String dbPassword = "Pubali@2004"; 

            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");

               
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                
                String sql = "INSERT INTO user (username, fullname, password) VALUES (?, ?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, fullname);
                pstmt.setString(3, password); 

                
                int result = pstmt.executeUpdate();
                if (result > 0) {
                    
                    response.sendRedirect("dashbord.jsp"); 
                } else {
                    out.println("<h3 style='color: red;'>Registration failed. Please try again.</h3>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3 style='color: red;'>Error: " + e.getMessage() + "</h3>");
            } finally {
                // Close resources
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        }
    }
%>

    <div class="register-container">
        <!-- Form Section -->
        <div class="form-section">
            <h2>Register</h2>
            <form action="NewFile.jsp" method="post">
                <div class="input-container">
                    <div class="icon">
                        <i class="ri-user-3-fill"></i>
                    </div>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="input-container">
                    <div class="icon">
                        <i class="ri-user-fill"></i>
                    </div>
                    <input type="text" name="fullname" placeholder="Full Name" required>
                </div>
                <div class="input-container">
                    <div class="icon">
                        <i class="ri-lock-fill"></i>
                    </div>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-container">
                    <div class="icon">
                        <i class="ri-lock-fill"></i>
                    </div>
                    <input type="password" name="confirm_password" placeholder="Confirm Password" required>
                </div>
                <div>
                    <input type="submit" value="Register">
                </div>
                <p>already registered just click here</p>
                <a href='http://localhost:8082/Fitness/dashbord.jsp'>Login</a>
            </form>
        </div>

        <!-- Image Section -->
        <div class="image-section">
            <img src="pitcures/undraw_sign_up_n6im.svg" alt="Register Icon">
        </div>
    </div>

</body>
</html>
