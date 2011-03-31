<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DurationPicker.ascx.cs"
	Inherits="DurationPicker" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<div class="controlblock">
	<table>
		<tr>
			<td>
				Start Date:
			</td>
			<td>
				<Club:DatePicker ID="dp1" runat="server" />
			</td>
			<td>
				<Club:TimePicker ID="tp1" runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				End Date:
			</td>
			<td>
				<Club:DatePicker ID="dp2" runat="server" />
			</td>
			<td>
				<Club:TimePicker ID="tp2" runat="server" />
			</td>
		</tr>
	</table>
</div>
