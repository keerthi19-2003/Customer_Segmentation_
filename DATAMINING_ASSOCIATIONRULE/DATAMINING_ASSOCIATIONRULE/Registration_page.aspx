<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Registration_page.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Registration_page" Title="Create Your Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-size: 16px;
        }

        .modern-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }

        .registration-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
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

        .modern-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .modern-header h2 {
            font-size: 3rem;
            margin-bottom: 15px;
            font-weight: 300;
            text-transform: capitalize;
        }

        .modern-header p {
            font-size: 1.3rem;
            opacity: 0.9;
            line-height: 1.6;
        }

        .form-container {
            padding: 50px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .modern-label {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
            font-weight: 600;
            color: #2c3e50;
            font-size: 1.2rem;
        }

        .modern-label i {
            font-size: 1.3rem;
            color: #667eea;
            width: 20px;
            text-align: center;
        }

        .required::after {
            content: " *";
            color: #e74c3c;
        }

        /* Modern Input Styles */
        .modern-input {
            width: 100% !important;
            padding: 20px 25px 20px 60px !important;
            border: 2px solid #e1e5e9 !important;
            border-radius: 12px !important;
            font-size: 1.2rem !important;
            transition: all 0.3s ease !important;
            background: #f8f9fa !important;
            box-sizing: border-box !important;
        }

        .modern-input:focus {
            outline: none !important;
            border-color: #667eea !important;
            background: white !important;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1) !important;
            transform: translateY(-2px) !important;
        }

        /* Icon positioning */
        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea !important;
            z-index: 10;
            font-size: 1.4rem;
            display: block !important;
            visibility: visible !important;
        }

        /* Modern Dropdown Styles */
        .modern-dropdown {
            width: 100% !important;
            padding: 20px 25px 20px 60px !important;
            border: 2px solid #e1e5e9 !important;
            border-radius: 12px !important;
            font-size: 1.2rem !important;
            background: #f8f9fa !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
            appearance: none !important;
            -webkit-appearance: none !important;
            -moz-appearance: none !important;
        }

        .modern-dropdown:focus {
            outline: none !important;
            border-color: #667eea !important;
            background: white !important;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1) !important;
            transform: translateY(-2px) !important;
        }

        .dropdown-wrapper {
            position: relative;
        }

        .dropdown-wrapper::after {
            content: '\f078';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea !important;
            pointer-events: none;
            font-size: 1.2rem;
            display: block !important;
            visibility: visible !important;
        }

        /* Modern TextArea */
        .modern-textarea {
            width: 100% !important;
            padding: 20px 25px 20px 60px !important;
            border: 2px solid #e1e5e9 !important;
            border-radius: 12px !important;
            font-size: 1.2rem !important;
            background: #f8f9fa !important;
            resize: vertical !important;
            min-height: 140px !important;
            font-family: inherit !important;
        }

        .modern-textarea:focus {
            outline: none !important;
            border-color: #667eea !important;
            background: white !important;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1) !important;
            transform: translateY(-2px) !important;
        }

        /* Date inputs special styling */
        .date-inputs {
            display: flex;
            gap: 10px;
        }

        .date-inputs .modern-dropdown {
            flex: 1;
        }

        /* Modern Button */
        .modern-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            color: white !important;
            border: none !important;
            padding: 22px 50px !important;
            font-size: 1.3rem !important;
            border-radius: 12px !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
            font-weight: 600 !important;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3) !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 12px !important;
            margin: 40px auto 0 !important;
            min-width: 250px !important;
        }

        .modern-btn:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.4) !important;
        }

        .section-title {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e1e5e9;
            grid-column: 1 / -1;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .section-title i {
            font-size: 1.6rem;
            color: #667eea;
        }

        .note {
            background: rgba(52, 152, 219, 0.1);
            border-left: 4px solid #3498db;
            padding: 20px;
            border-radius: 8px;
            margin-top: 25px;
            color: #2c3e50;
            font-size: 1.1rem;
            line-height: 1.6;
        }

        /* Validation styling */
        .validation-error {
            color: #e74c3c !important;
            font-size: 1rem !important;
            margin-top: 8px !important;
            font-weight: 500 !important;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .modern-header h2 {
                font-size: 2rem;
            }
            
            .form-container {
                padding: 20px;
            }
            
            .modern-container {
                padding: 0 10px;
            }
        }

        /* Hide default ASP.NET table styling */
        table {
            width: 100% !important;
            border: none !important;
            border-collapse: separate !important;
            border-spacing: 0 !important;
        }

        table td {
            border: none !important;
            padding: 0 !important;
            vertical-align: top !important;
        }

        /* Font Awesome Icon Fixes */
        i.fas, i.far, i.fab {
            font-family: 'Font Awesome 6 Free' !important;
            font-weight: 900 !important;
            display: inline-block !important;
            font-style: normal !important;
            font-variant: normal !important;
            text-rendering: auto !important;
            line-height: 1 !important;
        }

        /* Emoji and Font Awesome support for dropdown options */
        option {
            font-family: 'Segoe UI Emoji', 'Apple Color Emoji', 'Segoe UI Symbol', 'Segoe UI', 'Font Awesome 6 Free', sans-serif !important;
            font-size: 1.1rem !important;
            padding: 8px !important;
            line-height: 1.4 !important;
        }

        select option {
            font-family: 'Segoe UI Emoji', 'Apple Color Emoji', 'Segoe UI Symbol', 'Segoe UI', 'Font Awesome 6 Free', sans-serif !important;
        }
    </style>

    <div class="modern-container">
        <div class="registration-card">
            <div class="modern-header">
                <h2><i class="fas fa-user-plus"></i> registration form for new users</h2>
                <p>Join our community and unlock exclusive features. Fill in the details below to get started on your journey with us.</p>
            </div>
            
            <div class="form-container">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="form-grid">
                        <!-- Account Information Section -->
                        <div class="section-title">
                            <i class="fas fa-envelope"></i> Account Information
                        </div>
                        
                        <!-- Email Address -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-at"></i>
                                <span>Email Address</span>
                            </div>
                            <div class="input-wrapper">
                                <i class="input-icon fas fa-envelope"></i>
                                <asp:TextBox ID="txt_EmailID" runat="server" CssClass="modern-input" placeholder="Enter your email address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txt_EmailID" ErrorMessage="Email is required" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txt_EmailID" ErrorMessage="Please enter a valid email address" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>

                        <!-- Full Name -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-user"></i>
                                <span>Full Name</span>
                            </div>
                            <div class="input-wrapper">
                                <i class="input-icon fas fa-user-circle"></i>
                                <asp:TextBox ID="txt_Name" runat="server" CssClass="modern-input" placeholder="Enter your full name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txt_Name" ErrorMessage="Name is required" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-key"></i>
                                <span>Password</span>
                            </div>
                            <div class="input-wrapper">
                                <i class="input-icon fas fa-lock"></i>
                                <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="modern-input" placeholder="Create a strong password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txt_password" ErrorMessage="Password is required" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Confirm Password -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-shield-alt"></i>
                                <span>Confirm Password</span>
                            </div>
                            <div class="input-wrapper">
                                <i class="input-icon fas fa-check-double"></i>
                                <asp:TextBox ID="txt_confirm" runat="server" TextMode="Password" CssClass="modern-input" placeholder="Confirm your password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txt_confirm" ErrorMessage="Please confirm your password" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txt_password" ControlToValidate="txt_confirm" 
                                ErrorMessage="Passwords do not match" ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Personal Details Section -->
                        <div class="section-title">
                            <i class="fas fa-user-circle"></i> Personal Details
                        </div>

                        <!-- Gender -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-venus-mars"></i>
                                <span>Gender</span>
                            </div>
                            <div class="dropdown-wrapper">
                                <i class="input-icon fas fa-transgender"></i>
                                <asp:DropDownList ID="dropdownlistGender" runat="server" CssClass="modern-dropdown">
                                    <asp:ListItem Value="">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">♂ Male</asp:ListItem>
                                    <asp:ListItem Value="Female">♀ Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="dropdownlistGender" ErrorMessage="Please select gender" 
                                Operator="NotEqual" ValidationGroup="registration" ValueToCompare="" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Date of Birth -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-birthday-cake"></i>
                                <span>Date of Birth</span>
                            </div>
                            <div class="date-inputs">
                                <div class="dropdown-wrapper">
                                    <i class="input-icon fas fa-calendar-day"></i>
                                    <asp:DropDownList ID="dropdownlistDay" runat="server" CssClass="modern-dropdown">
                                        <asp:ListItem Value="">Day</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                        <asp:ListItem Value="11">11</asp:ListItem>
                                        <asp:ListItem Value="12">12</asp:ListItem>
                                        <asp:ListItem Value="13">13</asp:ListItem>
                                        <asp:ListItem Value="14">14</asp:ListItem>
                                        <asp:ListItem Value="15">15</asp:ListItem>
                                        <asp:ListItem Value="16">16</asp:ListItem>
                                        <asp:ListItem Value="17">17</asp:ListItem>
                                        <asp:ListItem Value="18">18</asp:ListItem>
                                        <asp:ListItem Value="19">19</asp:ListItem>
                                        <asp:ListItem Value="20">20</asp:ListItem>
                                        <asp:ListItem Value="21">21</asp:ListItem>
                                        <asp:ListItem Value="22">22</asp:ListItem>
                                        <asp:ListItem Value="23">23</asp:ListItem>
                                        <asp:ListItem Value="24">24</asp:ListItem>
                                        <asp:ListItem Value="25">25</asp:ListItem>
                                        <asp:ListItem Value="26">26</asp:ListItem>
                                        <asp:ListItem Value="27">27</asp:ListItem>
                                        <asp:ListItem Value="28">28</asp:ListItem>
                                        <asp:ListItem Value="29">29</asp:ListItem>
                                        <asp:ListItem Value="30">30</asp:ListItem>
                                        <asp:ListItem Value="31">31</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="dropdown-wrapper">
                                    <i class="input-icon fas fa-calendar"></i>
                                    <asp:DropDownList ID="dropdownlistMonth" runat="server" CssClass="modern-dropdown">
                                        <asp:ListItem Value="">Month</asp:ListItem>
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="dropdown-wrapper">
                                    <i class="input-icon fas fa-calendar-alt"></i>
                                    <asp:DropDownList ID="dropdownlistYear" runat="server" CssClass="modern-dropdown">
                                        <asp:ListItem Value="">Year</asp:ListItem>
                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                        <asp:ListItem Value="2009">2009</asp:ListItem>
                                        <asp:ListItem Value="2008">2008</asp:ListItem>
                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                        <asp:ListItem Value="2006">2006</asp:ListItem>
                                        <asp:ListItem Value="2005">2005</asp:ListItem>
                                        <asp:ListItem Value="2004">2004</asp:ListItem>
                                        <asp:ListItem Value="2003">2003</asp:ListItem>
                                        <asp:ListItem Value="2002">2002</asp:ListItem>
                                        <asp:ListItem Value="2001">2001</asp:ListItem>
                                        <asp:ListItem Value="2000">2000</asp:ListItem>
                                        <asp:ListItem Value="1999">1999</asp:ListItem>
                                        <asp:ListItem Value="1998">1998</asp:ListItem>
                                        <asp:ListItem Value="1997">1997</asp:ListItem>
                                        <asp:ListItem Value="1996">1996</asp:ListItem>
                                        <asp:ListItem Value="1995">1995</asp:ListItem>
                                        <asp:ListItem Value="1994">1994</asp:ListItem>
                                        <asp:ListItem Value="1993">1993</asp:ListItem>
                                        <asp:ListItem Value="1992">1992</asp:ListItem>
                                        <asp:ListItem Value="1991">1991</asp:ListItem>
                                        <asp:ListItem Value="1990">1990</asp:ListItem>
                                        <asp:ListItem Value="1989">1989</asp:ListItem>
                                        <asp:ListItem Value="1988">1988</asp:ListItem>
                                        <asp:ListItem Value="1987">1987</asp:ListItem>
                                        <asp:ListItem Value="1986">1986</asp:ListItem>
                                        <asp:ListItem Value="1985">1985</asp:ListItem>
                                        <asp:ListItem Value="1984">1984</asp:ListItem>
                                        <asp:ListItem Value="1983">1983</asp:ListItem>
                                        <asp:ListItem Value="1982">1982</asp:ListItem>
                                        <asp:ListItem Value="1981">1981</asp:ListItem>
                                        <asp:ListItem Value="1980">1980</asp:ListItem>
                                        <asp:ListItem Value="1979">1979</asp:ListItem>
                                        <asp:ListItem Value="1978">1978</asp:ListItem>
                                        <asp:ListItem Value="1977">1977</asp:ListItem>
                                        <asp:ListItem Value="1976">1976</asp:ListItem>
                                        <asp:ListItem Value="1975">1975</asp:ListItem>
                                        <asp:ListItem Value="1974">1974</asp:ListItem>
                                        <asp:ListItem Value="1973">1973</asp:ListItem>
                                        <asp:ListItem Value="1972">1972</asp:ListItem>
                                        <asp:ListItem Value="1971">1971</asp:ListItem>
                                        <asp:ListItem Value="1970">1970</asp:ListItem>
                                        <asp:ListItem Value="1969">1969</asp:ListItem>
                                        <asp:ListItem Value="1968">1968</asp:ListItem>
                                        <asp:ListItem Value="1967">1967</asp:ListItem>
                                        <asp:ListItem Value="1966">1966</asp:ListItem>
                                        <asp:ListItem Value="1965">1965</asp:ListItem>
                                        <asp:ListItem Value="1964">1964</asp:ListItem>
                                        <asp:ListItem Value="1963">1963</asp:ListItem>
                                        <asp:ListItem Value="1962">1962</asp:ListItem>
                                        <asp:ListItem Value="1961">1961</asp:ListItem>
                                        <asp:ListItem Value="1960">1960</asp:ListItem>
                                        <asp:ListItem Value="1959">1959</asp:ListItem>
                                        <asp:ListItem Value="1958">1958</asp:ListItem>
                                        <asp:ListItem Value="1957">1957</asp:ListItem>
                                        <asp:ListItem Value="1956">1956</asp:ListItem>
                                        <asp:ListItem Value="1955">1955</asp:ListItem>
                                        <asp:ListItem Value="1954">1954</asp:ListItem>
                                        <asp:ListItem Value="1953">1953</asp:ListItem>
                                        <asp:ListItem Value="1952">1952</asp:ListItem>
                                        <asp:ListItem Value="1951">1951</asp:ListItem>
                                        <asp:ListItem Value="1950">1950</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <!-- Marital Status -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-heart"></i>
                                <span>Marital Status</span>
                            </div>
                            <div class="dropdown-wrapper">
                                <i class="input-icon fas fa-ring"></i>
                                <asp:DropDownList ID="dropdownlistMartialstatus" runat="server" CssClass="modern-dropdown">
                                    <asp:ListItem Value="">Select Status</asp:ListItem>
                                    <asp:ListItem Value="Single">⭐ Single</asp:ListItem>
                                    <asp:ListItem Value="Married">❤ Married</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                ControlToValidate="dropdownlistMartialstatus" ErrorMessage="Please select marital status" 
                                Operator="NotEqual" ValidationGroup="registration" ValueToCompare="" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Education -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-graduation-cap"></i>
                                <span>Education</span>
                            </div>
                            <div class="dropdown-wrapper">
                                <i class="input-icon fas fa-book"></i>
                                <asp:DropDownList ID="dropdownlistEducation" runat="server" CssClass="modern-dropdown">
                                    <asp:ListItem Value="">Select Education</asp:ListItem>
                                    <asp:ListItem Value="10th">✓ 10th Grade</asp:ListItem>
                                    <asp:ListItem Value="PUC">※ PUC</asp:ListItem>
                                    <asp:ListItem Value="Diploma">⚡ Diploma</asp:ListItem>
                                    <asp:ListItem Value="Degree">★ Bachelor's Degree</asp:ListItem>
                                    <asp:ListItem Value="Master Degree">◆ Master's Degree</asp:ListItem>
                                    <asp:ListItem Value="PHD">◇ PhD</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                ControlToValidate="dropdownlistEducation" ErrorMessage="Please select education level" 
                                Operator="NotEqual" ValidationGroup="registration" ValueToCompare="" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Occupation -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-briefcase"></i>
                                <span>Occupation</span>
                            </div>
                            <div class="dropdown-wrapper">
                                <i class="input-icon fas fa-user-tie"></i>
                                <asp:DropDownList ID="dropdownlistOccupation" runat="server" CssClass="modern-dropdown">
                                    <asp:ListItem Value="">Select Occupation</asp:ListItem>
                                    <asp:ListItem Value="IT">▣ IT Professional</asp:ListItem>
                                    <asp:ListItem Value="Bank">$ Banking</asp:ListItem>
                                    <asp:ListItem Value="Business">▲ Business</asp:ListItem>
                                    <asp:ListItem Value="Student">◐ Student</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                ControlToValidate="dropdownlistOccupation" ErrorMessage="Please select occupation" 
                                Operator="NotEqual" ValidationGroup="registration" ValueToCompare="" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Income -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-dollar-sign"></i>
                                <span>Income Range</span>
                            </div>
                            <div class="dropdown-wrapper">
                                <i class="input-icon fas fa-coins"></i>
                                <asp:DropDownList ID="dropdownlistIncome" runat="server" CssClass="modern-dropdown">
                                    <asp:ListItem Value="">Select Income Range</asp:ListItem>
                                    <asp:ListItem Value="5k - 10k">● 5k - 10k</asp:ListItem>
                                    <asp:ListItem Value="10k - 20k">◉ 10k - 20k</asp:ListItem>
                                    <asp:ListItem Value="20k - 30k">◎ 20k - 30k</asp:ListItem>
                                    <asp:ListItem Value="30k - 50k">◆ 30k - 50k</asp:ListItem>
                                    <asp:ListItem Value="50k+">◇ 50k+</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator7" runat="server" 
                                ControlToValidate="dropdownlistIncome" ErrorMessage="Please select income range" 
                                Operator="NotEqual" ValidationGroup="registration" ValueToCompare="" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Contact Information Section -->
                        <div class="section-title">
                            <i class="fas fa-address-book"></i> Contact Information
                        </div>

                        <!-- Contact Number -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-phone"></i>
                                <span>Contact Number</span>
                            </div>
                            <div class="input-wrapper">
                                <i class="input-icon fas fa-phone-alt"></i>
                                <asp:TextBox ID="txt_contactNo" runat="server" CssClass="modern-input" placeholder="Enter your contact number"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txt_contactNo" ErrorMessage="Contact number is required" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Country -->
                        <div class="form-group">
                            <div class="modern-label required">
                                <i class="fas fa-globe"></i>
                                <span>Country</span>
                            </div>
                            <div class="dropdown-wrapper">
                                <i class="input-icon fas fa-flag"></i>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="modern-dropdown">
                                    <asp:ListItem Value="">Select Country</asp:ListItem>
                                    <asp:ListItem Value="INDIA">◆ INDIA</asp:ListItem>
                                    <asp:ListItem Value="USA">● USA</asp:ListItem>
                                    <asp:ListItem Value="AUSTRALIA">◉ AUSTRALIA</asp:ListItem>
                                    <asp:ListItem Value="ENGLAND">▲ ENGLAND</asp:ListItem>
                                    <asp:ListItem Value="SRILANKA">■ SRILANKA</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                ControlToValidate="DropDownList1" ErrorMessage="Please select country" 
                                Operator="NotEqual" ValidationGroup="registration" ValueToCompare="" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <!-- Address -->
                        <div class="form-group full-width">
                            <div class="modern-label required">
                                <i class="fas fa-home"></i>
                                <span>Address</span>
                            </div>
                            <div class="input-wrapper">
                                <i class="input-icon fas fa-map-marker-alt"></i>
                                <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" CssClass="modern-textarea" placeholder="Enter your full address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txt_address" ErrorMessage="Address is required" 
                                ValidationGroup="registration" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Submit Button -->
                        <div class="form-group full-width" style="text-align: center;">
                            <asp:ImageButton ID="btn_registration" runat="server" CssClass="modern-btn" 
                                OnClick="btn_registration_Click" ValidationGroup="registration" 
                                ImageUrl="~/images/register-btn.png" AlternateText="Register Now" />
                            
                            <div class="note">
                                <i class="fas fa-info-circle"></i>
                                <strong>Note:</strong> All fields marked with asterisk (*) are mandatory. Please ensure you provide accurate information for successful registration.
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>