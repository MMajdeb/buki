<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Supplier_Infrastructure.aspx.cs"
	Inherits="Member_Supplier_Infrastructure" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register Assembly="AnthemExtensions" Namespace="AnthemExtensions" TagPrefix="anthemext" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">

<style type="text/css">
	.textNormal{}
	.textAccept{ background-color:Lime; border-style:none;}
	.tableCell{width:125px; min-width:125px;}
	.tblScroll{overflow-x:scroll; width:600px;}
</style>
<script src="Scripts/Pages/Member_Supplier_Infrastructure.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        LoadPage();         
    });       
</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1"
		CombineScripts="true">
		<Scripts>
			<%--<asp:ScriptReference Path="~/Scripts/AnthemGlobalProgress.js" />--%>
		</Scripts>
	</ajaxToolkit:ToolkitScriptManager>		
	
	<div id="cellDynamicTemplate" style="display:none;">
		<div class="buttonAddContainer">
			<input type="button" class="buttonAdd" value="+" />
		</div>
		<div class="containerAdd" style="display:none;">
			<div class="textAdd">
				<input type="text" class="textNormal" maxlength="15" value="����" />
			</div>
			<div>
				<input type="button" class="acceptAdd" value="V" />
				<input type="button" class="removeAdd" value="X" />
			</div>
		</div>
	</div>	
	
	<div id="body">
		<!--Start of left column-->
<%--		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
			</div>
		</div>--%>
		<!--end columnleft-->
		<!--Start of right column-->
		<div id="fullwidth">
			<div class="fullwidth">
				<h2>
					����� ����� ���
				</h2>
				<div class="dashedline">
				</div>			
				
				<table border="0">
					<tr>
						<td class="formlabel">
							<label for="ddlCategory">
								�������:</label>
						</td>
						<td class="formvalue">
							<asp:DropDownList ID="ddlCategory" runat="server">								
							</asp:DropDownList>							
						</td>
					</tr>
					<tr id="trCols" style="display: none;">
						<td class="formlabel">
							<label for="tbCol">
								���� ������:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox ID="tbCols" runat="server" Text="0" Width="60" Style="text-align: center" />
							<asp:ImageButton ID="img1" runat="server" class="target" ImageUrl="~/images/updown/down.gif"
								AlternateText="Down" Width="12" Height="7" />
							<asp:ImageButton ID="img2" runat="server" class="target" ImageUrl="~/images/updown/up.gif"
								AlternateText="Up" Width="12" Height="7" />
							<ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="tbCols"
								Width="80" TargetButtonDownID="img1" TargetButtonUpID="img2" RefValues="" ServiceDownMethod=""
								Minimum="0" Maximum="100" ServiceUpMethod="" />
						</td>
					</tr>
					<tr id="trRows" style="display: none;">
						<td class="formlabel">
							<label for="tbCol">
								���� �����:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox ID="tbRows" runat="server" Text="0" Width="60" Style="text-align: center" />
							<asp:ImageButton ID="img3" runat="server" class="target" ImageUrl="~/images/updown/down.gif"
								AlternateText="Down" Width="12" Height="7" />
							<asp:ImageButton ID="img4" runat="server" class="target" ImageUrl="~/images/updown/up.gif"
								AlternateText="Up" Width="12" Height="7" />
							<ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender2" runat="server" TargetControlID="tbRows"
								Width="80" TargetButtonDownID="img3" TargetButtonUpID="img4" RefValues="" ServiceDownMethod=""
								Minimum="0" Maximum="100" ServiceUpMethod="" />
						</td>
					</tr>
					<tr id="trTable" style="display: none;">
						<td class="formlabel">
							<label for="tbCol">
								����:</label>
						</td>
						<td class="formvalue">
						    <div class="tblScroll">
							<table id="tbl" class="tblDynmic" border="1">
								<tbody>
								</tbody>
							</table>							
							</div>
							<div>
                                <asp:Button ID="btnAddRecord" runat="server" Text="����" 
                                    onclick="btnAddRecord_Click" OnClientClick="CollectLayoutData();" />
                                    <asp:HiddenField ID="txtLayoutdata" runat="server" />
							</div>							
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>    
</asp:Content>
