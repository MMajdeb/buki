<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Test_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
			DataKeyNames="albumid" DataSourceID="SqlDataSource1" 
			EmptyDataText="There are no data records to display.">
			<Columns>
				<asp:BoundField DataField="albumid" HeaderText="albumid" ReadOnly="True" 
					SortExpression="albumid" />
				<asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
				<asp:BoundField DataField="parentid" HeaderText="parentid" 
					SortExpression="parentid" />
				<asp:CheckBoxField DataField="private" HeaderText="private" 
					SortExpression="private" />
				<asp:BoundField DataField="description" HeaderText="description" 
					SortExpression="description" />
				<asp:BoundField DataField="ownerid" HeaderText="ownerid" 
					SortExpression="ownerid" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
			ConnectionString="<%$ ConnectionStrings:ClubDBConnectionString1 %>" 
			DeleteCommand="DELETE FROM [Albums] WHERE [albumid] = @albumid" 
			InsertCommand="INSERT INTO [Albums] ([title], [parentid], [private], [description], [ownerid]) VALUES (@title, @parentid, @private, @description, @ownerid)" 
			ProviderName="<%$ ConnectionStrings:ClubDBConnectionString1.ProviderName %>" 
			SelectCommand="SELECT [albumid], [title], [parentid], [private], [description], [ownerid] FROM [Albums]" 
			UpdateCommand="UPDATE [Albums] SET [title] = @title, [parentid] = @parentid, [private] = @private, [description] = @description, [ownerid] = @ownerid WHERE [albumid] = @albumid">
			<DeleteParameters>
				<asp:Parameter Name="albumid" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="title" Type="String" />
				<asp:Parameter Name="parentid" Type="Int32" />
				<asp:Parameter Name="private" Type="Boolean" />
				<asp:Parameter Name="description" Type="String" />
				<asp:Parameter Name="ownerid" Type="Object" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="title" Type="String" />
				<asp:Parameter Name="parentid" Type="Int32" />
				<asp:Parameter Name="private" Type="Boolean" />
				<asp:Parameter Name="description" Type="String" />
				<asp:Parameter Name="ownerid" Type="Object" />
				<asp:Parameter Name="albumid" Type="Int32" />
			</UpdateParameters>
		</asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
