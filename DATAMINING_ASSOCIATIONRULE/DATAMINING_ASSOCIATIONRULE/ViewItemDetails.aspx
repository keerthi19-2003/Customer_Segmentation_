<%@ Page Language="C#" MasterPageFile="~/Member.Master"
    AutoEventWireup="true"
    CodeBehind="ViewItemDetails.aspx.cs"
    Inherits="DATAMINING_ASSOCIATIONRULE.ViewItemDetails"
    Title="View Item Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Reset and base styles - using more specific selectors to avoid conflicts */
        .product-details-page * {
            box-sizing: border-box;
        }

        /* Single-color background with floating items */
        .product-details-page {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
            line-height: 1.6;
            color: #000000; /* black for text */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #82B734; /* updated single green */
            position: relative;
            overflow: hidden;
        }

        /* Floating items */
        .floating-item {
            position: absolute;
            bottom: -100px;
            width: 30px;
            height: 30px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: floatUp 15s linear infinite;
        }

        @keyframes floatUp {
            0% {
                transform: translateY(0) scale(1);
                opacity: 1;
            }
            100% {
                transform: translateY(-120vh) scale(1.5);
                opacity: 0;
            }
        }

        /* Random sizes and speeds */
        .floating-item:nth-child(1) { left: 10%; width: 20px; height: 20px; animation-duration: 12s; }
        .floating-item:nth-child(2) { left: 25%; width: 40px; height: 40px; animation-duration: 18s; }
        .floating-item:nth-child(3) { left: 40%; width: 25px; height: 25px; animation-duration: 14s; }
        .floating-item:nth-child(4) { left: 60%; width: 35px; height: 35px; animation-duration: 16s; }
        .floating-item:nth-child(5) { left: 75%; width: 50px; height: 50px; animation-duration: 20s; }
        .floating-item:nth-child(6) { left: 90%; width: 15px; height: 15px; animation-duration: 10s; }

        /* Container */
        .product-details-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            position: relative;
            z-index: 1; /* Keep above floating items */
        }

        /* Header */
        .product-details-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e0e6ed;
        }

        .product-details-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #000000; /* black for heading */
            margin: 0;
        }

        /* Product table styles */
        .modern-product-display {
            width: 100% !important;
            border-collapse: separate;
            border-spacing: 0;
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .modern-product-display td {
            padding: 0 !important;
            border: none !important;
            vertical-align: top;
        }

        /* Main product layout */
        .product-main-layout {
            display: flex;
            min-height: 500px;
        }

        /* Image section */
        .product-image-container {
            flex: 1;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .product-main-image {
            max-width: 100%;
            max-height: 400px;
            width: auto;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }

        .product-main-image:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        /* Product info section */
        .product-info-container {
            flex: 1;
            padding: 40px;
            background: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .product-title-main {
            font-size: 2.2rem !important;
            font-weight: 700;
            color: #000000; /* black */
            margin: 0 0 20px 0 !important;
            line-height: 1.2;
        }

        .rating-section-display {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
        }

        .stars-display {
            color: #ffc107;
            font-size: 1.4rem;
            letter-spacing: 3px;
        }

        .rating-info {
            color: #000000; /* black */
            font-weight: 500;
            font-size: 1rem;
        }

        .price-display-main {
            font-size: 2.8rem !important;
            font-weight: 700;
            color: #000000; /* black */
            margin: 0 0 25px 0 !important;
        }

        .stock-status-display {
            background: #e8f5e8;
            border-left: 5px solid #28a745;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .stock-text-display {
            font-weight: 600;
            color: #000000; /* black */
            font-size: 1.1rem;
        }

        .out-of-stock-display {
            background: #f8d7da;
            border-left-color: #dc3545;
        }

        .out-of-stock-display .stock-text-display {
            color: #000000; /* black */
        }

        /* Action buttons */
        .action-buttons-container {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .modern-cart-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            color: white !important;
            border: none !important;
            padding: 15px 30px !important;
            border-radius: 10px !important;
            font-weight: 600 !important;
            font-size: 1rem !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
            text-decoration: none !important;
            display: inline-flex !important;
            align-items: center !important;
            gap: 8px !important;
            min-width: 160px !important;
            justify-content: center !important;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4) !important;
        }

        .modern-cart-button:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6) !important;
            color: white !important;
            text-decoration: none !important;
        }

        .modern-cart-button:disabled {
            opacity: 0.6 !important;
            cursor: not-allowed !important;
            transform: none !important;
        }

        .buy-now-button {
            background: white !important;
            color: #667eea !important;
            border: 2px solid #667eea !important;
        }

        .buy-now-button:hover {
            background: #667eea !important;
            color: white !important;
        }

        /* Description section */
        .description-section-container {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 30px 40px;
        }

        .description-title-main {
            font-size: 1.6rem !important;
            font-weight: 700;
            color: #000000; /* black */
            margin: 0 0 20px 0 !important;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .description-text-main {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #000000; /* black */
            margin: 0 !important;
        }

        /* Error state */
        .error-display-container {
            text-align: center;
            padding: 80px 40px;
            background: #fff;
        }

        .error-icon-display {
            font-size: 4rem;
            margin-bottom: 20px;
        }

        .error-title-display {
            font-size: 1.8rem !important;
            font-weight: 600;
            color: #000000; /* black */
            margin: 0 0 15px 0 !important;
        }

        .error-message-display {
            color: #000000; /* black */
            font-size: 1.1rem;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .product-main-layout {
                flex-direction: column;
            }

            .product-image-container,
            .product-info-container {
                padding: 25px;
            }

            .product-title-main {
                font-size: 1.8rem !important;
            }

            .price-display-main {
                font-size: 2.2rem !important;
            }

            .action-buttons-container {
                flex-direction: column;
            }

            .modern-cart-button {
                width: 100% !important;
            }

            .description-section-container {
                padding: 25px;
            }
        }

        /* Bootstrap override specificity */
        .product-details-page table {
            margin-bottom: 0 !important;
        }
    </style>

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

    <div class="product-details-page">
        <!-- Floating items -->
        <div class="floating-item"></div>
        <div class="floating-item"></div>
        <div class="floating-item"></div>
        <div class="floating-item"></div>
        <div class="floating-item"></div>
        <div class="floating-item"></div>

        <div class="product-details-container">
            <div class="product-details-header">
                <h1>Product Details</h1>
            </div>

            <asp:Panel ID="Panel1" runat="server">
                <asp:Table ID="TableBD" runat="server" CssClass="modern-product-display" />
                <asp:Label ID="Lbl_Msg" runat="server" CssClass="error-message-display" ForeColor="Black" Visible="False"></asp:Label>
            </asp:Panel>
        </div>
    </div>

    <script type="text/javascript">
        // Enhanced interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Button click effects
            const buttons = document.querySelectorAll('.modern-cart-button');
            buttons.forEach(function(button) {
                button.addEventListener('click', function() {
                    if (!this.disabled) {
                        this.style.transform = 'scale(0.95)';
                        setTimeout(function() {
                            button.style.transform = '';
                        }, 150);
                    }
                });
            });

            // Image hover effects for mobile
            const productImage = document.querySelector('.product-main-image');
            if (productImage && window.innerWidth <= 768) {
                productImage.addEventListener('click', function() {
                    this.style.transform = this.style.transform === 'scale(1.1)' ? 'scale(1)' : 'scale(1.1)';
                });
            }
        });

        // Add to cart with animation
        function addToCart() {
            const button = event.target;
            const originalText = button.innerHTML;
            button.style.transform = 'scale(0.95)';
            button.innerHTML = '✅ Adding...';
            
            setTimeout(function() {
                window.location.href = 'Login_page.aspx';
            }, 800);
        }

        // Buy now function
        function buyNow() {
            const button = event.target;
            button.style.transform = 'scale(0.95)';
            button.innerHTML = '⚡ Processing...';
            
            setTimeout(function() {
                window.location.href = 'Login_page.aspx';
            }, 500);
        }
    </script>
</asp:Content>
