<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DateAndTimePicker.ascx.cs"
	Inherits="DateAndTimePicker" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<div class="controlblock">
	<table>
		<tr>
			<td>
				Date:
			</td>
			<td>
				<Club:DatePicker ID="dp1" runat="server" />
			</td>
			<td>
				Time:
			</td>
			<td>
				<Club:TimePicker ID="tp1" runat="server" />
			</td>
		</tr>
	</table>
</div>
