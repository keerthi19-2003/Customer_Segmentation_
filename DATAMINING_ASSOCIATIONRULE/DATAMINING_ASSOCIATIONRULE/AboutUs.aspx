<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" 
    CodeBehind="AboutUs.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.AboutUs" 
    Title="About Us" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
    
    <link href="CSS/aboutus.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="area">
            <ul class="circles">
                <li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>
            </ul>
        </div>

        <div class="center-container">
            <div class="card">
                <div class="text short-text">
                    <div class="loader">
                        <span class="char1">A</span>
                        <span class="char2">B</span>
                        <span class="char3">O</span>
                        <span class="char4">U</span>
                        <span class="char5">T</span>
                        <span class="char6">&nbsp;</span>
                        <span class="char7">U</span>
                        <span class="char8">S</span>
                    </div>
                </div>
                
                <div class="text long-text">
                    <p>Welcome to our e-commerce platform! This project is a demonstration of <strong>customer segmentation</strong> using machine learning algorithms. We have utilized unsupervised learning techniques to analyze customer data and group users into distinct segments based on their purchasing behavior. The insights gained from this segmentation allow us to create a more personalized and effective user experience. This project showcases our ability to apply data science principles to real-world business challenges.</p>
                    <p>Our e-commerce demo is built with a focus on intelligent personalization. At its core, we use <strong>ML-powered customer segmentation</strong> to understand our users better. By clustering customers into groups with similar traits, we can tailor product recommendations, marketing campaigns, and promotions. This approach highlights how data-driven strategies can enhance customer satisfaction and drive business growth in the e-commerce space.</p>
                    <div class="image-container">
                        <img src="images/about us.png" alt="Shopping Bags" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>