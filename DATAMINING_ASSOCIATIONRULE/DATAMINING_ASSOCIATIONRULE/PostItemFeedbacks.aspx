<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="PostItemFeedbacks.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.PostItemFeedbacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="itemFeedbacks" runat="server">

   <div class="container">
		<div class="about row">
			<h2>post ratings</h2>
			

            <br />
        <asp:Label ID="lblItemName" runat="server" Font-Bold="True" ForeColor="#006699"></asp:Label>
        <br />
        <table style="width: 90%;">
            <tr>
                <td style="width: 393px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    <strong>&nbsp; Give Rating</strong></td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="left">
                    &nbsp;
                    <asp:DropDownList ID="DropDownListRating" runat="server" Width="400px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 393px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width: 393px">
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Post Rating" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 393px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />


		</div>
	</div>



        

    </asp:Panel>


</asp:Content>
