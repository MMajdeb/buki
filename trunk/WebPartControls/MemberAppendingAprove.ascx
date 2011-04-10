<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberAppendingAprove.ascx.cs"
	Inherits="WebPartControls_MemberAppendingAprove" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:ObjectDataSource ID="UsersObjectDataSource1" runat="server" 
	OldValuesParameterFormatString="original_{0}" 
	SelectMethod="GetDataByUsersNotApproved" 
	TypeName="BukiDataViewsTableAdapters.UsersTableAdapter">
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="SuppliersObjectDataSource1" runat="server" 
	OldValuesParameterFormatString="original_{0}" 
	SelectMethod="GetDataBySuppliersNotApproved" 
	TypeName="BukiDataViewsTableAdapters.UsersTableAdapter">
</asp:ObjectDataSource>
<h2>
	משתמשים שמחכים לאישור</h2>
<div class="dashedline">
</div>
<h2>
	משתמשים רגילים</h2>
<div class="dashedline">
</div>
<asp:ListView ID="DataList1" runat="server" DataSourceID="UsersObjectDataSource1">
	<LayoutTemplate>
		<div id="itemPlaceholderContainer" runat="server" style="">
							<span id="itemPlaceholder" runat="server" />
		</div>					
	</LayoutTemplate>
	<ItemTemplate>
		<div class="listitem">
			<div class="thumbnail">
				<a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("UserId"))%>'></a>
			</div>
			<h3>
				<asp:Label ID="Label3" runat="server" Text='<%# Eval("CreateDate","{0:d}") %>' />
				&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("UserId"))%>'>
					<asp:Label ID="Label4" runat="server" Text='<%# Eval("UserId") %>' />
				</a>
			</h3>
			<p>
				<asp:Label ID="Label2" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("UserName")) %>' />
				<a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("UserName")) %>'>read more
					&raquo;</a>
			</p>
			<div class="clearlist">
			</div>
		</div>
	</ItemTemplate>	
	<EmptyDataTemplate>
						<span>No approve ppending users was returned.</span>
					</EmptyDataTemplate>
</asp:ListView>
<div class="dashedline">
</div>
<h2>
	ספקים</h2>
<div class="dashedline">
</div>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SuppliersObjectDataSource1">
	<LayoutTemplate>
		<div id="itemPlaceholderContainer" runat="server" style="">
							<span id="itemPlaceholder" runat="server" />
		</div>					
	</LayoutTemplate>
	<ItemTemplate>
		<div class="listitem">
			<div class="thumbnail">
				<a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("UserId"))%>'></a>
			</div>
			<h3>
				<asp:Label ID="Label3" runat="server" Text='<%# Eval("CreateDate","{0:d}") %>' />
				&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("UserId"))%>'>
					<asp:Label ID="Label4" runat="server" Text='<%# Eval("UserId") %>' />
				</a>
			</h3>
			<p>
				<asp:Label ID="Label2" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("UserName")) %>' />
				<a href='<%# "News_View.aspx?Articleid=" + Convert.ToString(Eval("UserName")) %>'>read more
					&raquo;</a>
			</p>
			<div class="clearlist">
			</div>
		</div>
	</ItemTemplate>	
	<EmptyDataTemplate>
						<span>No approve ppending users was returned.</span>
					</EmptyDataTemplate>
</asp:ListView>
<div class="dashedline">
</div>
