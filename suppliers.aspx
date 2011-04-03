<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="suppliers.aspx.cs"
	Inherits="suppliers" Title="My User Group" %>

<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table id="body" border="0">
		<tr>
		<td>
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
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Events_Calendar.aspx?supplier=" + Eval("CompanyName") %>' Text='<%# Eval("CompanyName") %>'></asp:HyperLink>-<%# Eval("CompanyName")%>
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
