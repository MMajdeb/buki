<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Links.aspx.cs"
	Inherits="Links" Title="Clubsite Links" %>

<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>
				Links</h2>
			<p>
				Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
				euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
				minim veniam, quis nostrud exercitation ulliam corper suscipit lobortis nisl ut
				aliquip ex ea commodo consequat. Duis autem veleum iriure dolor in hendrerit in
				vulputate velit esse molestie consequat, vel willum lunombro dolore eu feugiat nulla
				facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
				luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>
		</div>
		<div class="fullwidth">
			The club's links.
		</div>
	</div>
</asp:Content>
