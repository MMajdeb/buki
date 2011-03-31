<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PhotoAlbum_List.aspx.cs"
	Inherits="PhotoAlbum_List" Title="Untitled Page" %>

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
					Photo Albums</h2>
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
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubsiteDB %>"
					SelectCommand="PagedAlbumList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected"
					OnSelecting="SqlDataSource1_Selecting">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn1" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="16" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
						<asp:Parameter Name="ownerid" />
					</SelectParameters>
				</asp:SqlDataSource>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn1" runat="server" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn1_SelectedPageChanged" />
				</div>
				<div class="dashedline">
				</div>
				<asp:Panel runat="server" ID="panel1">
					<div class="actionbuttons">
						<Club:RolloverLink ID="AddBtn" runat="server" Text="Add new Album" NavigateURL="photoalbum_New.aspx" />
					</div>
					<div class="dashedline">
					</div>
				</asp:Panel>
				<asp:DataList ID="albumlist" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2">
					<ItemTemplate>
						<div class="membercard">
							<div style="float: left; padding: 0 5px 0 0;">
								<a href='<%# "Photoalbum_contents.aspx?Albumid=" + Convert.ToString( Eval("AlbumID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail1" runat="server" PhotoID='<%# Eval("DisplayImage") %>' />
								</a>
							</div>
							<h3>
								<a href='<%# "Photoalbum_contents.aspx?Albumid=" + Convert.ToString(Eval("albumID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<asp:Label ID="privateLabel" runat="server" Text='<p>Private to UserName<p>' Visible='<%# (bool)Eval("Private") %>' />
							<p>
								Album contains
								<asp:Label ID="imagecount" runat="server" Text='<%# Eval("ImageCount") %>' />
								images.</p>
							<div class="clearcard">
							</div>
						</div>
					</ItemTemplate>
				</asp:DataList>
				<!-- begin news item -->
				<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
					<ItemTemplate>
					</ItemTemplate>
				</asp:DataList>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn2" runat="server" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="Pn2_SelectedPageChanged" />
				</div>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
