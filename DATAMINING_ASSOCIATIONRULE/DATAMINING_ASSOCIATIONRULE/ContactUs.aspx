<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" 
    CodeBehind="ContactUs.aspx.cs" 
    Inherits="DATAMINING_ASSOCIATIONRULE.ContactUs" 
    Title="Contact Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- External CSS -->
    <link href="CSS/contact.css" rel="stylesheet" type="text/css" />
    
    <!-- Font Awesome for Social Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <asp:Panel ID="Panel1" runat="server">
        
        <!-- Contact Section -->
        <section class="contact_us">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 offset-md-1">
                        <div class="contact_inner">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="contact_form_inner">
                                        <div class="contact_field">
                                            <h3>Contact Us</h3>
                                            <p>Feel free to contact us any time. We will get back to you as soon as we can!</p>
                                            
                                            <!-- Form Fields (convert to asp: controls if backend is needed) -->
                                            <input type="text" class="form-control form-group" placeholder="Name" />
                                            <input type="text" class="form-control form-group" placeholder="Email" />
                                            <textarea class="form-control form-group" placeholder="Message"></textarea>
                                            <button class="contact_form_submit">Send</button>
                                            <button class="contact_form_submit">SCROLL DOWN TO SEE A REAL TIME MAP </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="right_conatct_social_icon d-flex align-items-end">
                                        <div class="socil_item_inner d-flex">
                                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Updated Contact Info -->
                            <div class="contact_info_sec">
                                <h4>Contact Info</h4>
                                <div class="d-flex info_single align-items-center">
                                    <i class="fas fa-headset"></i>
                                    <span>0821 - 5465254</span>
                                </div>
                                <div class="d-flex info_single align-items-center">
                                    <i class="fas fa-envelope-open-text"></i>
                                    <span>market .com</span>
                                </div>
                                <div class="d-flex info_single align-items-center">
                                    <i class="fas fa-map-marked-alt"></i>
                                    <span>Belawadi, Naguvenahalli Post, Srirangapatna, Karnataka 571438</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Google Map Section with Red Pointer -->
        <section class="map_sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 offset-md-1">
                        <div class="map_inner">
                            <h4>Find Us on Google Map</h4>
                            <p>We are located in Belawadi, Naguvenahalli Post, Srirangapatna, Karnataka 571438. Visit us anytime!</p>
                            <div class="map_bind">
                                <iframe
                                    width="100%"
                                    height="450"
                                    style="border:0"
                                    loading="lazy"
                                    allowfullscreen
                                    referrerpolicy="no-referrer-when-downgrade"
                                    src="https://www.google.com/maps?q=Belawadi,+Naguvenahalli+Post,+Srirangapatna,+Karnataka+571438&hl=en&z=15&output=embed">
                                </iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </asp:Panel>
</asp:Content>
