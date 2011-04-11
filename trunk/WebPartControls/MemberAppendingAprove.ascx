<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberAppendingAprove.ascx.cs"
	Inherits="WebPartControls_MemberAppendingAprove" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:ObjectDataSource ID="UsersObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
	SelectMethod="GetDataByUsersNotApproved" TypeName="BukiDataViewsTableAdapters.UsersTableAdapter">
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="SuppliersObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
	SelectMethod="GetDataBySuppliersNotApproved" TypeName="BukiDataViewsTableAdapters.UsersTableAdapter">
</asp:ObjectDataSource>
<h2>
	������� ������ ������</h2>
<div class="dashedline">
</div>
<h2>
	������� ������</h2>
<div class="dashedline">
</div>
<asp:ListView ID="DataList1" runat="server" DataSourceID="UsersObjectDataSource1">
	<LayoutTemplate>
		<div id="itemPlaceholderContainer" runat="server" style="">
			<span id="itemPlaceholder" runat="server" />
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<div>
			<div>
				<a href='<%# "Admin/Pennding/ApproveUsers.aspx?username=" + Eval("UserName") + "&usertype=0" %>'>
					<%#Eval("UserName")%></a>
			</div>
			����� �����
			<asp:Label ID="Label3" runat="server" Text='<%# Eval("CreateDate") %>' />
			<p>
				<a href='<%# "Admin/Pennding/ApproveUsers.aspx?username=" + Eval("UserName") + "&usertype=0" %>'>
					����� �����&raquo;</a>
			</p>
			<div class="clearlist">
			</div>
		</div>
	</ItemTemplate>
	<EmptyDataTemplate>
		<span>�� ����� ������� ������� ������</span>
	</EmptyDataTemplate>
</asp:ListView>
<div class="dashedline">
</div>
<h2>
	�����</h2>
<div class="dashedline">
</div>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SuppliersObjectDataSource1">
	<LayoutTemplate>
		<div id="itemPlaceholderContainer" runat="server" style="">
			<span id="itemPlaceholder" runat="server" />
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<div>
			<div>
				<a href='<%# "Admin/Pennding/ApproveUsers.aspx?username=" + Eval("UserName") + "&usertype=1" %>'>
					<%#Eval("UserName")%></a>
			</div>
			����� �����
			<asp:Label ID="Label3" runat="server" Text='<%# Eval("CreateDate") %>' />
			<p>
				<a href='<%# "Admin/Pennding/ApproveUsers.aspx?username=" + Eval("UserName") + "&usertype=1" %>'>
					����� �����&raquo;</a>
			</p>
			<div class="clearlist">
			</div>
		</div>
	</ItemTemplate>
	<EmptyDataTemplate>
		<span>�� ����� ����� ������� ������</span>
	</EmptyDataTemplate>
</asp:ListView>
<div class="dashedline">
</div>
