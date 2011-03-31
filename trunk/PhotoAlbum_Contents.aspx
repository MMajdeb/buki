<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PhotoAlbum_Contents.aspx.cs"
	Inherits="PhotoAlbum_Contents" Title="Untitled Page" %>

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
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClubsiteDB %>"
				SelectCommand="SELECT id, title, notes FROM images WHERE (album = @albumid)"
				DeleteCommand="DELETE FROM images WHERE (id = @id)" UpdateCommand="UPDATE images SET title = @title, notes = @notes WHERE (id = @id)"
				OldValuesParameterFormatString="{0}">
				<SelectParameters>
					<asp:QueryStringParameter DefaultValue="1" Name="albumid" QueryStringField="albumid" />
				</SelectParameters>
				<DeleteParameters>
					<asp:Parameter Name="id" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="title" />
					<asp:Parameter Name="notes" />
					<asp:Parameter Name="id" />
				</UpdateParameters>
			</asp:SqlDataSource>
			<div class="leftblock">
				<h2>
					Album Contents</h2>
				<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" DataKeyField="id"
					RepeatColumns="2" CellSpacing="2" SelectedIndex="0" ItemStyle-CssClass="unselected"
					SelectedItemStyle-CssClass="selected" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
					<ItemTemplate>
						<asp:ImageButton ID="ImageButton1" ImageUrl='<%# "imagefetch.ashx?size=1&imageid=" + Convert.ToString(Eval("id")) %>'
							runat="server" CommandName="select" /><br />
						<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
					</ItemTemplate>
					<SelectedItemStyle CssClass="selected" />
					<ItemStyle CssClass="unselected" />
				</asp:DataList>
			</div>
		</div>
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			<div class="rightblock">
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubsiteDB %>"
					SelectCommand="SELECT title, ownerid, private, description, albumid FROM albums WHERE (albumid = @albumid)"
					DeleteCommand="DELETE FROM Albums WHERE (albumid = @albumid)" UpdateCommand="UPDATE Albums SET title = @title, private = @private, description = @description WHERE (albumid = @albumid)"
					OldValuesParameterFormatString="{0}">
					<SelectParameters>
						<asp:QueryStringParameter DefaultValue="1" Name="albumid" QueryStringField="albumid" />
					</SelectParameters>
					<DeleteParameters>
						<asp:Parameter Name="albumid" />
					</DeleteParameters>
					<UpdateParameters>
						<asp:Parameter Name="title" />
						<asp:Parameter Name="private" />
						<asp:Parameter Name="albumid" />
						<asp:Parameter Name="description" />
					</UpdateParameters>
				</asp:SqlDataSource>
				<asp:FormView ID="FormView1" runat="server" DataSourceID="Sqldatasource1" Width="100%"
					DataKeyNames="AlbumID">
					<ItemTemplate>
						<h2>
							Album
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
						</h2>
						<p>
							<asp:Label ID="privateLabel" runat="server" Text='<%# privatelabel((bool)Eval("Private")) %>' />
						</p>
						<asp:Label ID="desclabel" runat="server" Text='<%# Eval("description") %>' />
						<div class="actionbuttons">
							<Club:RolloverButton ID="GreenRolloverButton2" CommandName="Edit" Text="Edit Album Details"
								runat="server" Visible='<%#IsAdmin %>' />
						</div>
					</ItemTemplate>
					<EditItemTemplate>
						<table>
							<tr>
								<td class="formlabel">
									Album Name</td>
								<td>
									<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>' CssClass="txtfield" /></td>
							</tr>
							<tr>
								<td>
								</td>
								<td>
									<asp:CheckBox ID="CheckBox1" runat="server" Text="Album is private and non visible to other users"
										Checked='<%#Bind("Private") %>' /></td>
							</tr>
							<tr>
								<td class="formlabel">
									Notes</td>
								<td>
									<asp:TextBox ID="notesedit" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine"
										Rows="5" CssClass="txtblock" /></td>
							</tr>
						</table>
						<div class="actionbuttons">
							<Club:RolloverButton ID="update" CommandName="Update" Text="Apply Change" runat="server" />
							<Club:RolloverButton ID="cancel" CommandName="Cancel" Text="Cancel" runat="server" />
						</div>
					</EditItemTemplate>
				</asp:FormView>
			</div>
			<div class="rightblock">
				<asp:FormView ID="FormView2" runat="server" DataSourceID="Sqldatasource2" DataKeyNames="id"
					OnPageIndexChanged="FormView2_PageIndexChanged" Width="445px" AllowPaging="true"
					PagerSettings-Visible="false">
					<ItemTemplate>
						<div>
							<div class="nextlink">
								<asp:LinkButton ID="next1" runat="server" CommandName="Page" CommandArgument="Next">next photo &raquo;</asp:LinkButton>
							</div>
							<asp:LinkButton ID="prev1" runat="server" CommandName="Page" CommandArgument="Prev">&laquo; previous photo</asp:LinkButton>
						</div>
						<div class="dashedline">
						</div>
						<h2>
							Selected Photo:
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="descriptionLabel" />
						</h2>
						<Club:ImageThumbnail ID="thumb1" runat="server" ImageSize="Large" PhotoID='<%# Eval("id") %>' />
						<p>
							<asp:Label ID="noteslabel" runat="server" Text='<%#Eval("notes") %>' />
						</p>
						<p>
							<asp:HyperLink ID="downloadimg" runat="server" Text="Download full size image" NavigateUrl='<%# "imagefetch.ashx?size=2&ImageID=" + Convert.ToString(Eval("id")) %>'
								Target="_blank" />
						</p>
						<asp:Panel ID="editbtns1" runat="server" CssClass="actionbuttons" Visible='<%# IsAdmin %>'>
							<Club:RolloverButton ID="delete" CommandName="Delete" Text="Delete Photo" runat="server" />
							<Club:RolloverButton ID="edit" CommandName="Edit" Text="Edit Photo Details" runat="server" />
						</asp:Panel>
						<div class="dashedline">
						</div>
						<div>
							<div class="nextlink">
								<asp:LinkButton ID="next2" runat="server" CommandName="Page" CommandArgument="Next">next photo &raquo;</asp:LinkButton>
							</div>
							<asp:LinkButton ID="prev2" runat="server" CommandName="Page" CommandArgument="Prev">&laquo; previous photo</asp:LinkButton>
						</div>
					</ItemTemplate>
					<EditItemTemplate>
						<h2>
							Edit Photo Properties</h2>
						<Club:ImageThumbnail ID="thumb1" runat="server" ImageSize="Large" PhotoID='<%# Eval("id") %>' />
						<table>
							<tr>
								<td class="formlabel">
									Photo Caption:
								</td>
								<td>
									<asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("title") %>' CssClass="txtfield" /></td>
							</tr>
							<tr>
								<td class="formlabel">
									Notes</td>
								<td>
									<asp:TextBox ID="TextBox3" runat="server" Text='<%#Bind("notes") %>' Rows="3" TextMode="MultiLine"
										CssClass="txtblock" /></td>
							</tr>
						</table>
						<div class="actionbuttons">
							<Club:RolloverButton ID="update" CommandName="Update" Text="Apply Changes" runat="server" />
							<Club:RolloverButton ID="cancel" CommandName="Cancel" Text="Cancel" runat="server" />
						</div>
					</EditItemTemplate>
				</asp:FormView>
			</div>
			<asp:Panel ID="uploadpanel" runat="server" CssClass="rightblock">
				<h2>
					Upload Photo</h2>
				<asp:Label ID="ErrorLabel" runat="server" Text="" />
				<table>
					<tr>
						<td class="formlabel">
							File:</td>
						<td>
							<asp:FileUpload ID="FileUpload1" runat="server" CssClass="txtfield" /></td>
					</tr>
					<tr>
						<td class="formlabel">
							Image title:</td>
						<td>
							<asp:TextBox ID="imgTitle" runat="server" CssClass="txtfield" />
						</td>
					</tr>
				</table>
				<div class="actionbuttons">
					<Club:RolloverButton ID="UploadFile" runat="server" Text="Upload" OnClick="UploadFile_Click" />
				</div>
			</asp:Panel>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
