<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Healthy Shop</title>
  <link rel="stylesheet" href="style.css">
  <style>
    /* Styles */
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    header { background-color: pink; color: white; padding: 1rem; text-align: center; }
    header h1 { color: Maroon; }
    .product-container { display: flex; flex-wrap: wrap; justify-content: space-around; padding: 1rem; }
    .product-card { border: 5px solid black; padding: 1rem; margin: 1rem; width: 150px; text-align: center; box-shadow: 5px 5px 5px blue; transition: 560ms; }
    .cart, .payment-portal { display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: whitesmoke; padding: 20px; border: 1px solid #ddd; z-index: 10; }
    .cart { display: block; }
    button { padding: 10px 25px;
    background: transparent;
    color: black;
    border: 2px solid black;
    cursor: pointer;
    outline: none;
    border-radius: 3px;
 }
   
    button:hover { box-shadow: inset 180px 0 0 blueviolet; color: white; transition: 1000ms; }
    .about { width: 100%; height: 300px; margin: 20px 0; padding: 20px; display: flex; align-items: center; justify-content: center; background-color: silver; }
    .about button {   padding: 10px 25px;
    background: transparent;
    color: black;
    border: 2px solid black;
    cursor: pointer;
    outline: none;
    border-radius: 3px;
 }
    .about button:hover { box-shadow: inset 150px 0 0 black; color: white; transition: 1000ms; }
    a { background-color: skyblue; border-radius: 3px; color: white; border: none; padding: 0.5rem; cursor: pointer; }
    a:hover { background-color: blue; }
  </style>
</head>
<body>
  <header>
    <h1>Healthy Shop</h1>
    <button onclick="viewCart()">View Cart (<span id="cart-count">0</span>)</button>
  </header>
  <div class="about">
    A shop with your handy products to stay healthy and fit<br><br>
    <p>Lorem At dolores quidem autem doloribus dolore magni voluptatum quia molestias animi...</p>             
    <img src="pitcures/pika.jpg" alt="pika" height="300" width="300">
    <button>Know more...</button>
  </div>

  <section class="product-container">
    <h1>Our Products</h1>
    <div class="product-card">
      <h2>Green Tea</h2>
      <img src="download/download.jpeg" alt="Green Tea" height="100" width="100">
      <p>Price: $10</p>
      <button onclick="addToCart('Green Tea', 10)">Add to Cart</button>
    </div>
    <div class="product-card">
      <h2>Oats</h2>
      <img src="download/oats.jpeg" alt="Oats" height="100" width="100">
      <p>Price: $8</p>
      <button onclick="addToCart('Oats', 8)">Add to Cart</button>
    </div>
    <div class="product-card">
      <h2>Chia Seeds</h2>
      <img src="download/chia.jpeg" alt="Chia Seeds" height="100" width="100">
      <p>Price: $12</p>
      <button onclick="addToCart('Chia Seeds', 12)">Add to Cart</button>
    </div>
    <div class="product-card">
      <h2>Yoga Mat</h2>
      <img src="download/download (1).jpeg" alt="Yoga Mat" height="100" width="100">
      <p>Price: $15</p>
      <button onclick="addToCart('Yoga Mat', 15)">Add to Cart</button>
    </div>
    <div class="product-card">
      <h2>Almonds</h2>
      <img src="download/almonds.jpeg" alt="Almonds" height="100" width="100">
      <p>Price: $10</p>
      <button onclick="addToCart('Almonds', 10)">Add to Cart</button>
    </div>
    <div class="product-card">
      <h2>Protein Bars</h2>
      <img src="download/pb.jpeg" alt="Protein Bars" height="100" width="100">
      <p>Price: $5</p>
      <button onclick="addToCart('Protein Bars', 5)">Add to Cart</button>
    </div>
  </section>

  <div class="cart" id="cart">
    <h2>Shopping Cart</h2>
    <ul id="cart-items"></ul>
    <p>Total: $<span id="total-price">0</span></p>
    <button onclick="checkout()">Proceed to Checkout</button>
    <button onclick="closeCart()">Close Cart</button>
  </div>

  <div class="payment-portal" id="payment-portal">
    <h2>Payment Portal</h2>
    <form method="post">
    <img src="download/download pp.jpeg" height= 50px width= 80px>
      <label for="card-number">Card Number:</label>
      <input type="text" id="card-number" name="cardNumber" required><br><br>
      <label for="expiry-date">Expiry Date:</label>
      <input type="text" id="expiry-date" name="expiryDate" placeholder="MM/YY" required><br><br>
      <label for="cvv">CVV:</label>
      <input type="password" name="cvv" placeholder="CVV" required><br><br>
      <label for="customer-name">Cardholder's Name:</label>
      <input type="text" id="customer-name" name="CustomerName" required><br><br>
      <input type="hidden" id="total-payment" name="totalPayment">
      <input type="hidden" id="product-names" name="productNames">
      <input type="hidden" id="product-prices" name="productPrices">
      <button type="submit" name="payNow">Pay Now</button>
    </form>
    <button onclick="closePaymentPortal()">Cancel</button>
  </div>

  <%-- Process Payment and Store Order in Database --%>
  <%
    if (request.getParameter("payNow") != null) {
      String cardNumber = request.getParameter("cardNumber");
      String expiryDate = request.getParameter("expiryDate");
      String cvv = request.getParameter("cvv");
      String customerName = request.getParameter("CustomerName");
      String totalPayment = request.getParameter("totalPayment");
      String productNames = request.getParameter("productNames");
      String productPrices = request.getParameter("productPrices");

      if (cardNumber != null && expiryDate != null && cvv != null && customerName != null && productNames != null && productPrices != null) {
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HealthyShop", "root", "Pubali@2004");

          String[] namesArray = productNames.split("\\|");
          String[] pricesArray = productPrices.split("\\|");

          String query = "INSERT INTO orders (product_name, quantity, total_price, payment_status, customer_name) VALUES (?, ?, ?, ?, ?)";
          PreparedStatement stmt = conn.prepareStatement(query);

          for (int i = 0; i < namesArray.length; i++) {
            String productName = namesArray[i];
            int price = Integer.parseInt(pricesArray[i]);
            int quantity = 1;

            stmt.setString(1, productName);
            stmt.setInt(2, quantity);
            stmt.setInt(3, price);
            stmt.setString(4, "Paid");
            stmt.setString(5, customerName);

            stmt.addBatch();
          }

          stmt.executeBatch();
          conn.close();

          out.println("<script>alert('Payment Successful!');</script>");
        } catch (Exception e) {
          e.printStackTrace();
          out.println("<script>alert('Payment Failed: " + e.getMessage() + "');</script>");
        }
      } else {
        out.println("<script>alert('Invalid payment details. Please try again.');</script>");
      }
    }
  %>

  <script>
    let cart = [];

    function addToCart(product, price) {
      cart.push({ product, price });
      updateCart();
    }

    function updateCart() {
      const cartItems = document.getElementById("cart-items");
      cartItems.innerHTML = '';
      let total = 0;

      cart.forEach((item, index) => {
        total += item.price;
        const li = document.createElement("li");
        li.textContent = `${item.product} - $${item.price}`;
        cartItems.appendChild(li);
      });

      document.getElementById("total-price").textContent = total;
      document.getElementById("cart-count").textContent = cart.length;
    }

    function viewCart() {
      document.getElementById("cart").style.display = "block";
    }

    function closeCart() {
      document.getElementById("cart").style.display = "none";
    }

    function checkout() {
      const productNames = cart.map(item => item.product).join("|");
      const productPrices = cart.map(item => item.price).join("|");
      const total = cart.reduce((acc, item) => acc + item.price, 0);

      document.getElementById("product-names").value = productNames;
      document.getElementById("product-prices").value = productPrices;
      document.getElementById("total-payment").value = total;

      document.getElementById("payment-portal").style.display = "block";
    }

    function closePaymentPortal() {
      document.getElementById("payment-portal").style.display = "none";
    }
  </script>
</body>
</html>
