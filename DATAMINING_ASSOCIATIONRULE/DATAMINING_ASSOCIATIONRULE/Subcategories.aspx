<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Subcategories.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.Subcategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="Panel1" runat="server">
     
     <div class="container">
		<div class="about row">
			<h2>Product Subcategories</h2>
			
       <asp:Panel ID="Panel4" runat="server">
                                    <br />
                                  
                                    <table style="width: 57%;">
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                            <fieldset><legend style="color: #006699"><b>New ItemSubCategory</b></legend>
                                                <table style="width: 83%;">
                                                    <tr>
                                                        <td style="text-align: left; width: 107px">
                                                            &nbsp;</td>
                                                        <td style="text-align: left; width: 205px">
                                                            &nbsp;</td>
                                                        <td style="text-align: left">
                                                            </b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; width: 107px">
                                                            <b>Category</b></td>
                                                        <td style="text-align: left; width: 205px">
                                                            <b>
                                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                                                onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="205px">
                                                            </asp:DropDownList>
                                                            </b>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <b>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                                ControlToValidate="DropDownList1" ErrorMessage="*" Operator="NotEqual" 
                                                                ToolTip="select category" ValidationGroup="subcategory" 
                                                                ValueToCompare="- All -" Font-Size="Small"></asp:CompareValidator>
                                                            </b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; width: 107px">
                                                            <b>SubCategory</b></td>
                                                        <td style="text-align: left; width: 205px">
                                                            <b>
                                                            <asp:TextBox ID="txt_newsubcategory" runat="server" Width="200px"></asp:TextBox>
                                                            </b>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <b>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                ControlToValidate="txt_newsubcategory" ErrorMessage="*" 
                                                                ToolTip="field required" ValidationGroup="subcategory"></asp:RequiredFieldValidator>
                                                            </b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; width: 107px">
                                                            <b>Description</b></td>
                                                        <td style="text-align: left; width: 205px">
                                                            <b>
                                                            <asp:TextBox ID="txt_description" runat="server" Height="50px" 
                                                                TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                            </b>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <b>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                ControlToValidate="txt_description" ErrorMessage="*" ToolTip="field required" 
                                                                ValidationGroup="subcategory"></asp:RequiredFieldValidator>
                                                            </b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; width: 107px">
                                                            &nbsp;</td>
                                                        <td style="text-align: left; width: 205px">
                                                            &nbsp;</td>
                                                        <td style="text-align: left">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; width: 107px">
                                                            </b>
                                                        </td>
                                                        <td style="text-align: right; width: 205px">
                                                            <b>
                                                            <asp:Button ID="btn_subcategory" runat="server" onclick="btn_subcategory_Click" 
                                                                Text="Submit" ValidationGroup="subcategory" />
                                                            </b>
                                                        </td>
                                                        <td style="text-align: left">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                                <br />
                                                </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                   
                                    <table style="width: 91%;">
                                        <tr>
                                            <td>
                                                <asp:Table ID="Table2" runat="server">
                                                </asp:Table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 79%;">
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:ImageButton ID="ImageButton4" runat="server" 
                                                    ImageUrl="~/images/prevlabel.gif" onclick="ImageButton4_Click" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td style="text-align: right">
                                                <asp:ImageButton ID="ImageButton5" runat="server" 
                                                    ImageUrl="~/images/nextlabel.gif" onclick="ImageButton5_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td style="text-align: right">
                                                <asp:ImageButton ID="ImageButton6" runat="server" 
                                                    ImageUrl="~/images/closelabel.gif" onclick="ImageButton6_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                   
                                </asp:Panel>


		</div>
	</div>
     
    </asp:Panel>



</asp:Content>
