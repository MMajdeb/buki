<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RecentNews.ascx.cs" Inherits="WebPartControls_RecentNews" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="~/ImageThumbnail.ascx" %>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ProviderName="System.Data.SqlClient"
					ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>" SelectCommand="SELECT top 5 [id], [itemdate], [title], [description], [photo] FROM [Announcements] order by itemdate desc">
				</asp:SqlDataSource>
				<h2>
					Recent news</h2>
				<div class="dashedline">
				</div>
				<asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
					<ItemTemplate>
						<div class="listitem">
							<div class="thumbnail">
								<a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("ID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail2" runat="server" PhotoID='<%# Eval("photo") %>'
										NoPhotoImg="images/news.jpg" />
								</a>
							</div>
							<h3>
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("itemdate","{0:d}") %>' />
								&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("ID"))%>'>
									<asp:Label ID="Label4" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<p>
								<asp:Label ID="Label2" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("description")) %>' />
								<a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("ID")) %>'>read more
									&raquo;</a>
							</p>
							<div class="clearlist">
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
				<div class="dashedline">
				</div>
				<a href="news_list.aspx">Read all news articles &raquo;</a>
			