<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="role_view.aspx.cs" Inherits="admin_role_view" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="body">
<div id="loginbanner">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Role" />
    <asp:TextBox ID="txtNewRole" runat="server"></asp:TextBox>
    <asp:Label ID="lblNewRoleError" runat="server" ForeColor="Red" Visible="False"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <columns >
                    <asp:templateField headerText="User" >
                        <itemTemplate>
                            <%# Container.DataItem %>
                        </itemTemplate>
                    </asp:templateField>

                    <asp:templateField headerText="Add/Remove Users" >
                        <itemTemplate>
                            <asp:linkButton runat="server" id="linkButton1" text="Manage" commandName="ManageRole" commandArgument='<%#Container.DataItem%>' onCommand='LinkButtonClick'/>
                        </itemTemplate>
                    </asp:templateField>

                    <asp:templateField >
                        <itemStyle horizontalAlign="Center"/>
                        <itemTemplate>
                            <asp:linkButton runat="server" id="linkButton2" text="Delete" commandName="DeleteRole" commandArgument='<%#Container.DataItem%>' onCommand='LinkButtonClick' OnClientClick="return confirm('Are you sure you want to delete this record?');"/>
                        </itemTemplate>
                    </asp:templateField>
                </columns>
    </asp:GridView>
</div>
</div>
</asp:Content>

