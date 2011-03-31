<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PhotoAlbum_New.aspx.cs"
	Inherits="PhotoAlbum_New" Title="Untitled Page" %>

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
				<h2>
					Add new Album</h2>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubsiteDB %>"
					SelectCommand="SELECT title, ownerid, private FROM albums WHERE (albumid = @albumid)"
					InsertCommand="INSERT INTO Albums(title, parentid, ownerid, private) VALUES (@title, @parentid, @ownerid, @private)"
					OldValuesParameterFormatString="{0}" OnInserting="SqlDataSource1_Inserting" OnInserted="SqlDataSource1_Inserted">
					<SelectParameters>
						<asp:Parameter Name="albumid" />
					</SelectParameters>
					<InsertParameters>
						<asp:Parameter Name="title" />
						<asp:Parameter Name="parentid" DefaultValue="0" />
						<asp:Parameter Name="ownerid" />
						<asp:Parameter Name="private" />
					</InsertParameters>
				</asp:SqlDataSource>
				<asp:FormView ID="FormView1" runat="server" DataSourceID="Sqldatasource1" Width="445px"
					DefaultMode="Insert">
					<InsertItemTemplate>
						<table>
							<tr>
								<td>
									Album Name</td>
								<td>
									<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>' /></td>
							</tr>
							<tr>
								<td>
								</td>
								<td>
									<asp:CheckBox ID="CheckBox1" runat="server" Text="Album is private and non visible to other users"
										Checked='<%#Bind("Private") %>' /></td>
							</tr>
						</table>
						<div style="text-align: right">
							<Club:RolloverButton ID="GreenRolloverButton2" CommandName="Insert" Text="Add Album"
								runat="server" />
							<Club:RolloverButton ID="GreenRolloverButton3" CommandName="Cancel" Text="Cancel"
								runat="server" />
						</div>
					</InsertItemTemplate>
				</asp:FormView>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
