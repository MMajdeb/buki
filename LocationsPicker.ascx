<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LocationsPicker.ascx.cs"
	Inherits="LocationsPicker" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>" ID="LocationList"
	runat="server" SelectCommand="SELECT [title], [id], [description], [linkURL], [directions], [address], [photo] FROM [Locations]">
</asp:SqlDataSource>
<table>
	<tr valign="top">
		<td style="height: 47px">
			<asp:ListBox ID="locationselect" DataSourceID="LocationList" DataTextField="title"
				DataValueField="id" AutoPostBack="true" runat="server" AppendDataBoundItems="true"
				Rows="5" OnSelectedIndexChanged="locationselect_SelectedIndexChanged" OnDataBinding="locationselect_DataBinding">
			</asp:ListBox>
		</td>
		<td>
			<asp:FormView DataSourceID="LocationList" ID="FormView1" runat="server">
				<ItemTemplate>
					<div>
						<p>
							<asp:Label ID="descriptionLabel" runat="server" Text='<%# SharedRoutines.truncate(Convert.ToString(Eval("description"))) %>' />
							<a href='<%# "Locations_view.aspx?Locationid=" + Convert.ToString( Eval("ID"))%>'>more
								details &raquo;</a></p>
						</p>
						<p>
							<asp:Label ID="Label1" runat="server" Text='<%# Eval("address") %>' />
						</p>
					</div>
				</ItemTemplate>
			</asp:FormView>
		</td>
	</tr>
</table>
<Club:RolloverLink ID="addlocation" runat="server" NavigateURL="locations_edit.aspx?Action=new"
	Text="Add new location" target="_new" />