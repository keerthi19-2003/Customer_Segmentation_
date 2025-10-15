<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Tasks.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Admin_Tasks" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View3" runat="server">
                <asp:Panel ID="Panel4" runat="server">
               
               <div class="container">
		<div class="about row">
			<h2>administrator change password</h2>
			

              <br />
                    <table style="width: 38%; height: 211px;">
                        <tr>
                            <td align="center" style="width: 52%;background-image: url('images/Changepassword_Frame.JPG');">
                                <table style="width: 87%;">
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            &nbsp;</td>
                                        <td style="text-align: left; width: 155px">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            <b>Enter Old&nbsp; Password</b></td>
                                        <td style="text-align: left; width: 155px">
                                            <asp:TextBox ID="txt_oldpassword" runat="server" TextMode="Password" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="txt_oldpassword" ErrorMessage="*" ToolTip="filed required" 
                                                ValidationGroup="Changepassword"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            <b>New Password</b></td>
                                        <td style="text-align: left; width: 155px">
                                            <asp:TextBox ID="txt_Newpassword" runat="server" TextMode="Password" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="txt_Newpassword" ErrorMessage="*" ToolTip="field required" 
                                                ValidationGroup="Changepassword"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            <b>Confirm Password</b></td>
                                        <td style="text-align: left; width: 155px">
                                            <asp:TextBox ID="txt_Confirmpassword" runat="server" TextMode="Password" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ControlToValidate="txt_Confirmpassword" ErrorMessage="*" 
                                                ToolTip="filed required" ValidationGroup="Changepassword"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txt_Newpassword" ControlToValidate="txt_Confirmpassword" 
                                                ErrorMessage="*" ToolTip="mismatch" ValidationGroup="Changepassword"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            &nbsp;</td>
                                        <td style="text-align: left; width: 155px">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            &nbsp;</td>
                                        <td style="text-align: right; ">
                                            <asp:Button ID="btn_changepassword" runat="server" 
                                                onclick="btn_changepassword_Click" Text="Submit" 
                                                ValidationGroup="Changepassword" />
                                        </td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; width: 154px">
                                            &nbsp;</td>
                                        <td style="text-align: left; width: 155px">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
      

		</div>
	</div>


                  
                </asp:Panel>
            </asp:View>

            <asp:View ID="View5" runat="server">
            <asp:Panel ID="Panel6" runat="server">
                          

                          <div class="container">
		<div class="about row">
			<h2>view member feedbacks</h2>
			

             <br />
                            <table style="width: 84%;" >
                                <tr>
                                    <td>
                                        <br />
                                        <asp:Table ID="Table3" runat="server">
                                        </asp:Table>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table style="width: 78%;" >
                                <tr>
                                    <td class="style35" style="text-align: left">
                                        <asp:ImageButton ID="ImageButton7" runat="server" 
                                            ImageUrl="~/images/prevlabel.gif" onclick="ImageButton7_Click" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_paging" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td class="style28" style="text-align: right">
                                        <asp:ImageButton ID="ImageButton8" runat="server" 
                                            ImageUrl="~/images/nextlabel.gif" onclick="ImageButton8_Click" 
                                            Height="32px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style35">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style28" style="text-align: right">
                                        <asp:ImageButton ID="ImageButton9" runat="server" 
                                            ImageUrl="~/images/closelabel.gif" onclick="ImageButton9_Click" />
                                    </td>
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
