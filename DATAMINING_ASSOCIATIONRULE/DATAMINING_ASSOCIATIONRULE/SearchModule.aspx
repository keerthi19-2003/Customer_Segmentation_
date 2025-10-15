<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchModule.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.SearchModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 639px;
        }
        .style2
        {
            width: 562px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="panelSearchModule" runat="server">
     
     <div class="container">
		<div class="about row">
			<h2>Search Products based on keywords!!!</h2>
			
           
                    <table style="width:56%;">
                        <tr>
                            <td>
                                <strong>Search Items</strong></td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
                            </td>
                            <td style="text-align: justify;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="*" ToolTip="Enter Keyword" 
                                    ValidationGroup="a"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Search" ValidationGroup="a" 
                                    Width="150px" onclick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                
        <br />
          <br />
           <br />
           <div id="popup">
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
            </div>
          <br />

		</div>
	</div>
     
    </asp:Panel>


</asp:Content>
