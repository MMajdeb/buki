<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="_Default" Title="בוקי! - ניהול הזמנות אונליין" %>

<%@ Register Src="WebPartControls/MemberAppendingAprove.ascx" TagName="MemberAppendingAprove" TagPrefix="uc5" %>

<%@ Register Src="WebPartControls/UpcomingEvents.ascx" TagName="UpcomingEvents" TagPrefix="uc4" %>

<%@ Register Src="WebPartControls/RecentNews.ascx" TagName="RecentNews" TagPrefix="uc3" %>

<%@ Register Src="WebPartControls/MemberLogin.ascx" TagName="MemberLogin" TagPrefix="uc2" %>

<%@ Register Src="WebPartControls/Welcome.ascx" TagName="Welcome" TagPrefix="uc1" %>

<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="body" border="0">
        <tr>
            <td style="height: 15px;" id="columnleftTD" valign="top">
                <asp:WebPartZone ID="Left" runat="server" WebPartVerbRenderMode="TitleBar" PartChromeType="None" Width="100%">
                    <ZoneTemplate>
                        <uc2:MemberLogin ID="MemberLogin1" runat="server" >
                        </uc2:MemberLogin>
						<uc5:MemberAppendingAprove ID="MemberAppendingAprove1" runat="server">
                        </uc5:MemberAppendingAprove>
                        <uc1:Welcome ID="Welcome1" runat="server" />
                    </ZoneTemplate>
                </asp:WebPartZone>
            </td>
            <td style="height: 15px" valign="top" id="columnright">
                <asp:WebPartZone ID="Right" runat="server" TitleBarVerbButtonType="Link" WebPartVerbRenderMode="TitleBar" PartChromeType="None" Width="100%">
                    <ZoneTemplate>
                        <uc3:RecentNews ID="RecentNews1" runat="server" />
                        <uc4:UpcomingEvents ID="UpcomingEvents1" runat="server">
                        </uc4:UpcomingEvents>
                    </ZoneTemplate>
                </asp:WebPartZone>
            </td>
            <td style="height: 15px" valign="top">
                <asp:CatalogZone ID="CatalogZone1" runat="server" BackColor="#FFFBD6" BorderColor="#CCCCCC"
                    BorderWidth="1px" Font-Names="Verdana" Padding="6">
                    <HeaderVerbStyle Font-Bold="False" Font-Size="0.8em" Font-Underline="False" ForeColor="#333333" />
                    <PartTitleStyle BackColor="#990000" Font-Bold="True" Font-Size="0.8em" ForeColor="White" />
                    <PartChromeStyle BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" />
                    <InstructionTextStyle Font-Size="0.8em" ForeColor="#333333" />
                    <PartLinkStyle Font-Size="0.8em" />
                    <EmptyZoneTextStyle Font-Size="0.8em" ForeColor="#333333" />
                    <LabelStyle Font-Size="0.8em" ForeColor="#333333" />
                    <VerbStyle Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" />
                    <PartStyle BorderColor="#FFFBD6" BorderWidth="5px" />
                    <SelectedPartLinkStyle Font-Size="0.8em" />
                    <FooterStyle BackColor="#FFCC66" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#FFCC66" Font-Bold="True" Font-Size="0.8em" ForeColor="#333333" />
                    <EditUIStyle Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" />
                    <ZoneTemplate>
                        <asp:DeclarativeCatalogPart ID="DeclarativeCatalogPart1" runat="server">
                        </asp:DeclarativeCatalogPart>
                        <asp:PageCatalogPart ID="PageCatalogPart1" runat="server" />
                    </ZoneTemplate>
                </asp:CatalogZone>
                <asp:EditorZone ID="EditorZone1" runat="server" BackColor="#FFFBD6" BorderColor="#CCCCCC"
                    BorderWidth="1px" Font-Names="Verdana" Padding="6">
                    <HeaderStyle BackColor="#FFCC66" Font-Bold="True" Font-Size="0.8em" ForeColor="#333333" />
                    <LabelStyle Font-Size="0.8em" ForeColor="#333333" />
                    <HeaderVerbStyle Font-Bold="False" Font-Size="0.8em" Font-Underline="False" ForeColor="#333333" />
                    <PartChromeStyle BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" />
                    <PartStyle BorderColor="#FFFBD6" BorderWidth="5px" />
                    <FooterStyle BackColor="#FFCC66" HorizontalAlign="Right" />
                    <EditUIStyle Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" />
                    <InstructionTextStyle Font-Size="0.8em" ForeColor="#333333" />
                    <ErrorStyle Font-Size="0.8em" />
                    <VerbStyle Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" />
                    <EmptyZoneTextStyle Font-Size="0.8em" ForeColor="#333333" />
                    <PartTitleStyle Font-Bold="True" Font-Size="0.8em" ForeColor="#333333" />
                </asp:EditorZone>
            </td>
        </tr>
    </table>

</asp:Content>
