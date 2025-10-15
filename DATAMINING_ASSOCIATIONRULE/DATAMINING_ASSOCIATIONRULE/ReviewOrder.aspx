<%@ Page Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="ReviewOrder.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.ReviewOrder" Title="Review Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .order-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .order-header {
            text-align: center;
            margin-bottom: 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .order-header h1 {
            margin: 0;
            font-size: 2.5rem;
            font-weight: 300;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        
        .cart-table-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.08);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .modern-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .modern-table th {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 18px 15px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 13px;
            border: none;
        }
        
        .modern-table td {
            padding: 18px 15px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            font-size: 14px;
            color: #333;
        }
        
        .modern-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .modern-table tr:hover {
            background-color: #f0f8ff;
            transform: translateY(-1px);
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        /* Specific column alignments */
        .modern-table td:first-child {
            text-align: center; /* Checkbox column */
            width: 80px;
        }
        
        .modern-table td:nth-child(2) {
            text-align: left; /* SubCategory column */
            font-weight: 500;
            padding-left: 20px;
        }
        
        .modern-table td:nth-child(3) {
            text-align: center; /* Item ID column */
            font-family: 'Courier New', monospace;
            font-weight: bold;
            color: #667eea;
            width: 100px;
        }
        
        .modern-table td:nth-child(4) {
            text-align: left; /* Item Name column */
            font-weight: 500;
            padding-left: 20px;
            color: #333;
        }
        
        .modern-table td:nth-child(5) {
            text-align: center; /* Quantity column */
            font-weight: 600;
            color: #4CAF50;
            width: 100px;
        }
        
        .modern-table td:nth-child(6) {
            text-align: right; /* Amount column */
            font-weight: 600;
            color: #f5576c;
            padding-right: 20px;
            font-size: 15px;
            width: 120px;
        }
        
        .item-checkbox {
            transform: scale(1.3);
            accent-color: #667eea;
        }
        
        .total-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px 20px;
            border-radius: 12px;
            margin: 25px 0;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.2);
        }
        
        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 12px 0;
            font-size: 16px;
            padding: 8px 0;
        }
        
        .total-row span:first-child {
            font-weight: 500;
        }
        
        .total-row span:last-child {
            font-weight: 700;
            font-size: 18px;
        }
        
        .total-final {
            font-size: 20px;
            font-weight: bold;
            border-top: 2px solid rgba(255,255,255,0.3);
            padding-top: 15px;
            margin-top: 15px;
            background: rgba(255,255,255,0.1);
            border-radius: 8px;
            padding: 15px;
        }
        
        .total-final span:first-child {
            font-size: 18px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .total-final span:last-child {
            font-size: 24px;
            font-weight: 900;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
        }
        
        .payment-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.08);
            padding: 30px;
            margin-top: 30px;
        }
        
        .payment-header {
            text-align: center;
            margin-bottom: 25px;
        }
        
        .payment-header h3 {
            color: #333;
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        
        .payment-options {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        
        .payment-option {
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            border: 2px solid #e0e0e0;
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
        }
        
        .payment-option:hover {
            border-color: #667eea;
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.15);
        }
        
        .payment-option.selected {
            border-color: #667eea;
            background: linear-gradient(135deg, #667eea15 0%, #764ba215 100%);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.2);
        }
        
        .payment-option input[type="radio"] {
            margin-bottom: 15px;
            transform: scale(1.3);
            accent-color: #667eea;
        }
        
        .payment-icon {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        .payment-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        
        .payment-desc {
            color: #666;
            font-size: 0.9rem;
        }
        
        .place-order-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 18px;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }
        
        .place-order-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }
        
        .qr-modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.8);
            backdrop-filter: blur(5px);
        }
        
        .qr-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            max-width: 400px;
            width: 90%;
        }
        
        .qr-code {
            width: 200px;
            height: 200px;
            margin: 20px auto;
            border: 3px solid #667eea;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(45deg, #f0f0f0 25%, transparent 25%), 
                        linear-gradient(-45deg, #f0f0f0 25%, transparent 25%), 
                        linear-gradient(45deg, transparent 75%, #f0f0f0 75%), 
                        linear-gradient(-45deg, transparent 75%, #f0f0f0 75%);
            background-size: 10px 10px;
            background-position: 0 0, 0 5px, 5px -5px, -5px 0px;
        }
        
        .qr-amount {
            font-size: 1.5rem;
            font-weight: bold;
            color: #667eea;
            margin: 15px 0;
        }
        
        .qr-timer {
            font-size: 1.2rem;
            color: #f5576c;
            font-weight: bold;
            margin: 15px 0;
        }
        
        .qr-timer.warning {
            color: #ff4444;
            animation: pulse 1s infinite;
        }
        
        @keyframes pulse {
            0% { opacity: 1; }
            50% { opacity: 0.5; }
            100% { opacity: 1; }
        }
        
        .qr-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 25px;
        }
        
        .qr-btn {
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .qr-btn.confirm {
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            color: white;
        }
        
        .qr-btn.cancel {
            background: linear-gradient(135deg, #f44336 0%, #da190b 100%);
            color: white;
        }
        
        .qr-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .empty-cart {
            text-align: center;
            padding: 50px;
            color: #f5576c;
            font-size: 1.5rem;
            font-weight: bold;
        }
        
        @media (max-width: 768px) {
            .payment-options {
                flex-direction: column;
                align-items: center;
            }
            
            .payment-option {
                max-width: 100%;
            }
            
            .modern-table {
                font-size: 12px;
            }
            
            .modern-table th,
            .modern-table td {
                padding: 8px 5px;
            }
        }
    </style>

    <asp:Panel ID="Panel1" runat="server">
        <div class="order-container">
            <!-- Header Section -->
            <div class="order-header">
                <h1>Review Your Order</h1>
                <p style="margin: 10px 0 0 0; opacity: 0.9;">Review your items before placing the order</p>
            </div>

            <!-- Main Content -->
            <asp:Panel ID="PanelOF" runat="server">
                <asp:Panel ID="PanelOF1" runat="server">
                    <asp:Panel ID="PnlCTab" runat="server" Visible="False">
                        <!-- Cart Table -->
                        <div class="cart-table-container">
                            <asp:Table ID="Table4" runat="server" CssClass="modern-table">
                            </asp:Table>
                        </div>

                        <!-- Payment Section -->
                        <div class="payment-section">
                            <div class="payment-header">
                                <h3>Choose Payment Method</h3>
                                <p style="color: #666;">Select your preferred payment option</p>
                            </div>
                            
                            <div class="payment-options">
                                <div class="payment-option" onclick="selectPayment('cod')">
                                    <input type="radio" name="paymentMethod" id="cod" value="cod" />
                                    <div class="payment-icon">🚚</div>
                                    <div class="payment-title">Cash on Delivery</div>
                                    <div class="payment-desc">Pay when your order arrives</div>
                                </div>
                                
                                <div class="payment-option" onclick="selectPayment('cod_upi')">
                                    <input type="radio" name="paymentMethod" id="cod_upi" value="cod_upi" />
                                    <div class="payment-icon">📱</div>
                                    <div class="payment-title">UPI on Delivery</div>
                                    <div class="payment-desc">Pay via UPI when delivered</div>
                                </div>
                                
                                <div class="payment-option" onclick="selectPayment('online_upi')">
                                    <input type="radio" name="paymentMethod" id="online_upi" value="online_upi" />
                                    <div class="payment-icon">
                                        <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
                                            <!-- Phone with payment waves -->
                                            <rect x="14" y="6" width="20" height="36" rx="4" fill="#4285F4" stroke="#1976D2" stroke-width="2"/>
                                            <rect x="16" y="10" width="16" height="24" fill="#E3F2FD"/>
                                            <circle cx="24" cy="37" r="2" fill="#E3F2FD"/>
                                            
                                            <!-- Payment waves/signals -->
                                            <path d="M6 20c4-2 8 2 12-2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                                            <path d="M6 24c4-2 8 2 12-2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                                            <path d="M6 28c4-2 8 2 12-2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                                            
                                            <path d="M30 20c4 2 8-2 12 2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                                            <path d="M30 24c4 2 8-2 12 2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                                            <path d="M30 28c4 2 8-2 12 2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                                            
                                            <!-- Payment symbol on phone -->
                                            <circle cx="24" cy="22" r="3" fill="#4CAF50"/>
                                            <path d="M22.5 22l1 1 2-2" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>
                                    </div>
                                    <div class="payment-title">Pay Online (UPI)</div>
                                    <div class="payment-desc">Pay now using UPI</div>
                                </div>
                            </div>
                            
                            <div style="text-align: center;">
                                <asp:Button ID="BtnPay" runat="server" onclick="BtnPay_Click" 
                                    Text="Place Order" CssClass="place-order-btn" />
                            </div>
                        </div>
                        
                        <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
                    </asp:Panel>
                    <asp:Label ID="LblCost" runat="server" Visible="False"></asp:Label>
                </asp:Panel>
            </asp:Panel>
        </div>

        <!-- QR Code Modal -->
        <div id="qrModal" class="qr-modal">
            <div class="qr-content">
                <div style="text-align: center; margin-bottom: 20px;">
                    <!-- Digital Payment Header -->
                    <div style="display: flex; align-items: center; justify-content: center; gap: 10px; margin-bottom: 15px;">
                        <svg width="40" height="40" viewBox="0 0 48 48" fill="none">
                            <!-- Phone with payment waves -->
                            <rect x="14" y="6" width="20" height="36" rx="4" fill="#4285F4" stroke="#1976D2" stroke-width="2"/>
                            <rect x="16" y="10" width="16" height="24" fill="#E3F2FD"/>
                            <circle cx="24" cy="37" r="2" fill="#E3F2FD"/>
                            
                            <!-- Payment waves/signals -->
                            <path d="M6 20c4-2 8 2 12-2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                            <path d="M6 24c4-2 8 2 12-2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                            <path d="M6 28c4-2 8 2 12-2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                            
                            <path d="M30 20c4 2 8-2 12 2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                            <path d="M30 24c4 2 8-2 12 2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                            <path d="M30 28c4 2 8-2 12 2" stroke="#FF6B35" stroke-width="2" stroke-linecap="round" fill="none"/>
                            
                            <!-- Payment symbol on phone -->
                            <circle cx="24" cy="22" r="3" fill="#4CAF50"/>
                            <path d="M22.5 22l1 1 2-2" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        <h3 style="color: #333; margin: 0; font-size: 1.5rem;">Mobile Payment</h3>
                    </div>
                    <p style="color: #666; margin: 0;">Scan with any UPI app to pay</p>
                </div>
                
                <!-- Enhanced QR Code Container -->
                <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 20px; margin: 20px 0;">
                    <div style="background: white; padding: 15px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                        <!-- Merchant Info Header -->
                        <div style="text-align: center; margin-bottom: 15px; padding-bottom: 10px; border-bottom: 2px solid #f0f0f0;">
                            <div style="font-weight: bold; color: #333; font-size: 14px;">E-Commerce Store</div>
                            <div style="color: #666; font-size: 12px;">merchant@upi</div>
                        </div>
                        
                        <!-- Realistic QR Code -->
                        <div style="display: flex; justify-content: center;">
                            <svg width="200" height="200" viewBox="0 0 200 200" style="border: 3px solid #00A652; border-radius: 12px; background: white;">
                                <!-- QR Code Pattern with UPI-style layout -->
                                <rect width="200" height="200" fill="white"/>
                                
                                <!-- Corner Detection Patterns -->
                                <rect x="10" y="10" width="35" height="35" fill="black"/>
                                <rect x="155" y="10" width="35" height="35" fill="black"/>
                                <rect x="10" y="155" width="35" height="35" fill="black"/>
                                
                                <rect x="15" y="15" width="25" height="25" fill="white"/>
                                <rect x="160" y="15" width="25" height="25" fill="white"/>
                                <rect x="15" y="160" width="25" height="25" fill="white"/>
                                
                                <rect x="20" y="20" width="15" height="15" fill="black"/>
                                <rect x="165" y="20" width="15" height="15" fill="black"/>
                                <rect x="20" y="165" width="15" height="15" fill="black"/>
                                
                                <!-- Timing Patterns -->
                                <rect x="55" y="20" width="5" height="5" fill="black"/>
                                <rect x="65" y="20" width="5" height="5" fill="black"/>
                                <rect x="75" y="20" width="5" height="5" fill="black"/>
                                <rect x="85" y="20" width="5" height="5" fill="black"/>
                                <rect x="95" y="20" width="5" height="5" fill="black"/>
                                <rect x="105" y="20" width="5" height="5" fill="black"/>
                                <rect x="115" y="20" width="5" height="5" fill="black"/>
                                <rect x="125" y="20" width="5" height="5" fill="black"/>
                                <rect x="135" y="20" width="5" height="5" fill="black"/>
                                <rect x="145" y="20" width="5" height="5" fill="black"/>
                                
                                <rect x="20" y="55" width="5" height="5" fill="black"/>
                                <rect x="20" y="65" width="5" height="5" fill="black"/>
                                <rect x="20" y="75" width="5" height="5" fill="black"/>
                                <rect x="20" y="85" width="5" height="5" fill="black"/>
                                <rect x="20" y="95" width="5" height="5" fill="black"/>
                                <rect x="20" y="105" width="5" height="5" fill="black"/>
                                <rect x="20" y="115" width="5" height="5" fill="black"/>
                                <rect x="20" y="125" width="5" height="5" fill="black"/>
                                <rect x="20" y="135" width="5" height="5" fill="black"/>
                                <rect x="20" y="145" width="5" height="5" fill="black"/>
                                
                                <!-- Center Alignment Pattern -->
                                <rect x="85" y="85" width="30" height="30" fill="black"/>
                                <rect x="90" y="90" width="20" height="20" fill="white"/>
                                <rect x="95" y="95" width="10" height="10" fill="black"/>
                                
                                <!-- Data Pattern Areas -->
                                <!-- Top-left data area -->
                                <rect x="55" y="30" width="5" height="5" fill="black"/>
                                <rect x="65" y="35" width="5" height="5" fill="black"/>
                                <rect x="55" y="40" width="5" height="5" fill="black"/>
                                <rect x="70" y="30" width="5" height="5" fill="black"/>
                                <rect x="75" y="40" width="5" height="5" fill="black"/>
                                
                                <rect x="55" y="50" width="5" height="5" fill="black"/>
                                <rect x="70" y="55" width="5" height="5" fill="black"/>
                                <rect x="55" y="60" width="5" height="5" fill="black"/>
                                <rect x="65" y="65" width="5" height="5" fill="black"/>
                                <rect x="75" y="50" width="5" height="5" fill="black"/>
                                
                                <!-- Top-right data area -->
                                <rect x="125" y="30" width="5" height="5" fill="black"/>
                                <rect x="135" y="35" width="5" height="5" fill="black"/>
                                <rect x="125" y="40" width="5" height="5" fill="black"/>
                                <rect x="145" y="30" width="5" height="5" fill="black"/>
                                <rect x="140" y="40" width="5" height="5" fill="black"/>
                                
                                <rect x="125" y="50" width="5" height="5" fill="black"/>
                                <rect x="140" y="55" width="5" height="5" fill="black"/>
                                <rect x="125" y="60" width="5" height="5" fill="black"/>
                                <rect x="135" y="65" width="5" height="5" fill="black"/>
                                <rect x="145" y="50" width="5" height="5" fill="black"/>
                                
                                <!-- Left side data -->
                                <rect x="30" y="55" width="5" height="5" fill="black"/>
                                <rect x="40" y="65" width="5" height="5" fill="black"/>
                                <rect x="30" y="75" width="5" height="5" fill="black"/>
                                <rect x="35" y="85" width="5" height="5" fill="black"/>
                                <rect x="40" y="95" width="5" height="5" fill="black"/>
                                <rect x="30" y="105" width="5" height="5" fill="black"/>
                                <rect x="45" y="115" width="5" height="5" fill="black"/>
                                
                                <!-- Right side data -->
                                <rect x="155" y="55" width="5" height="5" fill="black"/>
                                <rect x="165" y="65" width="5" height="5" fill="black"/>
                                <rect x="155" y="75" width="5" height="5" fill="black"/>
                                <rect x="170" y="85" width="5" height="5" fill="black"/>
                                <rect x="165" y="95" width="5" height="5" fill="black"/>
                                <rect x="155" y="105" width="5" height="5" fill="black"/>
                                <rect x="175" y="115" width="5" height="5" fill="black"/>
                                
                                <!-- Bottom data area -->
                                <rect x="55" y="125" width="5" height="5" fill="black"/>
                                <rect x="65" y="135" width="5" height="5" fill="black"/>
                                <rect x="75" y="125" width="5" height="5" fill="black"/>
                                <rect x="125" y="135" width="5" height="5" fill="black"/>
                                <rect x="135" y="125" width="5" height="5" fill="black"/>
                                <rect x="145" y="135" width="5" height="5" fill="black"/>
                                
                                <!-- Bottom-left area (avoiding corner) -->
                                <rect x="55" y="165" width="5" height="5" fill="black"/>
                                <rect x="65" y="175" width="5" height="5" fill="black"/>
                                <rect x="75" y="165" width="5" height="5" fill="black"/>
                                <rect x="70" y="180" width="5" height="5" fill="black"/>
                                
                                <!-- Bottom-right data -->
                                <rect x="125" y="165" width="5" height="5" fill="black"/>
                                <rect x="135" y="175" width="5" height="5" fill="black"/>
                                <rect x="145" y="165" width="5" height="5" fill="black"/>
                                <rect x="140" y="180" width="5" height="5" fill="black"/>
                                <rect x="130" y="185" width="5" height="5" fill="black"/>
                                
                                <!-- Additional scattered pattern for realism -->
                                <rect x="85" y="55" width="5" height="5" fill="black"/>
                                <rect x="95" y="65" width="5" height="5" fill="black"/>
                                <rect x="105" y="55" width="5" height="5" fill="black"/>
                                <rect x="85" y="135" width="5" height="5" fill="black"/>
                                <rect x="95" y="145" width="5" height="5" fill="black"/>
                                <rect x="105" y="135" width="5" height="5" fill="black"/>
                                
                                <!-- Format Information -->
                                <rect x="50" y="175" width="5" height="5" fill="black"/>
                                <rect x="175" y="50" width="5" height="5" fill="black"/>
                            </svg>
                        </div>
                        
                        <!-- Payment Details Footer -->
                        <div style="margin-top: 15px; padding-top: 10px; border-top: 2px solid #f0f0f0; text-align: center;">
                            <div style="font-size: 11px; color: #888; margin-bottom: 5px;">Powered by UPI</div>
                            <div style="font-size: 10px; color: #bbb;">Secure Payment Gateway</div>
                        </div>
                    </div>
                </div>
                
                <div id="qrTimerDiv" class="qr-timer">⏰ <span id="timer">00:30</span> remaining</div>
                
                <!-- UPI Apps Display -->
                <div style="text-align: center; margin: 20px 0;">
                    <p style="color: #666; margin-bottom: 10px; font-size: 13px;">Scan with any UPI app</p>
                    <div style="display: flex; justify-content: center; gap: 15px; flex-wrap: wrap;">
                        <!-- Google Pay -->
                        <div style="text-align: center;">
                            <div style="width: 35px; height: 35px; background: #4285f4; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 5px;">
                                <span style="color: white; font-weight: bold; font-size: 12px;">G</span>
                            </div>
                            <div style="font-size: 10px; color: #666;">GPay</div>
                        </div>
                        <!-- PhonePe -->
                        <div style="text-align: center;">
                            <div style="width: 35px; height: 35px; background: #5f259f; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 5px;">
                                <span style="color: white; font-weight: bold; font-size: 12px;">P</span>
                            </div>
                            <div style="font-size: 10px; color: #666;">PhonePe</div>
                        </div>
                        <!-- Paytm -->
                        <div style="text-align: center;">
                            <div style="width: 35px; height: 35px; background: #00baf2; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 5px;">
                                <span style="color: white; font-weight: bold; font-size: 12px;">P</span>
                            </div>
                            <div style="font-size: 10px; color: #666;">Paytm</div>
                        </div>
                        <!-- BHIM -->
                        <div style="text-align: center;">
                            <div style="width: 35px; height: 35px; background: #ff6b35; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 5px;">
                                <span style="color: white; font-weight: bold; font-size: 12px;">B</span>
                            </div>
                            <div style="font-size: 10px; color: #666;">BHIM</div>
                        </div>
                    </div>
                </div>
                
                <div class="qr-buttons">
                    <button class="qr-btn confirm" onclick="confirmPayment()">✅ Payment Done</button>
                    <button class="qr-btn cancel" onclick="cancelPayment()">❌ Cancel Payment</button>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Hidden field to store selected payment method -->
    <asp:HiddenField ID="hdnPaymentMethod" runat="server" />

    <script type="text/javascript">
        let selectedPaymentMethod = '';
        let timerInterval;
        let paymentProcessed = false;

        function selectPayment(method) {
            // Remove selected class from all options
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Add selected class to clicked option
            event.currentTarget.classList.add('selected');
            
            // Check the radio button
            document.getElementById(method).checked = true;
            selectedPaymentMethod = method;
            
            // Store in hidden field for server-side access
            document.getElementById('<%= hdnPaymentMethod.ClientID %>').value = method;
            
            console.log('Selected payment method:', method); // Debug log
        }

        // Page load event handler
        function pageLoad() {
            console.log('Page loaded, setting up event handlers'); // Debug log
            setupPlaceOrderButton();
        }

        function setupPlaceOrderButton() {
            const placeOrderBtn = document.getElementById('<%= BtnPay.ClientID %>');
            console.log('Place order button:', placeOrderBtn); // Debug log
            
            if (placeOrderBtn) {
                // Remove existing event listeners
                placeOrderBtn.onclick = function(e) {
                    console.log('Button clicked, selected method:', selectedPaymentMethod); // Debug log
                    
                    if (!selectedPaymentMethod) {
                        alert('Please select a payment method');
                        return false;
                    }
                    
                    if (selectedPaymentMethod === 'online_upi') {
                        console.log('Showing QR code'); // Debug log
                        showQRCode();
                        return false;
                    }
                    
                    // For COD and COD_UPI, allow normal postback
                    console.log('Proceeding with normal postback'); // Debug log
                    return true;
                };
            }
        }

        function showQRCode() {
            console.log('showQRCode called'); // Debug log
            const qrModal = document.getElementById('qrModal');
            
            if (qrModal) {
                qrModal.style.display = 'block';
                paymentProcessed = false;
                startTimer();
                console.log('QR modal displayed'); // Debug log
            } else {
                console.error('QR modal not found'); // Debug log
                alert('Error: QR modal not found');
            }
        }

        function closeQR() {
            const qrModal = document.getElementById('qrModal');
            if (qrModal) {
                qrModal.style.display = 'none';
            }
            if (timerInterval) {
                clearInterval(timerInterval);
            }
            // Reset timer display
            const timerElement = document.getElementById('timer');
            const timerDiv = document.getElementById('qrTimerDiv');
            if (timerElement) {
                timerElement.textContent = '00:30';
            }
            if (timerDiv) {
                timerDiv.classList.remove('warning');
            }
        }

        function startTimer() {
            let timeLeft = 30; // 30 seconds
            const timerElement = document.getElementById('timer');
            const timerDiv = document.getElementById('qrTimerDiv');
            
            timerInterval = setInterval(function() {
                const seconds = timeLeft;
                if (timerElement) {
                    timerElement.textContent = '00:' + seconds.toString().padStart(2, '0');
                }
                
                // Add warning class when less than 10 seconds
                if (timeLeft <= 10 && timerDiv) {
                    timerDiv.classList.add('warning');
                }
                
                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                    if (!paymentProcessed) {
                        alert('Payment time expired. Please try again.');
                        closeQR();
                    }
                    return;
                }
                timeLeft--;
            }, 1000);
        }

        function confirmPayment() {
            console.log('Payment confirmed'); // Debug log
            if (timerInterval) {
                clearInterval(timerInterval);
            }
            paymentProcessed = true;
            closeQR();
            
            // Show loading message
            alert('Processing payment...');
            
            // Trigger the actual order placement
            setTimeout(function() {
                console.log('Triggering postback for payment confirmation'); // Debug log
                __doPostBack('<%= BtnPay.UniqueID %>', 'online_payment_confirmed');
            }, 1000);
        }

        function cancelPayment() {
            console.log('Payment cancelled'); // Debug log
            if (timerInterval) {
                clearInterval(timerInterval);
            }
            paymentProcessed = true;
            closeQR();
            
            alert('Payment cancelled. Please try again or choose a different payment method.');
        }

        // Initialize on page load
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', pageLoad);
        } else {
            pageLoad();
        }

        // For ASP.NET UpdatePanel compatibility
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm) {
            prm.add_endRequest(function() {
                setupPlaceOrderButton();
            });
        }
    </script>
</asp:Content>