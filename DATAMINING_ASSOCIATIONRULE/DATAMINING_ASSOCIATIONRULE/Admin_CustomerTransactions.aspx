<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_CustomerTransactions.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Admin_CustomerTransactions" Title="Customer Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    /* Modern styling for the admin page */
    .admin-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f8f9fa;
        min-height: 100vh;
    }
    
    .page-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 30px;
        border-radius: 12px;
        margin-bottom: 30px;
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.15);
    }
    
    .page-header h1 {
        margin: 0;
        font-size: 28px;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 12px;
    }
    
    .page-header h1::before {
        content: "📋";
        font-size: 24px;
    }
    
    .filter-section {
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        margin-bottom: 25px;
        border: 1px solid #e9ecef;
    }
    
    .filter-row {
        display: flex;
        align-items: center;
        gap: 15px;
        flex-wrap: wrap;
    }
    
    .filter-label {
        font-weight: 600;
        color: #495057;
        font-size: 14px;
        min-width: 100px;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    
    .filter-label::before {
        content: "🔽";
        font-size: 12px;
        opacity: 0.7;
    }
    
    /* Enhanced Dropdown Styling */
    .modern-dropdown {
        position: relative;
        padding: 12px 45px 12px 20px;
        border: 2px solid #e9ecef;
        border-radius: 10px;
        font-size: 14px;
        font-weight: 500;
        background: linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%);
        color: #495057;
        min-width: 220px;
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
        cursor: pointer;
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
    }
    
    .modern-dropdown:hover {
        border-color: #667eea;
        background: linear-gradient(145deg, #f8f9ff 0%, #ffffff 100%);
        transform: translateY(-1px);
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.15);
    }
    
    .modern-dropdown:focus {
        outline: none;
        border-color: #667eea;
        background: linear-gradient(145deg, #f8f9ff 0%, #ffffff 100%);
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.15);
        transform: translateY(-2px);
    }
    
    /* Custom dropdown arrow */
    .modern-dropdown {
        background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23667eea' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");
        background-repeat: no-repeat;
        background-position: right 15px center;
        background-size: 12px;
    }
    
    .data-section {
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        overflow: hidden;
        border: 1px solid #e9ecef;
    }
    
    .modern-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }
    
    .table-header {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        font-weight: 600;
        color: #495057;
    }
    
    .table-header-row td {
        padding: 15px 12px;
        border-bottom: 2px solid #dee2e6;
        text-align: center;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    /* Transaction ID Column Centering */
    .transaction-id-header {
        text-align: center !important;
        width: 140px;
    }
    
    .transaction-id-cell {
        text-align: center !important;
        font-weight: 700;
        font-size: 14px;
        color: #667eea;
        background: linear-gradient(145deg, #f8f9ff 0%, #ffffff 100%);
        border-right: 2px solid #f1f3f4;
    }
    
    .table-divider {
        display: none; /* Hide the old HR dividers */
    }
    
    .table-row td {
        padding: 15px 12px;
        border-bottom: 1px solid #f1f3f4;
        text-align: center;
        vertical-align: middle;
        transition: all 0.3s ease;
    }
    
    .table-row:hover td {
        background: #f8f9fa;
    }
    
    /* Different row styling for pending and dispatched orders */
    .pending-row {
        border-left: 4px solid #ffc107;
        background: linear-gradient(90deg, rgba(255, 193, 7, 0.05) 0%, rgba(255, 255, 255, 1) 100%);
    }
    
    .pending-row:hover {
        background: linear-gradient(90deg, rgba(255, 193, 7, 0.1) 0%, rgba(248, 249, 250, 1) 100%) !important;
        box-shadow: 0 2px 8px rgba(255, 193, 7, 0.1);
    }
    
    .dispatched-row {
        border-left: 4px solid #28a745;
        background: linear-gradient(90deg, rgba(40, 167, 69, 0.05) 0%, rgba(255, 255, 255, 1) 100%);
    }
    
    .dispatched-row:hover {
        background: linear-gradient(90deg, rgba(40, 167, 69, 0.1) 0%, rgba(248, 249, 250, 1) 100%) !important;
        box-shadow: 0 2px 8px rgba(40, 167, 69, 0.1);
    }
    
    .customer-info {
        max-width: 200px;
        position: relative;
        text-align: left !important;
    }
    
    .customer-info a {
        color: #667eea;
        text-decoration: none;
        font-weight: 500;
        display: block;
        padding: 8px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    
    .customer-info a:hover {
        background: #f8f9fa;
        color: #5a6acf;
    }
    
    .customer-info span {
        position: absolute;
        background: #343a40;
        color: white;
        padding: 12px;
        border-radius: 8px;
        font-size: 12px;
        white-space: nowrap;
        z-index: 1000;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        top: 100%;
        left: 50%;
        transform: translateX(-50%);
        margin-top: 5px;
    }
    
    .customer-info a:hover span {
        opacity: 1;
        visibility: visible;
    }
    
    .status-badge {
        padding: 8px 16px;
        border-radius: 25px;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        display: inline-flex;
        align-items: center;
        gap: 6px;
        transition: all 0.3s ease;
    }
    
    .status-icon {
        font-size: 14px;
    }
    
    /* Enhanced status styling */
    .status-pending {
        background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
        color: #856404;
        border: 2px solid #ffeaa7;
        box-shadow: 0 2px 8px rgba(255, 193, 7, 0.2);
    }
    
    .status-pending:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(255, 193, 7, 0.3);
    }
    
    .status-dispatched {
        background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
        color: #155724;
        border: 2px solid #c3e6cb;
        box-shadow: 0 2px 8px rgba(40, 167, 69, 0.2);
    }
    
    .status-dispatched:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(40, 167, 69, 0.3);
    }
    
    .status-default {
        background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
        color: #495057;
        border: 2px solid #dee2e6;
        box-shadow: 0 2px 8px rgba(108, 117, 125, 0.2);
    }
    
    .modern-button {
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        font-size: 12px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }
    
    .btn-success {
        background: linear-gradient(135deg, #56ab2f 0%, #a8e6cf 100%);
        color: white;
    }
    
    .btn-success:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(86, 171, 47, 0.3);
    }
    
    .btn-danger {
        background: linear-gradient(135deg, #ff6b6b 0%, #ffeaa7 100%);
        color: white;
    }
    
    .btn-danger:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
    }
    
    .dispatched-label {
        color: #28a745;
        font-weight: 600;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .pagination-section {
        background: white;
        padding: 20px;
        margin-top: 20px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        border: 1px solid #e9ecef;
    }
    
    .pagination-controls {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 20px;
    }
    
    .pagination-info {
        font-weight: 600;
        color: #495057;
        font-size: 14px;
    }
    
    .pagination-buttons {
        display: flex;
        gap: 10px;
    }
    
    .nav-button {
        padding: 10px 20px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
    }
    
    .nav-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        color: white;
        text-decoration: none;
    }
    
    .no-records {
        text-align: center;
        padding: 60px 20px;
        color: #6c757d;
        font-size: 16px;
        background: white;
        border-radius: 12px;
    }
    
    .no-records::before {
        content: "📄";
        font-size: 48px;
        display: block;
        margin-bottom: 20px;
        opacity: 0.5;
    }
    
    /* Transaction Details View Styles */
    .detail-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 25px;
        border-radius: 12px 12px 0 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .detail-header h2 {
        margin: 0;
        font-size: 24px;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 12px;
    }
    
    .detail-header h2::before {
        content: "🔍";
        font-size: 20px;
    }
    
    .back-button {
        background: rgba(255, 255, 255, 0.2);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.3);
        padding: 10px 20px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
    }
    
    .back-button:hover {
        background: rgba(255, 255, 255, 0.3);
        color: white;
        text-decoration: none;
        transform: translateY(-2px);
    }
    
    .detail-notice {
        background: #e7f3ff;
        border: 1px solid #b8e2ff;
        color: #0056b3;
        padding: 15px;
        border-radius: 8px;
        margin: 20px;
        font-size: 13px;
        font-weight: 500;
    }
    
    .detail-notice::before {
        content: "ℹ️";
        margin-right: 8px;
    }
    
    .item-image {
        width: 40px;
        height: 40px;
        border-radius: 8px;
        object-fit: cover;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    
    .item-info a {
        color: #667eea;
        text-decoration: none;
        font-weight: 500;
        position: relative;
        display: inline-block;
        padding: 8px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    
    .item-info a:hover {
        background: #f8f9fa;
        color: #5a6acf;
    }
    
    .item-info span {
        position: absolute;
        background: #343a40;
        color: white;
        padding: 12px;
        border-radius: 8px;
        font-size: 12px;
        white-space: nowrap;
        z-index: 1000;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        top: 100%;
        left: 50%;
        transform: translateX(-50%);
        margin-top: 5px;
    }
    
    .item-info a:hover span {
        opacity: 1;
        visibility: visible;
    }
    
    .total-section {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 0 0 12px 12px;
        border-top: 2px solid #e9ecef;
    }
    
    .total-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #e9ecef;
    }
    
    .total-row:last-child {
        border-bottom: none;
        font-weight: 700;
        font-size: 16px;
        color: #495057;
    }
    
    .payment-section {
        background: #fff8e1;
        border: 1px solid #ffe082;
        margin: 20px;
        padding: 20px;
        border-radius: 8px;
    }
    
    .payment-title {
        color: #ff8f00;
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .payment-title::before {
        content: "💳";
        font-size: 16px;
    }
    
    /* Status-based row animations */
    .pending-row {
        animation: pendingPulse 3s ease-in-out infinite;
    }
    
    @keyframes pendingPulse {
        0%, 100% { 
            border-left-color: #ffc107; 
        }
        50% { 
            border-left-color: #ff8f00; 
        }
    }
    
    .dispatched-row {
        animation: dispatchedGlow 2s ease-in-out infinite alternate;
    }
    
    @keyframes dispatchedGlow {
        from { 
            border-left-color: #28a745; 
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.1);
        }
        to { 
            border-left-color: #20c997; 
            box-shadow: 0 0 15px rgba(40, 167, 69, 0.2);
        }
    }
    
    /* Responsive design */
    @media (max-width: 768px) {
        .admin-container {
            padding: 10px;
        }
        
        .page-header h1 {
            font-size: 22px;
        }
        
        .filter-row {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .modern-dropdown {
            min-width: 100%;
        }
        
        .pagination-controls {
            flex-direction: column;
            gap: 15px;
        }
        
        .modern-table {
            font-size: 12px;
        }
        
        .table-header-row td,
        .table-row td {
            padding: 10px 8px;
        }
        
        .customer-info {
            max-width: 150px;
        }
        
        .transaction-id-cell {
            font-size: 12px;
        }
        
        .status-badge {
            padding: 6px 12px;
            font-size: 10px;
        }
    }
</style>

<div class="admin-container">
    <asp:Panel ID="Panel1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div class="page-header">
                    <h1>Customer Transactions</h1>
                </div>
                
                <div class="filter-section">
                    <asp:Panel ID="PanelOr2" runat="server">
                        <div class="filter-row">
                            <label class="filter-label">Filter by Status:</label>
                            <asp:DropDownList ID="DDListO_Status" runat="server" 
                                CssClass="modern-dropdown"
                                AutoPostBack="True" 
                                onselectedindexchanged="DDListO_Status_SelectedIndexChanged" 
                                ValidationGroup="Or">
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Dispatched</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </asp:Panel>
                </div>

                <div class="data-section">
                    <asp:Table ID="TableOr" runat="server" CssClass="modern-table">
                    </asp:Table>
                </div>

                <asp:Panel ID="PnlOrBtns" runat="server" Visible="False" CssClass="pagination-section">
                    <div class="pagination-controls">
                        <asp:LinkButton ID="LBtnOPrev" runat="server" onclick="LBtnOPrev_Click" CssClass="nav-button">
                            ← Previous
                        </asp:LinkButton>
                        <div class="pagination-info">
                            <asp:Label ID="LblMsg_order" runat="server" Font-Bold="True"></asp:Label>
                        </div>
                        <asp:LinkButton ID="LBtnNext" runat="server" onclick="LBtnNext_Click" CssClass="nav-button">
                            Next →
                        </asp:LinkButton>
                    </div>
                </asp:Panel>
            </asp:View>
            
            <asp:View ID="View2" runat="server">
                <div class="data-section">
                    <div class="detail-header">
                        <h2>Transaction Details</h2>
                        <asp:LinkButton ID="LBtn_Back" runat="server" onclick="LBtn_Back_Click" CssClass="back-button">
                            ← Back to List
                        </asp:LinkButton>
                    </div>
                    
                    <div class="detail-notice">
                        <strong>Tip:</strong> Hover over items to see additional details including available quantity
                    </div>
                    
                    <asp:Table ID="TableOrD" runat="server" CssClass="modern-table">
                    </asp:Table>
                </div>
            </asp:View>
        </asp:MultiView>
    </asp:Panel>
</div>

<script type="text/javascript">
    // Enhanced user experience scripts
    document.addEventListener('DOMContentLoaded', function() {
        // Add loading states for buttons
        const buttons = document.querySelectorAll('.modern-button, .nav-button');
        buttons.forEach(button => {
            button.addEventListener('click', function() {
                const originalText = this.textContent;
                this.textContent = 'Loading...';
                this.style.opacity = '0.7';
                
                setTimeout(() => {
                    this.textContent = originalText;
                    this.style.opacity = '1';
                }, 2000);
            });
        });

        // Smooth scrolling for navigation
        const navButtons = document.querySelectorAll('.nav-button');
        navButtons.forEach(button => {
            button.addEventListener('click', function() {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });
        });

        // Enhanced dropdown interaction
        const dropdown = document.querySelector('.modern-dropdown');
        if (dropdown) {
            dropdown.addEventListener('change', function() {
                this.style.transform = 'scale(0.98)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 150);
            });
        }

        // Add status badge hover effects
        const statusBadges = document.querySelectorAll('.status-badge');
        statusBadges.forEach(badge => {
            badge.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.05)';
            });
            badge.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
            });
        });
    });
</script>
</asp:Content>