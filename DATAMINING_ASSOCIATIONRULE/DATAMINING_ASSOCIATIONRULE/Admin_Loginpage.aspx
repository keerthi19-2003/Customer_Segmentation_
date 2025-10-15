<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Admin_Loginpage.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Admin_Loginpage" Title="Administrator Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .admin-login-container {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        background: linear-gradient(135deg, #82b635 0%, #5a8a24 100%);
        overflow: hidden;
        position: relative;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* Animated Background */
    .floating-icons {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: 1;
    }

    .floating-icon {
        position: absolute;
        font-size: 2rem;
        color: rgba(255, 255, 255, 0.1);
        animation: float 15s infinite linear;
    }

    .floating-icon:nth-child(1) { left: 10%; animation-delay: 0s; }
    .floating-icon:nth-child(2) { left: 20%; animation-delay: 2s; }
    .floating-icon:nth-child(3) { left: 30%; animation-delay: 4s; }
    .floating-icon:nth-child(4) { left: 40%; animation-delay: 6s; }
    .floating-icon:nth-child(5) { left: 50%; animation-delay: 8s; }
    .floating-icon:nth-child(6) { left: 60%; animation-delay: 10s; }
    .floating-icon:nth-child(7) { left: 70%; animation-delay: 12s; }
    .floating-icon:nth-child(8) { left: 80%; animation-delay: 14s; }
    .floating-icon:nth-child(9) { left: 90%; animation-delay: 16s; }
    .floating-icon:nth-child(10) { left: 15%; animation-delay: 18s; }

    @keyframes float {
        0% {
            transform: translateY(100vh) rotate(0deg);
        }
        100% {
            transform: translateY(-100px) rotate(360deg);
        }
    }

    .login-card {
        background: rgba(0, 0, 0, 0.85);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 450px;
        animation: slideUp 0.8s ease-out;
        position: relative;
        z-index: 10;
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    @keyframes slideUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .login-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .login-header h2 {
        color: #ffffff;
        font-size: 2.2rem;
        margin-bottom: 10px;
        font-weight: 700;
        text-transform: capitalize;
    }

    .login-header p {
        color: #cccccc;
        font-size: 1rem;
    }

    .admin-icon {
        display: inline-block;
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #82b635, #5a8a24);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
        animation: pulse 2s infinite;
    }

    .admin-icon i {
        font-size: 2.5rem;
        color: white;
    }

    @keyframes pulse {
        0% {
            box-shadow: 0 0 0 0 rgba(130, 182, 53, 0.7);
        }
        70% {
            box-shadow: 0 0 0 20px rgba(130, 182, 53, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(130, 182, 53, 0);
        }
    }

    .form-group {
        position: relative;
        margin-bottom: 25px;
    }

    .form-group i {
        position: absolute;
        top: 50%;
        left: 15px;
        transform: translateY(-50%);
        color: #82b635;
        font-size: 1.1rem;
        z-index: 5;
    }

    .form-group .text {
        width: 100%;
        padding: 15px 15px 15px 50px;
        border: 2px solid #444444;
        border-radius: 12px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: #222222;
        color: #ffffff;
    }

    .form-group .text::placeholder {
        color: #999999;
    }

    .form-group .text:focus {
        outline: none;
        border-color: #82b635;
        box-shadow: 0 0 0 3px rgba(130, 182, 53, 0.3);
        background: #333333;
    }

    .btn-container {
        text-align: center;
        margin-bottom: 20px;
    }

    .btn-container .aspnet-button {
        background: linear-gradient(135deg, #82b635, #5a8a24) !important;
        border: none !important;
        border-radius: 12px !important;
        padding: 15px 30px !important;
        color: white !important;
        font-size: 1.1rem !important;
        font-weight: 600 !important;
        cursor: pointer !important;
        transition: all 0.3s ease !important;
        position: absolute;
        overflow: hidden;
        min-width: 150px;
        /* Make the image button completely invisible */
        opacity: 0 !important;
        visibility: hidden;
        pointer-events: none;
    }
    
    .dummy-login-btn {
        width: 100%;
        padding: 18px 40px;
        background: linear-gradient(135deg, #82b635, #5a8a24);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 1.2rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        min-height: 55px;
    }

    .dummy-login-btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: all 0.5s;
    }

    .dummy-login-btn:hover::before {
        left: 100%;
    }

    .dummy-login-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(130, 182, 53, 0.3);
    }

    .dummy-login-btn:active {
        transform: translateY(0);
    }

    .btn-container .aspnet-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(130, 182, 53, 0.3);
    }

    .error-message {
        color: #e74c3c;
        font-size: 0.9rem;
        text-align: center;
        margin-top: 15px;
        background: rgba(231, 76, 60, 0.1);
        padding: 10px;
        border-radius: 8px;
        border-left: 4px solid #e74c3c;
    }

    .validation-error {
        color: #ff6b6b;
        font-size: 0.8rem;
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        font-weight: bold;
    }

    .form-footer {
        text-align: center;
        margin-top: 30px;
        color: #cccccc;
        font-size: 0.9rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .login-card {
            margin: 20px;
            padding: 30px 20px;
        }

        .login-header h2 {
            font-size: 1.8rem;
        }

        .floating-icon {
            font-size: 1.5rem;
        }
    }
</style>

<div class="admin-login-container">
    <!-- Animated Background -->
    <div class="floating-icons">
        <div class="floating-icon"><i class="fas fa-shopping-cart"></i></div>
        <div class="floating-icon"><i class="fas fa-credit-card"></i></div>
        <div class="floating-icon"><i class="fas fa-gift"></i></div>
        <div class="floating-icon"><i class="fas fa-tag"></i></div>
        <div class="floating-icon"><i class="fas fa-shopping-bag"></i></div>
        <div class="floating-icon"><i class="fas fa-star"></i></div>
        <div class="floating-icon"><i class="fas fa-heart"></i></div>
        <div class="floating-icon"><i class="fas fa-truck"></i></div>
        <div class="floating-icon"><i class="fas fa-percent"></i></div>
        <div class="floating-icon"><i class="fas fa-gem"></i></div>
    </div>

    <div class="login-card">
        <div class="login-header">
            <div class="admin-icon">
                <i class="fas fa-user-shield"></i>
            </div>
            <h2>administrator login page</h2>
            <p>Sign in to your admin panel</p>
        </div>

        <div class="form-group">
            <i class="fas fa-user"></i>
            <asp:TextBox ID="tb_uname" runat="server" CssClass="text" placeholder="Admin ID"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="tb_uname" CssClass="validation-error" 
                ErrorMessage="*" ToolTip="Admin ID is required" 
                ValidationGroup="Adminlogin"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <i class="fas fa-lock"></i>
            <asp:TextBox ID="tb_pass" runat="server" CssClass="text" 
                TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tb_pass" CssClass="validation-error" 
                ErrorMessage="*" ToolTip="Password is required" 
                ValidationGroup="Adminlogin"></asp:RequiredFieldValidator>
        </div>

        <div class="btn-container">
            <!-- Dummy visible button that triggers the actual ImageButton -->
            <button type="button" class="dummy-login-btn" onclick="triggerLogin()">
                <i class="fas fa-unlock-alt"></i>
                Login
            </button>
            
            <!-- Hidden ImageButton that does the actual form submission -->
            <asp:ImageButton ID="btn_submit" runat="server" 
                ImageUrl="~/images/CAUVGTUR.jpg" 
                onclick="btn_submit_Click" 
                ValidationGroup="Adminlogin" 
                CssClass="aspnet-button"
                AlternateText="Login" />
        </div>

        <asp:Label ID="Label1" runat="server" CssClass="error-message" Visible="false"></asp:Label>

        <div class="form-footer">
            <i class="fas fa-shield-alt"></i>
            Secure Admin Access
        </div>
    </div>
</div>

<script>
    // Function to trigger the hidden ImageButton
    function triggerLogin() {
        // Get the hidden ImageButton
        var hiddenButton = document.getElementById('<%= btn_submit.ClientID %>');
        if (hiddenButton) {
            // Trigger the click event on the ImageButton
            hiddenButton.click();
        }
    }

    // Auto-focus username field when page loads
    window.addEventListener('load', function () {
        var usernameField = document.getElementById('<%= tb_uname.ClientID %>');
        if (usernameField) {
            usernameField.focus();
        }
    });

    // Add floating icons dynamically for variety
    function addFloatingIcon() {
        var icons = [
            'fas fa-shopping-cart',
            'fas fa-credit-card',
            'fas fa-gift',
            'fas fa-tag',
            'fas fa-shopping-bag',
            'fas fa-star',
            'fas fa-heart',
            'fas fa-truck',
            'fas fa-percent',
            'fas fa-gem'
        ];

        var container = document.querySelector('.floating-icons');
        var icon = document.createElement('div');
        icon.className = 'floating-icon';
        icon.innerHTML = '<i class="' + icons[Math.floor(Math.random() * icons.length)] + '"></i>';
        icon.style.left = Math.random() * 100 + '%';
        icon.style.animationDuration = (Math.random() * 10 + 10) + 's';

        container.appendChild(icon);

        // Remove icon after animation completes
        setTimeout(function () {
            if (container.contains(icon)) {
                container.removeChild(icon);
            }
        }, 20000);
    }

    // Add new floating icons periodically
    setInterval(addFloatingIcon, 3000);

    // Show error message with animation if it exists
    window.addEventListener('load', function () {
        var errorLabel = document.getElementById('<%= Label1.ClientID %>');
        if (errorLabel && errorLabel.innerHTML.trim() !== '') {
            errorLabel.style.display = 'block';
            errorLabel.style.opacity = '0';
            errorLabel.style.transition = 'opacity 0.5s ease';
            setTimeout(function () {
                errorLabel.style.opacity = '1';
            }, 100);
        }
    });
</script>

</asp:Content>