<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StayFit | Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
    <style>
       
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header {
            background-color: blueviolet;
            margin: 3px 2px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header h1{
        
    color: transparent;
    background: linear-gradient(90deg, red, yellow, red);
    background-clip: text;
    }
        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .menu li {
            margin: 0 15px;
        }

        .menu li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            background-color: transparent;
            border-radius: 5px;
        }

        .menu li a:hover {
            background-color: maroon;
        }

        .menu-icon {
            display: none;
            font-size: 24px;
            cursor: pointer;
            color: white;
        }

        .menu-icon h1 {
    background: linear-gradient(125deg, white, blue, pink);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    font-size: 24px;
    font-weight: bold;
    margin: 0;
    display: inline-block;
}
        

        .hero {
            background-image: url('https://images.ctfassets.net/0k812o62ndtw/kOozcyS9Qi9DCwrfoEWfM/40cdd85bdf0711fd2d3de3e84b32fd50/BackToGymSWEATf1f07a7f6f79e7b8807d2436a6ae8e8b.jpg');
            background-size: cover;
            background-position: center;
            height: 400px;
            width:100%
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
            padding: 20px;
            background-repeat:no-repeat;
        }

        .hero h2 {
            font-size: 50px;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .hero a {
            background-color: #f39c12;
            padding: 15px 30px;
            color: black;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
        }

        .hero a:hover {
            background-color: #e67e22;
        }

        .services {
            padding: 60px 20px;
            background-color: maroon;
            text-align: center;
        }

        .services h2 {
            color: red;
            font-size: 32px;
            margin-bottom: 40px;
        }

        .service-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .service-card {
            background-color: white;
            padding: 10px;
            margin: 10px;
            border-radius: 8px;
            width: 30%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .service-card i {
            font-size: 50px;
            color: #f39c12;
        }

        .service-card h3 {
            margin: 15px 0;
            color: #333;
        }

        .service-card p {
            color: #666;
        }

        .about {
            padding: 60px 20px;
            background-color: #fff;
            text-align: center;
        }

        .about h2 {
            font-size: 32px;
            color: #333;
            margin-bottom: 20px;
        }

        .about p {
            color: #666;
            font-size: 18px;
            line-height: 1.6;
        }

        .contact {
            background-color: #333;
            color: white;
            padding: 40px 20px;
            text-align: center;
        }

        .contact h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .contact p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .contact a {
            color: #f39c12;
            font-size: 18px;
            text-decoration: none;
        }

        .contact a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #222;
            color: white;
            text-align: center;
            padding: 10px;
        }

        footer p {
            margin: 0;
        }

        /* Media Query for mobile view */
        @media (max-width: 768px) {
            .menu-icon {
                display: block;
            }

            .menu {
                display: none;
                background-color: #444;
                position: absolute;
                top: 50px;
                right: 10px;
                width: 200px;
                text-align: left;
                border-radius: 5px;
                padding: 10px;
                flex-direction: column;
            }

            .menu.active {
                display: block;
            }

            .menu li {
                margin: 10px 0;
            }

            .hero h2 {
                font-size: 36px;
            }

            .hero p {
                font-size: 18px;
            }

            .hero a {
                font-size: 16px;
            }

            .service-card {
                width: 100%;
                margin-bottom: 20px;
            }
        }
.footer-container{
    width: 100%;
    height: 280px;
    margin: 10px 0px;
    
}

.footer-container .footer{
    width: 100%;
    height: 230px;
    background: rgba(0,0,0,0.71);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 15px ;

}

.footer-container .copyright{
    width: 100%;
    height: 60px;
    background: black;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
}

.footer-container .footer .card{
    width: 25%;
    height: 100%;
    padding: 10px 20px;
}

.footer-container .footer .card .card-title{
    width: 100%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: start;
    color: white;
}

.footer-container .footer .card .card-title1{
    width: 100%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: start;
    color: transparent;
    background: linear-gradient(125deg,yellow, red,yellow);
    background-clip: text;
}

.footer-container .footer .card p{
    font-size: 14px;
    color: white;
    width: 100%;
    text-align: justify;
}

.footer-container .footer .card ul{
    
    padding-left: 25px;
    color: white;
}

.footer-container .footer .card ul li{
    cursor:pointer;
    transition: all ease-in 0.45s;
}

.footer-container .footer .card ul li:hover{
    transform: translateX(20px);
    font-weight: bold;
}

.footer-container .footer .card .footer-box{
    width: 100%;
    padding: 8px 8px;
    display: flex;
    align-items: center;
    justify-content: start;
    gap:20px;
}        
    </style>
</head>
<body>

    <!-- Navigation -->
    <div class="header">
    
        <div class="menu-icon" onclick="toggleMenu()">☰</div>
        <h1>StayFit</h1>
        <ul class="menu">
            <li><a href="#">Home</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#Fitness Tracker
Name:contact">Contact</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h2>Your Success, Our Commitment</h2>
        <p>We provide you all the facilities in order to stay healthy.</p>
        <a href="#contact">Get Started</a>
    </div>

    <!-- Services Section -->
    <section class="services" id="services">
        <h2>Our Services</h2>
        <div class="service-cards">
            <div class="service-card">
                <i class="ri-empathize-fill"></i>
                <h3>Patience</h3>
                <p>Keep your patience as consistency is key.</p>
            </div>
            <div class="service-card">
                <i class="ri-emotion-fill"></i>
                <h3>Believe</h3>
                <p>Believe in yourself—you can do it.</p>
            </div>
            <div class="service-card">
                <i class="ri-team-fill"></i>
                <h3>Customer Support</h3>
                <p>Our team is available 24/7 to support you and ensure satisfaction.</p>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="about" id="about">
        <h2>About</h2>
        <p>This website helps you track your calories and provides tips to help you stay fit.
        You can track down your calories as well buy products from our store to maintain a healthy lifestyle
        hurry up dont miss the opportunity</p>
    </section>

<div class="footer-container">
        <div class="footer">
            <div class="card">
                <div class="card-title1">
                    <h2>Fitness.com</h2>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati soluta impedit quos repellendus, fuga facilis eum consectetur ipsum sequi! Dolorum alias dolorem adipisci similique eaque architecto, sunt quod tempore.</p>
            </div>
            <div class="card">
                <div class="card-title">
                    <h2>Important Links</h2>
                </div>
                <ul>
                    <li>Home</li>
                    <li>About Us</li>
                    <li>Our Services</li>
                    <li>Contact Us</li>
                </ul>
            </div>
            <div class="card">
                <div class="card-title">
                    <h2>Information</h2>
                </div>
                    <div class="footer-box">
                        <i class="ri-phone-fill"></i>
                        <p>+91 9876543210</p>
                    </div>
                    <div class="footer-box">
                        <i class="ri-mail-fill"></i>
                        <p>info@gmail.com</p>
                    </div>
                </div>
        
    </div>
    <div class="copyright">
        <p>&copy; PUBALI MONDAL all rights reserved</p>
    </div>
    </div>
    </div>
<script src = "script.js"></script>    
</body>
</html>
    <!-- JavaScript for toggling the menu -->
    <script>
        function toggleMenu() {
            const menu = document.querySelector('.menu');
            menu.classList.toggle('active');
        }
    </script>

</body>
</html>
