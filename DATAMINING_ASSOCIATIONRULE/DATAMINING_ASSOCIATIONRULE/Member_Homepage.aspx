<%@ Page Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="Member_Homepage.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Member_Homepage" Title="Member Dashboard - Data Mining Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    .modern-header {
        text-align: center;
        margin-bottom: 30px;
        padding: 40px 20px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        position: relative;
        overflow: hidden;
    }

    .modern-header::before {
        content: '';
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
        animation: shine 3s infinite;
    }

    @keyframes shine {
        0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
        50% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        100% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
    }

    .modern-header h1 {
        font-size: 2.5rem;
        margin-bottom: 15px;
        text-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
        font-weight: 700;
        position: relative;
        z-index: 1;
    }

    .modern-header p {
        font-size: 1.2rem;
        opacity: 0.95;
        font-weight: 300;
        position: relative;
        z-index: 1;
    }

    .controls-panel {
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        border: 1px solid #f0f4f8;
    }

    .controls-panel h3 {
        color: #2d3748;
        margin-bottom: 25px;
        font-size: 1.4rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .controls-panel h3::before {
        content: '\f085';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        color: #667eea;
        font-size: 1.2rem;
    }

    .dropdown-container {
        position: relative;
        display: inline-block;
        width: 250px;
    }

    .dropdown-container::before {
        content: '\f0b0';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #667eea;
        z-index: 2;
        pointer-events: none;
    }

    .modern-dropdown {
        width: 100%;
        padding: 12px 20px 12px 45px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 1rem;
        background: white;
        transition: all 0.3s ease;
        appearance: none;
        cursor: pointer;
        font-weight: 500;
        color: #2d3748;
    }

    .modern-dropdown:focus {
        border-color: #667eea;
        outline: none;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        transform: translateY(-1px);
    }

    .modern-dropdown:hover {
        border-color: #cbd5e0;
        transform: translateY(-1px);
    }

    .dropdown-container::after {
        content: '\f078';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #a0aec0;
        pointer-events: none;
        transition: transform 0.3s ease;
    }

    .dropdown-container:hover::after {
        transform: translateY(-50%) rotate(180deg);
    }

    .modern-button {
        background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        color: white;
        border: none;
        padding: 12px 30px;
        border-radius: 12px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-left: 15px;
        box-shadow: 0 4px 15px rgba(255, 107, 107, 0.2);
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .modern-button::before {
        content: '\f1d8';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
    }

    .modern-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(255, 107, 107, 0.3);
        background: linear-gradient(135deg, #ff5252 0%, #d32f2f 100%);
    }

    .control-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 15px;
        flex-wrap: wrap;
        margin-bottom: 20px;
    }

    .control-label {
        font-weight: 600;
        color: #4a5568;
        font-size: 1.1rem;
        display: flex;
        align-items: center;
        gap: 8px;
        min-width: 150px;
    }

    .control-label::before {
        content: '\f02b';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        color: #667eea;
    }

    .validation-error {
        color: #e53e3e;
        font-size: 0.9rem;
        margin-left: 10px;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }

    .validation-error::before {
        content: '\f071';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
    }

    .data-tables-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-top: 30px;
    }

    .table-section {
        background: white;
        border-radius: 15px;
        padding: 25px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
        border: 1px solid #f0f4f8;
    }

    .table-section h4 {
        margin-bottom: 20px;
        color: #2d3748;
        font-size: 1.3rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 10px;
        border-bottom: 2px solid #e2e8f0;
        padding-bottom: 15px;
    }

    .table-section h4::before {
        content: '\f0ce';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        color: #667eea;
    }

    .results-section {
        grid-column: 1 / -1;
        margin-top: 20px;
    }

    .results-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-top: 20px;
    }

    .modern-table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    }

    .modern-table th {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 15px 12px;
        text-align: left;
        font-weight: 600;
        font-size: 0.95rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .modern-table td {
        padding: 12px;
        border-bottom: 1px solid #e2e8f0;
        color: #4a5568;
        font-size: 0.95rem;
    }

    .modern-table tr:hover {
        background-color: #f7fafc;
    }

    .modern-table tr:last-child td {
        border-bottom: none;
    }

    .recommendations-section {
        grid-column: 1 / -1;
        background: white;
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
        border: 1px solid #f0f4f8;
    }

    .recommendations-section h3 {
        color: #2d3748;
        margin-bottom: 25px;
        font-size: 1.5rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 12px;
        border-bottom: 3px solid #667eea;
        padding-bottom: 15px;
    }

    .recommendations-section h3::before {
        content: '\f0a1';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        color: #667eea;
        font-size: 1.3rem;
    }

    .no-data-message {
        text-align: center;
        color: #a0aec0;
        font-size: 1.1rem;
        padding: 40px 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }

    .no-data-message::before {
        content: '\f119';
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        font-size: 2rem;
        color: #e2e8f0;
    }

    @media (max-width: 768px) {
        .data-tables-container {
            grid-template-columns: 1fr;
            gap: 20px;
        }
        
        .results-grid {
            grid-template-columns: 1fr;
        }
        
        .control-row {
            flex-direction: column;
            align-items: stretch;
            text-align: center;
        }
        
        .dropdown-container,
        .modern-button {
            width: 100%;
            margin: 5px 0;
        }
    }

    .loading-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        align-items: center;
        justify-content: center;
    }

    .loading-spinner {
        color: white;
        font-size: 2rem;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
</style>

<div class="loading-overlay" id="loadingOverlay">
    <i class="fas fa-spinner loading-spinner"></i>
</div>

<asp:Panel ID="Panel1" runat="server" style="text-align: left">
    
    <div class="modern-header">
        <h1><i class="fas fa-chart-line"></i> Welcome to Member Dashboard</h1>
        <p>Discover personalized product recommendations using advanced data mining algorithms</p>
    </div>

    <div class="container">
        <div class="controls-panel">
            <h3>Analysis Constraints Configuration</h3>
            
            <div class="control-row">
                <label class="control-label">Select Constraint:</label>
                <div class="dropdown-container">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="modern-dropdown">
                        <asp:ListItem Value="">Choose Analysis Type</asp:ListItem>
                        <asp:ListItem Value="All">All Customers</asp:ListItem>
                        <asp:ListItem Value="Gender">Gender-Based</asp:ListItem>
                        <asp:ListItem Value="Age">Age Group</asp:ListItem>
                        <asp:ListItem Value="Martial Status">Marital Status</asp:ListItem>
                        <asp:ListItem Value="Education">Education Level</asp:ListItem>
                        <asp:ListItem Value="Occupation">Occupation Type</asp:ListItem>
                        <asp:ListItem Value="Income">Income Range</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="Please select a constraint" 
                    Operator="NotEqual" ToolTip="Select Constraint" ValidationGroup="pattern" 
                    ValueToCompare="" CssClass="validation-error"></asp:CompareValidator>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Analyze Data" 
                    ValidationGroup="pattern" CssClass="modern-button" />
            </div>
        </div>

        <asp:Panel ID="Panel3" runat="server">
            <div class="data-tables-container">
                <div class="table-section">
                    <h4><i class="fas fa-list"></i> Item Dataset</h4>
                    <div style="max-height: 400px; overflow-y: auto;">
                        <asp:Table ID="Table1" runat="server" CssClass="modern-table"></asp:Table>
                    </div>
                </div>
                
                <div class="table-section">
                    <h4><i class="fas fa-exchange-alt"></i> Transaction Dataset</h4>
                    <div style="max-height: 400px; overflow-y: auto;">
                        <asp:Table ID="Table2" runat="server" CssClass="modern-table"></asp:Table>
                    </div>
                </div>
                
                <div class="results-section">
                    <div class="results-grid">
                        <div class="table-section">
                            <h4><i class="fas fa-star"></i> Frequent Itemsets</h4>
                            <div style="max-height: 400px; overflow-y: auto;">
                                <asp:Table ID="Table3" runat="server" CssClass="modern-table"></asp:Table>
                            </div>
                        </div>
                        
                        <div class="table-section">
                            <h4><i class="fas fa-arrow-right"></i> Association Rules</h4>
                            <div style="max-height: 400px; overflow-y: auto;">
                                <asp:Table ID="Table4" runat="server" CssClass="modern-table"></asp:Table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <div class="recommendations-section">
            <h3>Personalized Product Recommendations</h3>
            <asp:Table ID="Table5" runat="server"></asp:Table>
        </div>
        
        <asp:Panel ID="Panel2" runat="server" Height="400px" Visible="False" Width="100%">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 20px;">
                <div>
                    <h4 style="margin-bottom: 10px; color: #4a5568;"><i class="fas fa-cube"></i> Items</h4>
                    <asp:ListBox ID="lv_Items" runat="server" Height="175px" Width="100%" 
                        style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 10px;"></asp:ListBox>
                    
                    <h4 style="margin: 20px 0 10px 0; color: #4a5568;"><i class="fas fa-cubes"></i> Frequent Items</h4>
                    <asp:ListBox ID="ListBox1" runat="server" Height="161px" Width="100%" 
                        style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 10px;"></asp:ListBox>
                </div>
                
                <div>
                    <h4 style="margin-bottom: 10px; color: #4a5568;"><i class="fas fa-receipt"></i> Transactions</h4>
                    <asp:ListBox ID="lv_Transactions" runat="server" Height="175px" Width="100%" 
                        style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 10px;"></asp:ListBox>
                    
                    <h4 style="margin: 20px 0 10px 0; color: #4a5568;"><i class="fas fa-sitemap"></i> Association Rules</h4>
                    <asp:ListBox ID="ListBox2" runat="server" Height="161px" Width="100%" 
                        style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 10px;"></asp:ListBox>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Panel>

<script>
    function showLoading() {
        document.getElementById('loadingOverlay').style.display = 'flex';
    }
    
    function hideLoading() {
        document.getElementById('loadingOverlay').style.display = 'none';
    }
    
    // Add loading animation to submit button
    document.addEventListener('DOMContentLoaded', function() {
        const submitBtn = document.querySelector('input[type="submit"]');
        if (submitBtn) {
            submitBtn.addEventListener('click', function() {
                if (Page_IsValid) {
                    showLoading();
                }
            });
        }
    });
    
    // Hide loading when page loads
    window.addEventListener('load', function() {
        hideLoading();
    });
</script>

</asp:Content>