<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Suppliers.aspx.cs"
	Inherits="Suppliers" Title="My User Group" %>

<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">
<style type="text/css">
.sup_div_gray {
}
.sup_div_gray .sup_div_top {
    background: url("images/roundrect/sup_bg_gray_top.jpg") no-repeat scroll 0 0 transparent;
    clear: both;
    height: 13px;
    width: 697px;
}
.sup_div_gray .sup_div_wrap {
    background: url("images/roundrect/sup_bg_gray_middle.jpg") repeat-y scroll 0 0 transparent;
    clear: both;
    height: 92px !important;
    width: 697px;
}
.sup_div_gray .sup_div_bottom {
    background: url("images/roundrect/sup_bg_gray_bottom.jpg") no-repeat scroll 0 0 transparent;
    clear: both;
    height: 13px;
    width: 697px;
}
.sup_div .sup_div_body, .sup_div_gray .sup_div_body, .sup_div_open .sup_div_body {
    padding: 0 10px;
}

.sup_div_gray .sup_details, .sup_div_open .sup_details {
    background: url("images/roundrect/sup_bg_gray_line.png") no-repeat scroll left center transparent;
}
.sup_div_gray span.business_name {
    color: #38419F;
    display: block;
    font-family: arial;
    font-size: 16px;
    font-weight: bold;
    height: auto;
}
.sup_div_gray .sup_description, .sup_div_open .sup_description {
    background: url("images/roundrect/sup_bg_gray_line.png") no-repeat scroll left center transparent;
}

.sup_div .sup_details {
    float: right;
    height: auto !important;
    min-height: 85px;
    width: 175px;
}

.sup_div .sup_description {
    color: #3E3E3E;
    float: right;
    font-family: arial;
    font-size: 12px;
    font-weight: normal;
    height: auto !important;
    margin-right: 10px;
    min-height: 85px;
    padding-left: 10px;
    padding-top: 5px;
    width: 350px;
}

.sup_div div.options {
    float: right;
    height: auto !important;
    margin-right: 15px;
    min-height: 85px;
    padding-top: 5px;
}
.professionals > div{
    height: auto !important;
    padding-top: 10px;
}
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<div id="fullwidth" class="fullwidth">
			<h2>
				תוצאות חיפוש עבור:
				<asp:Label ID="lblSearchCreteria" runat="server" Text=""></asp:Label>
			</h2>
			<div class="dashedline">
			</div>
			<table border="0">
				<tr>
					<td valign="top">
						<asp:Repeater ID="ListRepeater" runat="server" EnableViewState="False" DataSourceID="SupplierszObjectDataSource">
							<HeaderTemplate>
							<div class="professionals">						
							</HeaderTemplate>
							<ItemTemplate>																
								<div class="sup_div sup_div_gray">
									<div class="sup_div_top">
									</div>
									<div class="sup_div_wrap">
										<!-- Begin  sup_div_body -->
										<div class="sup_div_body">
											<!-- Begin Business details -->
											<div class="sup_details">
												<span class="business_name"><%# Eval("CompanyName")%></span>
												<br />
												<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Member_View_Supplier_Layout.aspx?supplierID=" + Eval("Memberid")  %>'>
													<span>קטגוריה:</span><span><%# Eval("CategoryName") %></span>																										
													<br />
													<span>שם:</span><span><%# Eval("CompanyName")%></span>												
												</asp:HyperLink>												
											</div>
											<!-- End Business details -->
											<!-- Begin Business description -->
											<div class="sup_description">																									
											</div>
											<!-- End Business description -->
											<!-- Begin options -->
											<div class="options">
												<div style="height: 65px;">
												</div>
											</div>
											<!-- End options -->
										</div>
										<!-- End  sup_div_body -->
										<div class="clear">
										</div>
									</div>
									<div class="sup_div_bottom">
									</div>
								</div>								
							</ItemTemplate>
							<FooterTemplate>	
							</div>									
							</FooterTemplate>
						</asp:Repeater>
					</td>
				</tr>
			</table>
			<div class="dashedline">
			</div>
		</div>
	</div>
	<asp:ObjectDataSource ID="SupplierszObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetData" 
		TypeName="BukiDataViewsTableAdapters.SupplierzViewTableAdapter">
		<%--		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="CategoryID" SessionField="fgf" 
				Type="Int32" />
		</SelectParameters>--%>
		</asp:ObjectDataSource>
</asp:Content>
