<%@ Page Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="Member_Tasks.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Member_Tasks" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:Panel ID="Panel1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:Panel ID="Panel2" runat="server" Height="400px">
                  
                  <div class="container">
		<div class="about row">
			<h2>view profile</h2>
			

             <br />

                    <asp:Panel ID="Panel6" runat="server">
                        <br />
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                            CellPadding="4" Height="315px" 
                            Width="322px" Font-Size="Small">
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <Fields>
                                <asp:TemplateField HeaderText="Username">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Font-Size="Small" 
                                            Text='<%# Eval("Email_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Font-Size="Small" 
                                            Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Font-Size="Small" 
                                            Text='<%# Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Font-Size="Small" 
                                            Text='<%# Eval("ContactNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Font-Size="Small" 
                                            Text='<%# Eval("Country") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        </asp:DetailsView>
                        <br />
                    </asp:Panel>
                    <br>

		</div>
	</div>
   
                </asp:Panel>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:Panel ID="Panel4" runat="server" Height="400px">
                   

                   <div class="container">
		<div class="about row">
			<h2>post feedbacks</h2>
			

              <br />
                      
                    <table style="width: 66%;">
                        <tr>
                            <td align="center" style="background-image: url('images/Events_Frame.JPG'); height: 207px;" 
                                valign="middle">
                               
                                <table align="center" style="width: 91%;">
                                    <tr>
                                        <td style="width: 117px; font-size: small;">
                                            &nbsp;</td>
                                        <td style="width: 369px">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 117px; font-size: small;">
                                            <b>Post Feedback</b></td>
                                        <td style="width: 369px">
                                            <asp:TextBox ID="txt_feedback" runat="server" Height="100px" 
                                                TextMode="MultiLine" Width="400px" Font-Size="Small"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="txt_feedback" ErrorMessage="*" Font-Size="Small" 
                                                ToolTip="field required" ValidationGroup="feedback"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 117px">
                                            &nbsp;</td>
                                        <td style="width: 369px">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 117px">
                                            &nbsp;</td>
                                        <td align="right">
                                            <asp:Button ID="btn_feedback" runat="server" Font-Size="Small" 
                                                onclick="btn_feedback_Click" Text="Submit" ValidationGroup="feedback" />
                                        </td>
                                        <td align="right">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 117px">
                                            &nbsp;</td>
                                        <td align="right">
                                            &nbsp;</td>
                                        <td align="right">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                 

		</div>
	</div>

                  
                </asp:Panel>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <asp:Panel ID="Panel5" runat="server" Height="400px">
                   
                   <div class="container">
		<div class="about row">
			<h2>member change password</h2>
			

            
                    <br />
                    <table style="width: 38%;">
                        <tr>
                            <td style="background-image: url('images/Changepassword_Frame.JPG'); height: 210px;" 
                                valign="middle">
                                <table align="center" style="width: 76%;">
                                    <tr>
                                        <td style="width: 105px">
                                            &nbsp;</td>
                                        <td style="width: 190px">
                                            &nbsp;</td>
                                        <td style="font-size: small">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px; font-size: small; text-align: left;">
                                            <b>Old Password</b></td>
                                        <td style="width: 190px; text-align: left;">
                                            <asp:TextBox ID="txt_oldpassword" runat="server" TextMode="Password" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                        <td style="font-size: small; text-align: left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="txt_oldpassword" ErrorMessage="*" ToolTip="field required" 
                                                ValidationGroup="changepwd"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px; font-size: small; text-align: left;">
                                            <b>New Password</b></td>
                                        <td style="width: 190px; text-align: left;">
                                            <asp:TextBox ID="txt_newpwd" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                        </td>
                                        <td style="font-size: small; text-align: left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="txt_newpwd" ErrorMessage="*" ToolTip="filed required" 
                                                ValidationGroup="changepwd"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px; font-size: small; text-align: left;">
                                            <b>Confirm</b></td>
                                        <td style="width: 190px; text-align: left;">
                                            <asp:TextBox ID="txt_confirm" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                        </td>
                                        <td style="font-size: small; text-align: left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ControlToValidate="txt_confirm" ErrorMessage="*" ToolTip="filed required" 
                                                ValidationGroup="changepwd"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txt_newpwd" ControlToValidate="txt_confirm" ErrorMessage="*" 
                                                ToolTip="mismatch" ValidationGroup="changepwd"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px">
                                            &nbsp;</td>
                                        <td style="width: 190px">
                                            &nbsp;</td>
                                        <td style="font-size: small">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px">
                                            &nbsp;</td>
                                        <td align="right">
                                            <asp:Button ID="btn_changepwd" runat="server" Font-Size="Small" 
                                                onclick="btn_changepwd_Click" Text="Submit" ValidationGroup="changepwd" />
                                        </td>
                                        <td style="font-size: small">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px">
                                            &nbsp;</td>
                                        <td style="width: 190px">
                                            &nbsp;</td>
                                        <td align="right" style="font-size: small">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                   <br />

		</div>
	</div>


                </asp:Panel>
            </asp:View>
            
        </asp:MultiView>
    </asp:Panel>

</asp:Content>
