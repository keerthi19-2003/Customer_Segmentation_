<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="BrowseItems.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.BrowseItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            min-height: 100vh;
            color: #333;
        }
        .modern-container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 0 1rem;
        }
        .page-header {
            background: #83b735;
            padding: 1.5rem;
            border-bottom: none;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .page-title {
            text-align: center;
            font-size: 2rem;
            font-weight: 600;
            color: white;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        .filters-container {
            background: white;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid #e0e0e0;
        }
        .filters-row {
            display: flex;
            gap: 2rem;
            flex-wrap: wrap;
        }
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            min-width: 220px;
            flex: 1;
        }
        .filter-label {
            font-weight: 600;
            color: #555;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }
        .filter-label i {
            margin-right: 8px;
            color: #83b735;
        }
        .modern-dropdown {
            padding: 12px 16px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            background: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            appearance: none;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%2383b735' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 12px center;
            background-repeat: no-repeat;
            background-size: 16px;
            padding-right: 40px;
            width: 100%;
        }
        .modern-dropdown:hover {
            border-color: #83b735;
            box-shadow: 0 0 0 3px rgba(131,183,53,0.15);
        }
        .modern-dropdown:focus {
            outline: none;
            border-color: #83b735;
            box-shadow: 0 0 0 3px rgba(131,183,53,0.25);
        }
        .flipkart-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 1rem;
        }
        .flipkart-table tr {
            display: flex;
            flex-wrap: wrap;
        }
        .flipkart-table td {
            flex: 1 1 30%;
            min-width: 280px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 1rem;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        .flipkart-table td:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            border-color: #83b735;
        }
        .flipkart-table table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        .flipkart-table table td {
            background: none !important;
            box-shadow: none !important;
            border: none !important;
            padding: 8px !important;
            flex: none !important;
            min-width: auto !important;
            border-radius: 0 !important;
            vertical-align: top !important;
        }
        .flipkart-table table td:hover {
            transform: none !important;
        }
        .flipkart-table table tr:first-child td {
            padding: 12px 8px !important;
            text-align: left !important;
        }
        .flipkart-table table tr:nth-child(2) td:first-child {
            width: 100px !important;
            text-align: center !important;
            padding: 8px !important;
        }
        .flipkart-table table tr:nth-child(2) td:last-child {
            text-align: right !important;
            vertical-align: top !important;
            padding: 8px 12px !important;
            position: relative;
        }
        .flipkart-table font[color="#993366"] {
            color: #27ae60 !important;
            font-weight: 800 !important;
            font-size: 1.3rem !important;
            text-shadow: 0 1px 2px rgba(39, 174, 96, 0.2);
            display: inline-block !important;
            padding: 6px 12px !important;
            background: rgba(39, 174, 96, 0.1) !important;
            border-radius: 8px !important;
            border: 1px solid rgba(39, 174, 96, 0.3) !important;
            margin: 0 !important;
            white-space: nowrap !important;
        }
        .flipkart-table font[color="#993366"]::before {
            content: '₹ ';
            font-weight: 600;
        }
        .flipkart-table table tr:nth-child(3),
        .flipkart-table table tr:nth-child(4) {
            width: 100%;
        }
        .flipkart-table table tr:nth-child(3) td,
        .flipkart-table table tr:nth-child(4) td {
            text-align: right !important;
            padding: 4px 12px !important;
            width: 100% !important;
        }
        .flipkart-table a,
        .flipkart-table a:visited {
            display: inline-block !important;
            width: 150px !important;
            margin: 4px 0 !important;
            padding: 12px 16px !important;
            border-radius: 8px !important;
            text-decoration: none !important;
            font-weight: 600 !important;
            font-size: 0.85rem !important;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
            border: none !important;
            text-transform: uppercase !important;
            letter-spacing: 0.5px !important;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15) !important;
            position: relative !important;
            overflow: hidden !important;
            text-align: center !important;
            float: right !important;
            clear: right !important;
        }
        .flipkart-table img {
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .flipkart-table td:hover img {
            transform: scale(1.05);
        }
        .flipkart-table font[color="#006699"] {
            color: #2c3e50 !important;
            font-weight: 600 !important;
            font-size: 1rem !important;
            line-height: 1.4;
        }
        .flipkart-table font[color="#993366"] {
            color: #27ae60 !important;
            font-weight: 800 !important;
            font-size: 1.3rem !important;
            text-shadow: 0 1px 2px rgba(39, 174, 96, 0.2);
            display: inline-block;
            padding: 4px 8px;
            background: rgba(39, 174, 96, 0.1);
            border-radius: 6px;
            border: 1px solid rgba(39, 174, 96, 0.2);
            float: right;
            margin-right: 10px;
            margin-top: 5px;
        }
        .flipkart-table font[color="#993366"]::before {
            content: '₹ ';
            font-weight: 600;
        }
        .flipkart-table table tr:nth-child(2) td:last-child::after {
            content: '';
            display: block;
            clear: both;
        }
        .flipkart-table table tr:nth-child(3) td,
        .flipkart-table table tr:last-child td {
            text-align: right !important;
            padding: 8px 12px !important;
            vertical-align: top !important;
        }
        .flipkart-table table tr:nth-child(4) td {
            text-align: right !important;
            padding: 4px 12px !important;
        }
        .flipkart-table a {
            display: block;
            width: 140px;
            margin: 4px 0 4px auto;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none !important;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: none;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        .flipkart-table a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.20);
            transition: left 0.5s;
        }
        .flipkart-table a:hover::before {
            left: 100%;
        }
        .flipkart-table a[id*="_101"] {
            background: black !important;
            color: white !important;
            box-shadow: 0 4px 15px rgba(0,0,0,0.4);
        }
        .flipkart-table a[id*="_101"]:hover {
            background: #222 !important;
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 8px 25px rgba(0,0,0,0.5);
        }
        .flipkart-table a[id*="_101"] font::before {
            content: '\f07a  ';
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 6px;
        }
        .flipkart-table a[id*="_0"] {
            background: #83b735 !important;
            color: white !important;
            box-shadow: 0 4px 15px rgba(131, 183, 53, 0.35);
        }
        .flipkart-table a[id*="_0"]:hover {
            background: #6fa91c !important;
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 8px 25px rgba(131, 183, 53, 0.45);
            text-decoration: none !important;
        }
        .flipkart-table a[id*="_0"] font::before {
            content: '\f06e  ';
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 6px;
        }
        .flipkart-table a, 
        .flipkart-table a:hover, 
        .flipkart-table a:focus, 
        .flipkart-table a:active {
            text-decoration: none !important;
        }
        .flipkart-table a font {
            text-decoration: none !important;
        }
        .flipkart-table input[type="image"] {
            display: none !important;
        }
        .flipkart-table a:disabled,
        .flipkart-table a[disabled] {
            background: #bdc3c7 !important;
            color: #7f8c8d !important;
            cursor: not-allowed;
            box-shadow: none;
        }
        .pagination-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            margin: 2rem 0;
            padding: 1.5rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        .pagination-info {
            background: #83b735;
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(131,183,53,0.3);
        }
        .pagination-btn {
            background: white;
            border: 2px solid #e0e0e0;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .pagination-btn:hover {
            background: #83b735;
            border-color: #83b735;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(131,183,53,0.3);
        }
        .pagination-btn:hover img {
            filter: brightness(0) invert(1);
        }
        .flipkart-table .no-items {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffeaa7;
            padding: 2rem;
            text-align: center;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1.1rem;
        }
        @media (max-width: 768px) {
            .flipkart-table td { 
                flex: 1 1 45%; 
                min-width: 250px;
            }
            .filters-row {
                flex-direction: column;
                gap: 1rem;
            }
            .pagination-container {
                padding: 1rem;
                gap: 0.5rem;
            }
        }
        @media (max-width: 480px) {
            .flipkart-table td { 
                flex: 1 1 100%; 
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="page-header">
            <div class="modern-container">
                <h1 class="page-title">Browse Products</h1>
            </div>
        </div>

        <div class="modern-container">
            <!-- Filters -->
            <div class="filters-container">
                <div class="filters-row">
                    <div class="filter-group">
                        <label class="filter-label">
                            <i class="fas fa-tags"></i>
                            Category
                        </label>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="modern-dropdown"
                            AutoPostBack="True" 
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">
                            <i class="fas fa-layer-group"></i>
                            Subcategory
                        </label>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            CssClass="modern-dropdown"
                            AutoPostBack="True" 
                            OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Products Table -->
            <asp:Table ID="Table1" runat="server" CssClass="flipkart-table"></asp:Table>

            <!-- Pagination -->
            <div class="pagination-container">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    CssClass="pagination-btn" 
                    ImageUrl="~/images/prevlabel.gif" 
                    OnClick="ImageButton1_Click" 
                    AlternateText="Previous" />
                <asp:Label ID="LblMsg" runat="server" 
                    CssClass="pagination-info" 
                    Text=""></asp:Label>
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    CssClass="pagination-btn" 
                    ImageUrl="~/images/nextlabel.gif" 
                    OnClick="ImageButton2_Click" 
                    AlternateText="Next" />
                <asp:ImageButton ID="ImageButton3" runat="server" 
                    CssClass="pagination-btn" 
                    ImageUrl="~/images/closelabel.gif" 
                    OnClick="ImageButton3_Click" 
                    AlternateText="End" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>