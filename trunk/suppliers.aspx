<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Suppliers.aspx.cs"
	Inherits="Suppliers" Title="My User Group" %>

<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
	<div id="fullwidth" class="fullwidth">
		<h2>
			תוצאות חיפוש עבור: <asp:Label ID="lblSearchCreteria" runat="server" Text=""></asp:Label>
		</h2>
		<div class="dashedline">
		</div>		
		<table border="0">
			<tr>
				<td valign="top">				
					<asp:Repeater ID="ListRepeater" runat="server" EnableViewState="False" 
						DataSourceID="SupplierszObjectDataSource">
						<HeaderTemplate>
							<ul>
						</HeaderTemplate>
						<ItemTemplate>
							<li>
								<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Member_View_Supplier_Layout.aspx?supplierID=" + Eval("Memberid")  %>' Text='<%# Eval("CompanyName") %>'></asp:HyperLink>-<%# Eval("CompanyName")%>	
							</li>
						</ItemTemplate>
						<FooterTemplate>
						</ul>
						</FooterTemplate>
					</asp:Repeater>
				</td>
			</tr>
		</table>		
		<div class="dashedline">
		</div>				
	</div>
	</div>
	<asp:ObjectDataSource ID="SupplierszObjectDataSource" runat="server" 
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCategoryID" 
		TypeName="BukiDataSetTableAdapters.SupplierzTableAdapter">
<%--		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="CategoryID" SessionField="fgf" 
				Type="Int32" />
		</SelectParameters>--%>
		<SelectParameters>
		<asp:Parameter Name="CategoryID"  Type="Int32" DefaultValue="0" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
