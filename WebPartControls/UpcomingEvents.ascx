<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UpcomingEvents.ascx.cs" Inherits="WebPartControls_UpcomingEvents" %>

				<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="SELECT top 2 dbo.Events.id, dbo.Events.starttime, dbo.events.endtime, dbo.Events.title, dbo.Locations.title AS locationname FROM dbo.Events LEFT OUTER JOIN dbo.Locations ON dbo.Events.location = dbo.Locations.id WHERE     (dbo.Events.starttime > GETDATE()) ORDER BY dbo.Events.starttime, dbo.events.id ">
				</asp:SqlDataSource>
				<h2>
					Upcoming Events</h2>
				<div class="dashedline">
				</div>
				<asp:GridView AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ID="GridView1"
					runat="server" ShowHeader="False" Width="410px" CssClass="eventlist" GridLines="None">
					<Columns>
						<asp:BoundField DataField="starttime" DataFormatString="{0:d}" HeaderText="starttime"
							SortExpression="starttime"></asp:BoundField>
						<asp:TemplateField>
							<ItemTemplate>
								<asp:HyperLink ID="HyperLink1" ImageUrl="~/images/icon_event.gif" runat="server" NavigateUrl='<%# Eval("id","Events_download.ashx?Eventid={0}") %>' />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# ShowDuration(Eval("starttime"),Eval("endtime")) %>' />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="events_view.aspx?eventid={0}"
							DataTextField="title"></asp:HyperLinkField>
						<asp:BoundField DataField="locationname" HeaderText="locationname" SortExpression="locationname"
							NullDisplayText=""></asp:BoundField>
					</Columns>
				</asp:GridView>
				<div class="dashedline">
				</div>
				<a href="~/Events_list.aspx">View all events &raquo;</a>
			