<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Homepage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>E Commerce - Market Segmentation</title>
    <!-- Preserve your original Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- Your original CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- New CSS for responsive landing page from your new code -->
    <link rel="stylesheet" href="style.css" />
    <!-- FontAwesome from your original -->
    <link rel="stylesheet" href="fonts/css/font-awesome.min.css" />
    <!-- Boxicons CSS for new icons (menu, stars, cart) -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- Preserve your original JS libraries -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Include any new needed JS (like main.js) -->
    <script src="main.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <!-- HEADER -->
    <header>
        <a href="Homepage.aspx" class="logo">Market <span>Segmentation</span></a>
        <i class='bx bx-menu' id="menu-icon"></i>
        <ul class="navbar">
            <li><a href="Homepage.aspx" runat="server" id="Home">Home</a></li>
            <li><a href="ViewItems.aspx?value=a2" runat="server" id="A2">Browse Products</a></li>
            <li><a href="AboutUs.aspx?value=b" runat="server" id="AboutUs">About Us</a></li>
            <li><a href="ContactUs.aspx?value=d" runat="server" id="Contact">Contact Us</a></li>
            <li><a href="Login_page.aspx?value=f" runat="server" id="Log">Signin</a></li>
            <li><a href="Registration_page.aspx?value=e" runat="server" id="Register">Signup</a></li>
            <li><a href="Admin_Loginpage.aspx" runat="server" id="A1">Admin Login</a></li>
        </ul>
    </header>
    <!-- HERO SECTION -->
    <section class="home" id="home">
        <div class="home-text">
            <h1>Come  <span>Shop Now</span> <br />We Recommend<br /><span>Personally for your Intrests</span> </h1>
            <p>Best quality products at affordable prices</p>
            <a href="ViewItems.aspx?value=a2">
                <button class="cartBtn">
                    <svg class="cart" fill="white" viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path>
                    </svg>
                    SHOP NOW...
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512" class="product">
                        <path d="M211.8 0c7.8 0 14.3 5.7 16.7 13.2C240.8 51.9 277.1 80 320 80s79.2-28.1 91.5-66.8C413.9 5.7 420.4 0 428.2 0h12.6c22.5 0 44.2 7.9 61.5 22.3L628.5 127.4c6.6 5.5 10.7 13.5 11.4 22.1s-2.1 17.1-7.8 23.6l-56 64c-11.4 13.1-31.2 14.6-44.6 3.5L480 197.7V448c0 35.3-28.7 64-64 64H224c-35.3 0-64-28.7-64-64V197.7l-51.5 42.9c-13.3 11.1-33.1 9.6-44.6-3.5l-56-64c-5.7-6.5-8.5-15-7.8-23.6s4.8-16.6 11.4-22.1L137.7 22.3C155 7.9 176.7 0 199.2 0h12.6z"></path>
                    </svg>
                </button>
            </a>
        </div>
    </section>
    <!-- SHOP SECTION -->
    <section class="shop" id="shop">
        <div class="heading">
            <span>New Arrival</span>
            <h2>
                <a href="ViewItems.aspx?value=a2" <button class="cta">
                  <span class="hover-underline-animation"> Shop now </span>
                  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="10" viewBox="0 0 46 16">
                    <path d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z" transform="translate(30)"></path>
                  </svg>
                </button></a>
            </h2>
        </div>
        <div class="shop-container">
            <div class="box">
                <div class="box-img">
                    <img src="../images/home_cart2.png" alt="Gray Chair" />
                </div>
            </div>
        </div>
    </section>
    <!-- ABOUT SECTION -->
    <section class="about" id="about">
        <div class="about-img">
            <img src="../images/about_us.png" alt="About Us" />
        </div>
        <div class="about-text">
            <span>About Us</span>
            <h2>We got you covered <br />from every day needs to fancy valuables </h2>
            <p>we recommend you with products such that you only consired on looking for the quantity not the quality </p>
            <p>We are one stop solution for your shopping needs </p>
            <a href="AboutUs.aspx?value=b" class="btn">Learn More</a>
        </div>
    </section>
    <!-- FEEDBACK SECTION -->
    <section class="newsletter" id="contact">
        <h2>FEEDBACKS</h2>
        <div class="news-box">
            <input type="email" placeholder="Give your feedbacks" />
            <a href="#" class="btn">Enter</a>
        </div>
    </section>
    <!-- FOOTER -->
    <section class="footer" id="footer">
        <div class="footer-box">
            <h2>Market <span>Segmentation</span></h2>
            <p>Invest in your comfort and happiness.</p>
            <div class="social">
                <a href="#"><i class='bx bxl-facebook'></i></a>
                <a href="#"><i class='bx bxl-twitter'></i></a>
                <a href="#"><i class='bx bxl-instagram'></i></a>
            </div>
        </div>
        <div class="footer-box">
            <h3>Services</h3>
            <ul>
                <li><a href="#">Product</a></li>
                <li><a href="#">Help & Support</a></li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>
        <div class="footer-box">
            <h3>Product</h3>
            <ul>
                <li><a href="#">Clothing</a></li>
                <li><a href="#">Elctronics</a></li>
                <li><a href="#">Watches</a></li>
                <li><a href="#">Others</a></li>
            </ul>
        </div>
        <div class="footer-box contact-info">
            <h3>Contact</h3>
            <span>Mysuru</span>
            <span>MIT MYSORE</span>
            <span>MITM.COM</span>
        </div>
    </section>
    <div class="copyright">
        <p>© <span></span>. >MITM All rights reserved</p>
    </div>
</body>
</html>
