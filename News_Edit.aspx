<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="News_Edit.aspx.cs"
	Inherits="News_Edit" Title="Untitled Page" ValidateRequest="false" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" TagName="Photopicker" Src="photos_formpicker.ascx" %>
<%@ Register TagPrefix="Club" TagName="Dateandtimepicker" Src="Dateandtimepicker.ascx" %>
<%@ Register TagPrefix="Club" TagName="PhotoAlbumPicker" Src="photoalbum_picker.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id"
			DefaultMode="Edit" OnDataBound="FormView1_DataBound" OnItemUpdated="FormView1_ItemUpdated"
			OnItemInserted="FormView1_ItemInserted">
			<InsertItemTemplate>
				<div class="fullwidth">
					<h3>
						New News Article</h3>
					<div class="dashedline">
					</div>
					<div>
						<div class="actionbuttons">
							<Club:RolloverButton ID="GreenRolloverButton2" CommandName="Insert" Text="Save Article"
								runat="server" />
							<Club:RolloverLink ID="GreenRolloverLink1" Text="Cancel" runat="server" NavigateURL="news_list.aspx" />
						</div>
					</div>
					<div class="dashedline">
					</div>
					<table>
						<tr>
							<td class="formlabel">
								Article Title:
							</td>
							<td align="left">
								<asp:TextBox ID="titleTextBox" runat="server" Width="500px" Text='<%# Bind("title") %>'></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Link:
							</td>
							<td align="left">
								<asp:CheckBox ID="CheckBox1" runat="server" Text="Use a link instead of inline content for this article."
									OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" /><br />
								URL:
								<asp:TextBox Text='<%# Bind("staticURL") %>' runat="server" ID="staticURLTextBox"
									Width="450px" />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								<asp:Label ID="Label1" runat="server" Text="Description:" />
							</td>
							<td align="left">
								<asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox"
									Rows="10" TextMode="MultiLine" Width="500px" Height="166px"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Article Date</td>
							<td align="left">
								The news article will not be visible to users until after this date.
								<Club:Dateandtimepicker ID="dtpicker" runat="server" selectedDateTime='<%#Bind("itemdate") %>' />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Photo:</td>
							<td align="left">
								<Club:Photopicker ID="Photopicker1" runat="server" ImageId='<%# Bind("photo") %>'
									SmallImage="true" />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Photo Album</td>
							<td align="left">
								Optionally, the news article can be assoiated with a photo album.
								<br />
								<Club:PhotoAlbumPicker ID="albumpick" runat="server" AlbumID='<%# bind("Albumid") %>' />
							</td>
						</tr>
					</table>
					<div class="dashedline">
					</div>
					<div class="actionbuttons">
						<Club:RolloverButton ID="GreenRolloverButton3" CommandName="Insert" Text="Save Article"
							runat="server" />
						<Club:RolloverLink ID="GreenRolloverLink2" Text="Cancel" runat="server" NavigateURL="news_list.aspx" />
					</div>
				</div>
				</div>
			</InsertItemTemplate>
			<EditItemTemplate>
				<div class="fullwidth">
					<h3>
						Edit News Article</h3>
					<div class="dashedline">
					</div>
					<div class="actionbuttons">
						<Club:RolloverButton ID="GreenRolloverButton1" CommandName="Update" Text="Save Changes"
							runat="server" />
						<Club:RolloverLink ID="GreenRolloverLink3" Text="Cancel" runat="server" NavigateURL='<%# "news_view.aspx?ArticleID=" + Convert.ToString(Eval("ID")) %>' />
					</div>
					<div class="dashedline">
					</div>
					<table>
						<tr>
							<td class="formlabel">
								Article Title:
							</td>
							<td align="left">
								<asp:TextBox ID="titleTextBox" runat="server" Width="500px" Text='<%# Bind("title") %>'></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Link:
							</td>
							<td align="left">
								<asp:CheckBox ID="CheckBox1" runat="server" Text="Use a link instead of inline content for this article."
									OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" /><br />
								URL:
								<asp:TextBox Text='<%# Bind("staticURL") %>' runat="server" ID="staticURLTextBox"
									Width="450px" />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								<asp:Label ID="Label1" runat="server" Text="Description:" />
							</td>
							<td align="left">
								<asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox"
									Rows="10" TextMode="MultiLine" Width="500px" Height="166px"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Article Date</td>
							<td align="left">
								<p>
									The news article will not be visible to users until after this date.
								</p>
								<Club:Dateandtimepicker ID="dtpicker" runat="server" selectedDateTime='<%#Bind("itemdate") %>' />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Photo:</td>
							<td align="left">
								<Club:Photopicker ID="Photopicker1" runat="server" ImageId='<%# Bind("photo") %>'
									SmallImage="true" />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Photo Album</td>
							<td align="left">
								<p>
									Optionally, the news article can be assoiated with a photo album.
								</p>
								<Club:PhotoAlbumPicker ID="albumpick" runat="server" AlbumID='<%# bind("Albumid") %>' />
							</td>
						</tr>
					</table>
					<div class="dashedline">
					</div>
					<div class="actionbuttons">
						<Club:RolloverButton ID="apply1" CommandName="Update" Text="Save Changes" runat="server" />
						<Club:RolloverLink ID="Cancel" Text="Cancel" runat="server" NavigateURL='<%# "news_view.aspx?ArticleID=" + Convert.ToString(Eval("ID")) %>' />
					</div>
				</div>
				</div>
			</EditItemTemplate>
		</asp:FormView>
	</div>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
		SelectCommand="SELECT id, itemdate, title, description, staticURL, photo, albumid from announcements where Announcements.id=@id"
		InsertCommand="INSERT INTO Announcements(itemdate, title, description, staticURL, photo, albumid) VALUES (@itemdate, @title, @description, @staticURL, @photo, @albumid)"
		UpdateCommand="UPDATE Announcements SET itemdate = @itemdate, title = @title, description = @description, staticURL = @staticURL, photo = @photo, albumid = @albumid WHERE (id = @id)"
		DeleteCommand="Delete from Announcements where id=@id" OldValuesParameterFormatString="{0}">
		<SelectParameters>
			<asp:QueryStringParameter Name="id" QueryStringField="ArticleID" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="itemdate" Type="DateTime" />
			<asp:Parameter Name="title" />
			<asp:Parameter Name="description" />
			<asp:Parameter Name="staticURL" />
			<asp:Parameter Name="location" />
			<asp:Parameter Name="photo" />
			<asp:Parameter Name="id" />
			<asp:Parameter Name="albumid" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="itemdate" Type="DateTime" />
			<asp:Parameter Name="title" />
			<asp:Parameter Name="description" />
			<asp:Parameter Name="staticURL" />
			<asp:Parameter Name="location" />
			<asp:Parameter Name="photo" />
			<asp:Parameter Name="id" />
			<asp:Parameter Name="albumid" />
		</InsertParameters>
		<DeleteParameters>
			<asp:QueryStringParameter Name="id" QueryStringField="ArticleID" />
		</DeleteParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>" ID="AlbumList"
		runat="server" SelectCommand="AlbumList" SelectCommandType="StoredProcedure"
		OnSelecting="AlbumList_Selecting">
		<SelectParameters>
			<asp:Parameter Name="userid" />
		</SelectParameters>
	</asp:SqlDataSource>
</asp:Content>
