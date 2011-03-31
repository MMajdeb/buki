<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="News_View.aspx.cs"
	Inherits="News_View" Title="Untitled Page" %>

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
					News Articles</h2>
				<p>
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
					euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
					minim veniam, quis nostrud exercitation ulliam corper suscipit lobortis nisl ut
					aliquip ex ea commodo consequat. Duis autem veleum iriure dolor in hendrerit in
					vulputate velit esse molestie consequat, vel willum lunombro dolore eu feugiat nulla
					facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
					luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>
			</div>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClubsiteDB %>"
				SelectCommand="SELECT images.id, images.album, images.title FROM images, announcements WHERE images.album=announcements.albumid AND announcements.id=@id"
				OnSelected="SqlDataSource2_Selected">
				<SelectParameters>
					<asp:Parameter Type="Int32" DefaultValue="1" Name="id"></asp:Parameter>
				</SelectParameters>
			</asp:SqlDataSource>
			<asp:Panel ID="PhotoPanel" runat="server" CssClass="leftblock">
				<h2>
					Associated Album photos</h2>
				<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" DataKeyField="id"
					RepeatColumns="2" CellSpacing="2" SelectedIndex="0" ItemStyle-CssClass="unselected">
					<ItemTemplate>
						<a href='photoalbum_contents.aspx?Albumid=<%#Eval("album") %>'>
							<asp:Image ID="Image1" ImageUrl='<%# "imagefetch.ashx?size=1&imageid=" + Convert.ToString(Eval("id")) %>'
								runat="server" /><br />
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
						</a>
					</ItemTemplate>
				</asp:DataList>
			</asp:Panel>
		</div>
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			<div class="rightblock">
				<a href="news_list.aspx">News Article List</a></div>
			<div class="rightblock">
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton1" runat="server" OnClick="nextButton_Click">Next Article &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton2" runat="server" OnClick="prevButton_Click">&laquo; Previous article</asp:LinkButton>
				<div class="dashedline">
				</div>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="SELECT id, itemdate, title, description, photo, albumid, staticURL FROM Announcements WHERE (id = @id)">
					<SelectParameters>
						<asp:Parameter Type="Int32" DefaultValue="1" Name="id"></asp:Parameter>
					</SelectParameters>
				</asp:SqlDataSource>
				<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id"
					Width="444px" OnDataBound="FormView1_DataBound">
					<ItemTemplate>
						<h2>
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
						</h2>
						<div class="itemdetails">
							<p>
								<asp:Label Text='<%# Eval("itemdate","{0:D}") %>' runat="server" ID="itemdateLabel" />
							</p>
						</div>
						<Club:ImageThumbnail ID="thumb1" runat="server" ImageSize="large" PhotoID='<%# Eval("photo") %>' />
						<p>
							<asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" />
						</p>
						<asp:Panel runat="server" ID="panel1" CssClass="actionbuttons" Visible='<%# User.IsInRole("Administrators") %>'>
							<Club:RolloverLink ID="editbtn" runat="server" Text="Edit Article" NavigateURL='<%# "news_edit.aspx?ArticleID=" + Convert.ToString( ArticleID )%>' />
						</asp:Panel>
					</ItemTemplate>
				</asp:FormView>
				<div class="dashedline">
				</div>
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton3" runat="server" OnClick="nextButton_Click">Next Article &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton4" runat="server" OnClick="prevButton_Click">&laquo; Previous Article</asp:LinkButton>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
