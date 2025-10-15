<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_page.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Login_page" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- ✅ Latest Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

<link href="css/header.css" rel="stylesheet" />
<link rel="stylesheet" href="login.css" />

<title>Sign in</title>
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

<div class="container">
  <div class="forms-container">
    <div class="signin-signup">

      <!-- ✅ Sign In Form -->
      <form id="form1" runat="server" class="sign-in-form">
        <h2 class="title">Sign in</h2>

        <div class="input-field">
          <i class="fas fa-user"></i>
          <asp:TextBox ID="txt_username" runat="server" CssClass="input-box" placeholder="Username"></asp:TextBox>
        </div>

        <div class="input-field">
          <i class="fas fa-lock"></i>
          <asp:TextBox ID="txt_password" runat="server" CssClass="input-box" placeholder="Password" TextMode="Password"></asp:TextBox>
        </div>

        <asp:Button ID="btn_submit" runat="server" Text="Login" CssClass="btn solid" OnClick="btn_submit_Click" />

        <p class="social-text">Or Sign in with social platforms</p>
        <div class="social-media">
          <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
          <a href="#" class="social-icon"><i class="fab fa-google"></i></a>
          <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </form>

      <!-- ✅ Dummy Sign Up Form (only for animation) -->
      <form action="#" class="sign-up-form">
        <h2 class="title">Sign up</h2>
        <p style="text-align:center; margin-bottom:15px;">Redirecting to Registration Page...</p>
        <div class="input-field">
          <i class="fas fa-user"></i>
          <input type="text" placeholder="Username (disabled)" disabled />
        </div>
        <input type="button" value="Go to Registration" class="btn" onclick="window.location.href='Registration_page.aspx'" />
      </form>

    </div>
  </div>

  <!-- Panels -->
  <div class="panels-container">
    <div class="panel left-panel">
      <div class="content">
        <h3>New here?</h3>
        <p>Please Register First To Start Shopping..</p>
        <!-- triggers sliding -->
        <button class="btn transparent" id="sign-up-btn">Sign up</button>
      </div>
      <img src="https://i.ibb.co/6HXL6q1/Privacy-policy-rafiki.png" class="image" alt="" />
    </div>
    <div class="panel right-panel">
      <div class="content">
        <h3>Welcome back!</h3>
        <p>Login To Continue Shopping...</p>
        <!-- triggers sliding back -->
        <button class="btn transparent" id="sign-in-btn">Sign in</button>
      </div>
      <img src="https://i.ibb.co/nP8H853/Mobile-login-rafiki.png" class="image" alt="" />
    </div>
  </div>
</div>

<script src="regis.js"></script>
</body>
</html>
