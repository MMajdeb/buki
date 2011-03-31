<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Events_View.aspx.cs"
	Inherits="Events_View" Title="Untitled Page" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<!--
        
        Left column
        
        -->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					Events</h2>
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
				<a href="Events_calendar.aspx">month view</a> <a href="Events_list.aspx">list view</a></div>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
				SelectCommand="SELECT dbo.Events.id, dbo.Events.starttime, dbo.events.endtime, dbo.Events.title, dbo.Events.description, dbo.Events.staticURL, dbo.Events.photo, dbo.Events.Album,  dbo.Events.location, dbo.Locations.title AS locationname FROM  dbo.Events LEFT OUTER JOIN dbo.Locations ON dbo.Events.location = dbo.Locations.id where Events.id=@id">
				<SelectParameters>
					<asp:Parameter Type="Int32" DefaultValue="1" Name="id"></asp:Parameter>
				</SelectParameters>
			</asp:SqlDataSource>
			<div class="rightblock">
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton1" runat="server" OnClick="NextButton_Click">next event &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton2" runat="server" OnClick="PrevButton_Click">&laquo; previous event</asp:LinkButton>
				<div class="dashedline">
				</div>
				<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id"
					AllowPaging="false" Width="100%">
					<ItemTemplate>
						<h2>
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
						</h2>
						<div class="itemdetails">
							<br />
							location:
							<h3>
								<asp:Label ID="locationLabel" runat="server" Text='<%# ShowLocationLink(Eval("locationname"),Eval("location")) %>' />
							</h3>
							<p>
								<asp:Label Text='<%# Eval("starttime","{0:D}") %>' runat="server" ID="itemdateLabel" />
								<br />
								<asp:Label Text='<%# ShowDuration(Eval("starttime"),Eval("endtime")) %>' runat="server"
									ID="Label1" />
							</p>
						</div>
						<div class="downloadevent">
							<a href="#">
								<img src="images/icon_download_event.gif" alt="Download this event to your personal calendar"
									width="15" height="26" /></a><a href='<%# "events_download.ashx?EventID=" + Convert.ToString(Eval("id")) %>'>Add
										this event to your personal calendar</a></div>
						<Club:ImageThumbnail ID="thumb1" runat="server" ImageSize="Large" PhotoID='<%# Eval("photo") %>' />
						<p>
							<asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" />
						</p>
						<asp:Panel ID="panel1" runat="server" CssClass="actionbuttons" Visible='<%#User.IsInRole("Administrators") %>'>
							<Club:RolloverLink ID="EditBtn" runat="server" Text="Edit" NavigateURL='<%# "Events_edit.aspx?id=" + Convert.ToString(Eval("id")) %>' />
						</asp:Panel>
					</ItemTemplate>
				</asp:FormView>
				<div class="dashedline">
				</div>
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton3" runat="server" OnClick="NextButton_Click">next event &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton4" runat="server" OnClick="PrevButton_Click">&laquo; previous event</asp:LinkButton>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
