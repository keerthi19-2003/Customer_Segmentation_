<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Homepage.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Admin_Homepage" Title="Admin Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        
        <!-- Include Bootstrap and FontAwesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        
        <style>
            :root {
                --primary-color: #667eea;
                --secondary-color: #764ba2;
                --success-color: #28a745;
                --danger-color: #dc3545;
                --warning-color: #ffc107;
                --info-color: #17a2b8;
                --light-color: #f8f9fa;
                --dark-color: #343a40;
                --gradient: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            }

            body {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .main-container {
                padding: 2rem 1rem;
            }

            .dashboard-header {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-bottom: 2rem;
                border: 1px solid rgba(255, 255, 255, 0.2);
                max-width: none;
                width: 100%;
            }

            .welcome-card {
                background: var(--gradient);
                color: white;
                border-radius: 15px;
                padding: 1.5rem;
                margin-bottom: 2rem;
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
            }

            .stats-card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 1.5rem;
                margin-bottom: 1rem;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                border: 1px solid rgba(255, 255, 255, 0.2);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .stats-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            }

            .stats-icon {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                color: white;
                margin-bottom: 1rem;
            }

            .customers-table-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 2rem;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                border: 1px solid rgba(255, 255, 255, 0.2);
                width: 100%;
                margin: 0;
            }

            .modern-table {
                background: transparent;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: none;
                width: 100%;
                font-family: 'Arial', 'Helvetica', sans-serif;
                font-size: 14px;
                table-layout: fixed;
            }

            .modern-table thead {
                background: var(--gradient);
                color: white;
            }

            .modern-table th {
                border: none;
                padding: 1.2rem;
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.9rem;
                letter-spacing: 0.8px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .modern-table td {
                border: none;
                padding: 1.2rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                vertical-align: middle;
                font-family: 'Arial', 'Helvetica', sans-serif;
                font-size: 14px;
                line-height: 1.5;
            }

            .modern-table tbody tr {
                transition: all 0.3s ease;
            }

            .modern-table tbody tr:hover {
                background-color: rgba(102, 126, 234, 0.05);
                transform: scale(1.01);
            }

            .btn-modern {
                border-radius: 25px;
                padding: 0.5rem 1.5rem;
                font-weight: 500;
                border: none;
                transition: all 0.3s ease;
                text-transform: uppercase;
                font-size: 0.8rem;
                letter-spacing: 0.5px;
            }

            .btn-modern:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }

            .btn-delete {
                background: linear-gradient(45deg, #ff6b6b, #ee5a52);
                color: white;
            }

            .btn-delete:hover {
                background: linear-gradient(45deg, #ee5a52, #ff6b6b);
                color: white;
            }

            .customer-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background: var(--gradient);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: bold;
                margin-right: 0.75rem;
                font-size: 0.9rem;
            }

            .customer-info {
                display: flex;
                align-items: center;
            }

            .customer-details {
                flex: 1;
            }

            .customer-name {
                font-weight: 700;
                margin-bottom: 0.25rem;
                color: var(--dark-color);
                font-size: 16px;
                background: linear-gradient(45deg, #667eea, #764ba2);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                text-shadow: 0 2px 4px rgba(102, 126, 234, 0.1);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                letter-spacing: 0.3px;
            }

            .customer-email {
                font-size: 13px;
                color: #6c757d;
                font-family: 'Courier New', monospace;
                font-weight: 500;
            }

            .customer-address {
                font-size: 12px;
                color: #9ca3af;
                margin-top: 0.1rem;
                font-family: 'Arial', sans-serif;
                font-style: italic;
            }

            .no-data-container {
                text-align: center;
                padding: 3rem;
                color: #6c757d;
            }

            .no-data-icon {
                font-size: 4rem;
                margin-bottom: 1rem;
                opacity: 0.5;
            }

            .page-title {
                background: var(--gradient);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                font-weight: 700;
                margin-bottom: 0.5rem;
            }

            .live-time {
                color: #6c757d;
                font-size: 0.9rem;
            }

            .fade-in {
                animation: fadeIn 0.5s ease-in;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }

            /* Hide default ASP.NET table styling */
            .modern-table table {
                border-collapse: collapse;
                border-spacing: 0;
            }

            /* Style for popup tooltip */
            .customer-tooltip {
                position: relative;
                display: inline-block;
            }

            .customer-tooltip .tooltiptext {
                visibility: hidden;
                width: 300px;
                background-color: #333;
                color: #fff;
                text-align: left;
                border-radius: 8px;
                padding: 10px;
                position: absolute;
                z-index: 1000;
                bottom: 100%;
                left: 50%;
                margin-left: -150px;
                opacity: 0;
                transition: opacity 0.3s;
                font-size: 0.85rem;
                line-height: 1.4;
            }

            .customer-tooltip:hover .tooltiptext {
                visibility: visible;
                opacity: 1;
            }

            @media (max-width: 768px) {
                .dashboard-header {
                    padding: 1rem;
                }
                
                .customers-table-container {
                    padding: 1rem;
                }
                
                .modern-table {
                    font-size: 0.8rem;
                }
                
                .modern-table th,
                .modern-table td {
                    padding: 0.5rem;
                }
            }
        </style>

        <div class="container-fluid main-container">
            <!-- Dashboard Header -->
            <div class="dashboard-header fade-in">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h1 class="page-title">
                            <i class="fas fa-users-cog me-2"></i>
                            Administrator Dashboard
                        </h1>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <p class="live-time mb-0">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
                                </p>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-4 d-flex align-items-center justify-content-center">
                        <div class="welcome-card text-center">
                            <h5 class="mb-0">
                                <i class="fas fa-user-shield me-2"></i>
                                Welcome, Administrator
                            </h5>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="row mb-4 fade-in">
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon" style="background: linear-gradient(45deg, #667eea, #764ba2);">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3 class="mb-1" id="totalCustomers">0</h3>
                        <p class="text-muted mb-0">Total Customers</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon" style="background: linear-gradient(45deg, #28a745, #20c997);">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h3 class="mb-1" id="newToday">0</h3>
                        <p class="text-muted mb-0">Registered Users</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon" style="background: linear-gradient(45deg, #ffc107, #fd7e14);">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3 class="mb-1" id="activeRate">100%</h3>
                        <p class="text-muted mb-0">Active Rate</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon" style="background: linear-gradient(45deg, #dc3545, #e83e8c);">
                            <i class="fas fa-database"></i>
                        </div>
                        <h3 class="mb-1" id="totalRecords">0</h3>
                        <p class="text-muted mb-0">Total Records</p>
                    </div>
                </div>
            </div>

            <!-- Customers Table - Full Width -->
            <div class="customers-table-container fade-in">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="mb-0">
                        <i class="fas fa-users me-2"></i>
                        Customer Management
                    </h4>
                </div>

                <div class="table-responsive">
                    <asp:Table ID="Table1" runat="server" CssClass="modern-table table"></asp:Table>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        
        <script type="text/javascript">
            // Update customer count when page loads
            function updateStats() {
                try {
                    const table = document.getElementById('<%= Table1.ClientID %>');
                    if (table) {
                        const rows = table.getElementsByTagName('tr');
                        let customerCount = 0;
                        
                        // Count actual data rows (skip header)
                        for (let i = 1; i < rows.length; i++) {
                            if (rows[i].cells.length > 1) { // Make sure it's not the "no data" row
                                customerCount++;
                            }
                        }
                        
                        document.getElementById('totalCustomers').textContent = customerCount;
                        document.getElementById('newToday').textContent = customerCount;
                        document.getElementById('totalRecords').textContent = customerCount;
                    }
                } catch (e) {
                    console.log('Stats update error:', e);
                }
            }

            // Initialize page
            document.addEventListener('DOMContentLoaded', function() {
                updateStats();
                
                // Add fade-in animation to elements
                setTimeout(function() {
                    const fadeElements = document.querySelectorAll('.fade-in');
                    fadeElements.forEach(function(element) {
                        element.style.opacity = '1';
                        element.style.transform = 'translateY(0)';
                    });
                }, 100);
            });

            // Update stats after AJAX updates
            function pageLoad() {
                updateStats();
            }

            // Add this to handle UpdatePanel postbacks
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function() {
                updateStats();
            });
        </script>
    </asp:Panel>
</asp:Content>