<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2listView.aspx.cs" Inherits="Test_Default2listView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
			OldValuesParameterFormatString="original_{0}" 
			SelectMethod="GetDataByEventsUpcommingUsers" 
			TypeName="BukiDataViewsTableAdapters.EventsTableAdapter">
			<SelectParameters>
				<asp:Parameter DbType="Guid" DefaultValue="45" Name="UserID" />
			</SelectParameters>
		</asp:ObjectDataSource>
		
		<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
			DataSourceID="ObjectDataSource1">
			<ItemTemplate>
				<span style="">id:
				<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
				<br />
				starttime:
				<asp:Label ID="starttimeLabel" runat="server" Text='<%# Eval("starttime") %>' />
				<br />
				endtime:
				<asp:Label ID="endtimeLabel" runat="server" Text='<%# Eval("endtime") %>' />
				<br />
				title:
				<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
				<br />
				description:
				<asp:Label ID="descriptionLabel" runat="server" 
					Text='<%# Eval("description") %>' />
				<br />
				staticURL:
				<asp:Label ID="staticURLLabel" runat="server" Text='<%# Eval("staticURL") %>' />
				<br />
				location:
				<asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
				<br />
				photo:
				<asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
				<br />
				album:
				<asp:Label ID="albumLabel" runat="server" Text='<%# Eval("album") %>' />
				<br />
				<br />
				</span>
			</ItemTemplate>			
			<EmptyDataTemplate>
				<span>No data was returned.</span>
			</EmptyDataTemplate>			
			<LayoutTemplate>
				<div ID="itemPlaceholderContainer" runat="server" style="">
					<span ID="itemPlaceholder" runat="server" />
				</div>
				<div style="">
					<asp:DataPager ID="DataPager1" runat="server">
						<Fields>
							<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
								ShowNextPageButton="False" ShowPreviousPageButton="False" />
							<asp:NumericPagerField />
							<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
								ShowNextPageButton="False" ShowPreviousPageButton="False" />
						</Fields>
					</asp:DataPager>
				</div>
			</LayoutTemplate>
		</asp:ListView>
    </div>
    </form>
</body>
</html>
