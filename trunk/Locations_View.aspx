<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Locations_View.aspx.cs"
	Inherits="Locations_View" Title="Untitled Page" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
		SelectCommand="SELECT id, title, description, photo, linkurl, directions, address FROM locations WHERE (id = @id)">
		<SelectParameters>
			<asp:Parameter Type="Int32" DefaultValue="1" Name="id"></asp:Parameter>
		</SelectParameters>
	</asp:SqlDataSource>
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<!--
        
        Left column
        
        -->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					Locations</h2>
				<p>
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
					euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
					minim veniam, quis nostrud exercitation ulliam corper suscipit lobortis nisl ut
					aliquip ex ea commodo consequat. Duis autem veleum iriure dolor in hendrerit in
					vulputate velit esse molestie consequat, vel willum lunombro dolore eu feugiat nulla
					facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
					luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>
			</div>
		</div>
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			<div class="rightblock">
				<a href="Locations_list.aspx">Locations List</a></div>
			<div class="rightblock">
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton1" runat="server" OnClick="nextButton_Click">Next Location &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton2" runat="server" OnClick="prevButton_Click">&laquo; Previous Location</asp:LinkButton>
				<div class="dashedline">
				</div>
				<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id"
					Width="444px">
					<ItemTemplate>
						<h2>
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
						</h2>
						<div class="itemdetails">
							<p>
								<asp:HyperLink Text='<%# Eval("linkurl") %>' NavigateUrl='<%# Eval("linkurl") %>'
									runat="server" ID="Label1" />
							</p>
							<p>
								<asp:Label Text='<%# Eval("address") %>' runat="server" ID="addressLabel" />
							</p>
						</div>
						<Club:ImageThumbnail ID="thumb1" runat="server" ImageSize="Large" PhotoID='<%# Eval("photo") %>' />
						<p>
							<asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" />
						</p>
						<p>
							<asp:Label Text='<%# Eval("directions") %>' runat="server" ID="Label2" />
						</p>
						<asp:Panel runat="server" ID="panel1" CssClass="actionbuttons" Visible='<%# User.IsInRole("Administrators") %>'>
							<Club:RolloverLink ID="editbtn" runat="server" Text="Edit Location" NavigateURL='<%# "Locations_edit.aspx?LocationID=" + Convert.ToString(LocationID)%>' />
						</asp:Panel>
					</ItemTemplate>
				</asp:FormView>
				<div class="dashedline">
				</div>
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton3" runat="server" OnClick="nextButton_Click">Next Location &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton4" runat="server" OnClick="prevButton_Click">&laquo; Previous Location</asp:LinkButton>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
