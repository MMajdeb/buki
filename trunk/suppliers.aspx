<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="suppliers.aspx.cs"
	Inherits="suppliers" Title="My User Group" %>

<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table id="body" border="0">
		<tr>
		<td>
		<div style="border: solid 1px gray">
			<asp:Label runat="server" Text="Search"></asp:Label><asp:TextBox ID="TextBox1"
				runat="server"></asp:TextBox>
		</div>
		</td>
		</tr>
		<tr>
			<td valign="top">				
				<asp:Repeater ID="ListRepeater" runat="server" EnableViewState="False" 
					DataSourceID="ObjectDataSource1">
					<HeaderTemplate>
						<ul>
					</HeaderTemplate>
					<ItemTemplate>
						<li>
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Events_Calendar.aspx?supplierID=" + Eval("SupplierID")  %>' Text='<%# Eval("CompanyName") %>'></asp:HyperLink>-<%# Eval("CompanyName")%>
						</li>
					</ItemTemplate>
					<FooterTemplate>
					</ul>
					</FooterTemplate>
				</asp:Repeater>
			</td>
		</tr>
	</table>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
		TypeName="BukiDataSetTableAdapters.SuppliersTableAdapter">
	</asp:ObjectDataSource>
</asp:Content>
