<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Events_Edit.aspx.cs"
	Inherits="Events_Edit" Title="Untitled Page" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" TagName="PhotoPicker" Src="Photos_FormPicker.ascx" %>
<%@ Register TagPrefix="Club" TagName="DurationPicker" Src="DurationPicker.ascx" %>
<%@ Register TagPrefix="Club" TagName="LocationPicker" Src="LocationsPicker.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="actionbuttons">
			<Club:RolloverLink ID="Logoutbtn" runat="server" Text="Add New Event" OnClientClick="foo"
				NavigateURL="Event_edit.aspx?Action=New" />
		</div>
		<div class="fullwidth">
			<h3>
				Event Details</h3>
			<div class="dashedline">
			</div>
			<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id"
				DefaultMode="Edit" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated"
				Width="100%">
				<InsertItemTemplate>
					<div class="actionbuttons">
						<Club:RolloverButton ID="GreenRolloverButton2" CommandName="Insert" Text="Add Event"
							runat="server" />
						<Club:RolloverLink ID="GreenRolloverLink1" Text="Cancel" runat="server" NavigateURL='<%# "Events_view.aspx?EventID=" + Convert.ToString(Eval("ID")) %>' />
					</div>
					<div class="dashedline">
					</div>
					<table>
						<tr>
							<td class="formlabel">
								Event Heading:
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
								<asp:CheckBox ID="CheckBox1" runat="server" Text="Use a link instead of inline content for this anouncement:" /><br />
								Link:
								<asp:TextBox Text='<%# Bind("staticURL") %>' runat="server" ID="staticURLTextBox"
									Width="450px" />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Location:
							</td>
							<td align="left">
								<Club:Locationpicker ID="LocationPicker1" runat="server" LocationID='<%# Bind("location")%>' />
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
								Event Date:</td>
							<td align="left">
								<Club:Durationpicker ID="dtpicker" runat="server" startDateTime='<%#Bind("Starttime") %>'
									endDateTime='<%#Bind("endtime") %>' />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Photo:</td>
							<td align="left">
								<Club:Photopicker ID="Photopicker1" runat="server" ImageId='<%# Bind("photo") %>' />
							</td>
						</tr>
					</table>
					<div class="dashedline">
					</div>
					<div class="actionbuttons">
						<Club:RolloverButton ID="apply1" CommandName="Insert" Text="Add Event" runat="server" />
						<Club:RolloverLink ID="Cancel" Text="Cancel" runat="server" NavigateURL='<%# "Events_view.aspx?EventID=" + Convert.ToString(Eval("ID")) %>' />
					</div>
				</InsertItemTemplate>
				<EditItemTemplate>
					<div class="actionbuttons">
						<Club:RolloverButton ID="GreenRolloverButton1" CommandName="Update" Text="Apply Changes"
							runat="server" />
						<Club:RolloverLink ID="GreenRolloverLink1" Text="Cancel" runat="server" NavigateURL='<%# "Events_view.aspx?EventID=" + Convert.ToString(Eval("ID")) %>' />
					</div>
					<div class="dashedline">
					</div>
					<table>
						<tr>
							<td class="formlabel">
								Event Heading:
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
								<asp:CheckBox ID="CheckBox1" runat="server" Text="Use a link instead of inline content for this anouncement:" /><br />
								Link:
								<asp:TextBox Text='<%# Bind("staticURL") %>' runat="server" ID="staticURLTextBox"
									Width="450px" />
							</td>
						</tr>
						<tr>
							<td class="formlabel">
								Location:
							</td>
							<td align="left">
								<Club:Locationpicker ID="LocationPicker1" runat="server" LocationID='<%# Bind("location")%>' />
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
								Event Date:</td>
							<td align="left">
								<Club:Durationpicker ID="dtpicker" runat="server" startDateTime='<%#Bind("Starttime") %>'
									endDateTime='<%#Bind("endtime") %>' />
							</td>
						</tr>
						<td class="formlabel">
							Photo:</td>
						<td align="left">
							<Club:Photopicker ID="Photopicker1" runat="server" ImageId='<%# Bind("photo") %>' />
						</td>
						</tr>
					</table>
					<div class="dashedline">
					</div>
					<div class="actionbuttons">
						<Club:RolloverButton ID="apply1" CommandName="Update" Text="Apply Changes" runat="server" />
						<Club:RolloverLink ID="Cancel" Text="Cancel" runat="server" NavigateURL='<%# "Events_view.aspx?EventID=" + Convert.ToString(Eval("ID")) %>' />
					</div>
				</EditItemTemplate>
			</asp:FormView>
		</div>
	</div>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
		SelectCommand="SELECT dbo.Events.id, dbo.Events.starttime, dbo.events.endtime, dbo.Events.title, dbo.Events.description, dbo.Events.staticURL, dbo.Events.photo,  dbo.Events.location, dbo.Locations.title AS locationname FROM  dbo.Events LEFT OUTER JOIN dbo.Locations ON dbo.Events.location = dbo.Locations.id where Events.id=@id"
		InsertCommand="INSERT INTO Events(starttime, endtime, title, description, staticURL, location, photo) VALUES (@starttime, @endtime,  @title, @description, @staticURL, @location, @photo); SET @ident=SCOPE_IDENTITY();"
		UpdateCommand="UPDATE Events SET starttime = @starttime, endtime=@endtime, title = @title, description = @description, staticURL = @staticURL, location = @location, photo = @photo WHERE (id = @id)"
		DeleteCommand="DELETE Events WHERE id=@id" 
		oninserted="SqlDataSource1_Inserted">
		<SelectParameters>
			<asp:QueryStringParameter Name="id" QueryStringField="ID" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="starttime" Type="DateTime" />
			<asp:Parameter Name="endtime" Type="DateTime" />
			<asp:Parameter Name="title" />
			<asp:Parameter Name="description" />
			<asp:Parameter Name="staticURL" />
			<asp:Parameter Name="location" />
			<asp:Parameter Name="photo" />
			<asp:Parameter Name="id" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="starttime" Type="DateTime" />
			<asp:Parameter Name="endtime" Type="DateTime" />
			<asp:Parameter Name="title" />
			<asp:Parameter Name="description" />
			<asp:Parameter Name="staticURL" />
			<asp:Parameter Name="location" />
			<asp:Parameter Name="photo" />
			<asp:Parameter Name="id" />
			<asp:Parameter Name="ident" Direction="Output" DbType="Int32" />
		</InsertParameters>
		<DeleteParameters>
			<asp:QueryStringParameter Name="id" QueryStringField="ID" />
		</DeleteParameters>
	</asp:SqlDataSource>
</asp:Content>
