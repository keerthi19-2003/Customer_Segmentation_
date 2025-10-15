<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="MemberCart.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.MemberCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3b82f6;
            --primary-hover: #2563eb;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --warning-color: #f59e0b;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-600: #4b5563;
            --gray-700: #374151;
            --gray-800: #1f2937;
            --gray-900: #111827;
        }

        * {
            box-sizing: border-box;
        }

        .modern-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, var(--gray-50) 0%, #ffffff 100%);
            min-height: 100vh;
        }

        .cart-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .cart-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, var(--primary-color), #8b5cf6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .cart-subtitle {
            color: var(--gray-600);
            font-size: 1.125rem;
            font-weight: 400;
        }

        .shipping-info {
            background: linear-gradient(135deg, #fef3c7 0%, #fed7aa 100%);
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border-left: 4px solid var(--warning-color);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .shipping-info h3 {
            color: var(--gray-800);
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
            margin-bottom: 0.75rem;
            color: var(--gray-700);
        }

        .info-item:last-child {
            margin-bottom: 0;
        }

        .info-icon {
            color: var(--warning-color);
            margin-top: 0.125rem;
            flex-shrink: 0;
        }

        .empty-cart {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .empty-cart-icon {
            font-size: 4rem;
            color: var(--gray-300);
            margin-bottom: 1rem;
        }

        .empty-cart h2 {
            color: var(--gray-800);
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .empty-cart p {
            color: var(--gray-600);
            margin-bottom: 2rem;
        }

        .cart-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .cart-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .cart-header-row {
            background: linear-gradient(135deg, var(--primary-color), #6366f1);
            color: white;
        }

        .cart-header-cell {
            padding: 1.25rem 1rem;
            font-weight: 600;
            text-align: center;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .cart-row {
            border-bottom: 1px solid var(--gray-100);
            transition: all 0.3s ease;
        }

        .cart-row:hover {
            background: var(--gray-50);
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .cart-cell {
            padding: 1.5rem 1rem;
            vertical-align: middle;
            text-align: center;
        }

        .product-image {
            width: 60px;
            height: 80px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .product-image:hover {
            transform: scale(1.05);
        }

        .product-name {
            font-weight: 600;
            color: var(--gray-800);
            font-size: 1rem;
            max-width: 200px;
            word-wrap: break-word;
        }

        .product-price {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.125rem;
        }

        .quantity-input {
            width: 70px;
            padding: 0.5rem;
            border: 2px solid var(--gray-200);
            border-radius: 8px;
            text-align: center;
            font-weight: 600;
            transition: all 0.3s ease;
            background: white;
        }

        .quantity-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .total-price {
            font-weight: 700;
            color: var(--success-color);
            font-size: 1.125rem;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            cursor: pointer;
            font-size: 0.875rem;
        }

        .update-btn {
            background: var(--primary-color);
            color: white;
        }

        .update-btn:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(59, 130, 246, 0.3);
        }

        .delete-btn {
            background: var(--danger-color);
            color: white;
            padding: 0.5rem;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .delete-btn:hover {
            background: #dc2626;
            transform: translateY(-2px) rotate(5deg);
            box-shadow: 0 4px 8px rgba(239, 68, 68, 0.3);
        }

        .cart-total {
            background: linear-gradient(135deg, var(--gray-800), var(--gray-700));
            color: white;
            padding: 1.5rem;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .total-label {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .total-amount {
            font-size: 1.75rem;
            font-weight: 700;
            color: #fbbf24;
        }

        .cart-actions {
            background: white;
            padding: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1rem;
            border-top: 1px solid var(--gray-100);
        }

        .primary-btn {
            background: linear-gradient(135deg, var(--primary-color), #6366f1);
            color: white;
            padding: 0.875rem 2rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
        }

        .primary-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.3);
        }

        .secondary-btn {
            background: white;
            color: var(--gray-700);
            padding: 0.875rem 2rem;
            border: 2px solid var(--gray-200);
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
        }

        .secondary-btn:hover {
            background: var(--gray-50);
            border-color: var(--gray-300);
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .modern-container {
                padding: 1rem;
            }
            
            .cart-title {
                font-size: 2rem;
            }
            
            .cart-actions {
                flex-direction: column;
                gap: 1rem;
            }
            
            .primary-btn, .secondary-btn {
                width: 100%;
                justify-content: center;
            }
            
            .cart-table {
                font-size: 0.875rem;
            }
            
            .cart-cell {
                padding: 1rem 0.5rem;
            }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.5;
            }
        }

        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="modern-container">
            <!-- Cart Header -->
            <div class="cart-header fade-in">
                <h1 class="cart-title">
                    <i class="fas fa-shopping-cart"></i>
                    Shopping Cart
                </h1>
                <p class="cart-subtitle">Review your items before checkout</p>
            </div>

            <!-- Shipping Information -->
            <div class="shipping-info fade-in">
                <h3>
                    <i class="fas fa-info-circle"></i>
                    Delivery & Shipping Information
                </h3>
                <div class="info-item">
                    <i class="fas fa-clock info-icon"></i>
                    <span>Items will be delivered within 7 to 10 working days if quantity is available, otherwise it may take extra days depending on availability.</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-shipping-fast info-icon"></i>
                    <span><strong>Shipping costs:</strong> Within India ₹50 • Outside India ₹500</span>
                </div>
            </div>

            <!-- Empty Cart Message -->
            <asp:Label ID="Label1" runat="server" Visible="False">
                <div class="empty-cart fade-in">
                    <i class="fas fa-shopping-cart empty-cart-icon"></i>
                    <h2>Your Shopping Cart is Empty</h2>
                    <p>Looks like you haven't added any items to your cart yet.</p>
                    <asp:Button ID="BtnShopEmpty" runat="server" CssClass="primary-btn" 
                        Text="Start Shopping" OnClick="BtnShopMore_Click" />
                </div>
            </asp:Label>

            <!-- Cart Content -->
            <asp:Panel ID="Panelca2" runat="server" CssClass="fade-in">
                <div class="cart-container">
                    <asp:Table ID="Table1" runat="server" CssClass="cart-table">
                    </asp:Table>
                </div>

                <!-- Cart Actions -->
                <asp:Panel ID="Panel2" runat="server">
                    <div class="cart-actions">
                        <asp:Button ID="BtnShopMore" runat="server" CssClass="secondary-btn"
                            OnClick="BtnShopMore_Click" Text="Continue Shopping" />
                        <asp:Button ID="BtnExit" runat="server" CssClass="primary-btn"
                            OnClick="BtnExit_Click" Text="Proceed to Checkout" />
                    </div>
                </asp:Panel>
            </asp:Panel>

            <!-- Hidden Labels -->
            <asp:Label ID="LblQuan" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="LabelId" runat="server" Visible="False"></asp:Label>
        </div>
    </asp:Panel>
</asp:Content>