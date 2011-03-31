<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Events_List.aspx.cs"
	Inherits="Events_List" Title="Untitled Page" %>

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
				<asp:Panel ID="panel1" runat="server" CssClass="actionbuttons">
					<Club:RolloverLink ID="AddBtn" runat="server" Text="Add new event" NavigateURL="Events_Edit.aspx?Action=New" />
				</asp:Panel>
				<a href="Events_calendar.aspx">Month view</a> &nbsp; &nbsp; <a href="Locations_list.aspx">
					Locations List</a>
			</div>
			<div class="rightblock">
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedUpcommingEventList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn1" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="5" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
				<h2>
					Upcomming events</h2>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn1" runat="server" SelectedPage="1" DisplayedPages="7" OnSelectedPageChanged="pn1_SelectedPageChanged"
						CssClass="PageNumbers" />
				</div>
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
					<ItemTemplate>
						<div class="listitem">
							<div class="thumbnail">
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString(Eval("ID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail1" runat="server" PhotoID='<%# Eval("photo") %>'
										NoPhotoImg="images/calendar.jpg" />
								</a>
							</div>
							<asp:Panel ID="panel2" runat="server" CssClass="editbuttons" Visible='<%#IsAdmin %>'>
								<Club:RolloverLink ID="EditBtn" runat="server" Text="Edit" NavigateURL='<%# "Events_Edit.aspx?Action=Edit&id=" + Convert.ToString(Eval("id")) %>' />
								<Club:RolloverLink ID="RemoveBtn" runat="server" Text="Remove" NavigateURL='<%# "Events_Edit.aspx?Action=Remove&id=" + Convert.ToString(Eval("id")) %>' />
							</asp:Panel>
							<h3>
								<asp:Label ID="itemdateLabel" runat="server" Text='<%# Eval("starttime","{0:d}") %>' />
								&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<p>
								<asp:Label ID="descriptionLabel" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("description")) %>' />
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>read more
									&raquo;</a></p>
							<div class="clearlist">
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn2" runat="server" SelectedPage="1" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn2_SelectedPageChanged" />
				</div>
			</div>
			<div class="rightblock">
				<h2>
					Recent events</h2>
				<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedRecentEventList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource2_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn3" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="5" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn3" runat="server" SelectedPage="1" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn3_SelectedPageChanged" />
				</div>
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
					<ItemTemplate>
						<div class="listitem">
							<div class="thumbnail">
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail1" runat="server" PhotoID='<%# Eval("photo")%>'
										NoPhotoImg="images/calendar.jpg" />
								</a>
							</div>
							<asp:Panel ID="panel1" runat="server" CssClass="editbuttons" Visible='<%#IsAdmin %>'>
								<Club:RolloverLink ID="EditBtn" runat="server" Text="Edit" NavigateURL='<%# "Events_Edit.aspx?Action=Edit&id=" + Convert.ToString(Eval("id")) %>' />
								<Club:RolloverLink ID="RemoveBtn" runat="server" Text="Remove" NavigateURL='<%# "Events_Edit.aspx?Action=Remove&id=" + Convert.ToString(Eval("id")) %>' />
							</asp:Panel>
							<h3>
								<asp:Label ID="itemdateLabel" runat="server" Text='<%# Eval("starttime","{0:d}") %>' />
								&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<p>
								<asp:Label ID="descriptionLabel" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("description")) %>' />
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>read more
									&raquo;</a></p>
							<div class="clearlist">
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn4" runat="server" SelectedPage="1" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn4_SelectedPageChanged" />
				</div>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
