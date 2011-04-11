<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Supplier_Infrastructure.aspx.cs"
	Inherits="Member_Supplier_Infrastructure" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">

	<script type="text/javascript">
		function createDynamicTable(tbody, rows, cols) {
			if (tbody == null || tbody.length < 1) return;
			tbody.find("tr").remove();
			for (var r = 1; r <= rows; r++) {
				var trow = $("<tr>");
				for (var c = 1; c <= cols; c++) {
					var cellText = "Cell " + r + "." + c
					$("<td>")
                    .addClass("tableCell")
                    .text(cellText)
                    .data("col", c)
                    .appendTo(trow);
				}
				trow.appendTo(tbody);
			}
		}

		$(document).ready(function() {
			//createDynamicTable($("#tbl"), 10, 5);
			$("#tbl td.tableCell")
            .click(function() {
            	alert("Clicked Col=" + $(this).data("col"));
            });

			$('.target').change(function() {
				$('#trTable').fadeIn(200);
				createDynamicTable($("#tbl"), $("#ctl00_ContentPlaceHolder1_tbRows").val(), $("#ctl00_ContentPlaceHolder1_tbCols").val());
			});

			$('#ctl00_ContentPlaceHolder1_ddlCategory').change(function() {
				$('#trRows,#trCols').fadeIn(200);
			});

		});
	</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1"
		CombineScripts="true" />
	<div id="body">
		<!--Start of left column-->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
			</div>
		</div>
		<!--end columnleft-->
		<!--Start of right column-->
		<div id="columnright">
			<div class="rightblock">
				<h2>
					עריכת פריסת עסק
				</h2>
				<div class="dashedline">
				</div>
				<table border="0">
					<tr>
						<td class="formlabel">
							<label for="ddlCategory">
								קטגוריה:</label>
								׳׳”׳’׳›׳’
						</td>						
						<td class="formvalue">
							<asp:DropDownList ID="ddlCategory" runat="server">
								<asp:ListItem Text=""></asp:ListItem>
								<asp:ListItem Text="מסעדה"></asp:ListItem>
								<asp:ListItem Text="ספר"></asp:ListItem>
								<asp:ListItem Text="מוסך"></asp:ListItem>
							</asp:DropDownList>
						</td>
					</tr>
					<tr id="trCols" style="display: none;">
						<td class="formlabel">
							<label for="tbCol">
								מספר עמודות:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox ID="tbCols" runat="server" class="target" Text="0" Width="60" Style="text-align: center" />
							<asp:ImageButton ID="img1" runat="server" ImageUrl="~/images/updown/down.gif" AlternateText="Down"
								Width="12" Height="7" />
							<asp:ImageButton ID="img2" runat="server" ImageUrl="~/images/updown/up.gif" AlternateText="Up"
								Width="12" Height="7" />
							<ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="tbCols"
								Width="80" TargetButtonDownID="img1" TargetButtonUpID="img2" RefValues="" ServiceDownMethod=""
								Minimum="0" Maximum="100" ServiceUpMethod="" />
						</td>
					</tr>
					<tr id="trRows" style="display: none;">
						<td class="formlabel">
							<label for="tbCol">
								מספר שורות:</label>
						</td>
						<td class="formvalue">
							<asp:TextBox ID="tbRows" runat="server" class="target" Text="0" Width="60" Style="text-align: center" />
							<asp:ImageButton ID="img3" runat="server" ImageUrl="~/images/updown/down.gif" AlternateText="Down"
								Width="12" Height="7" />
							<asp:ImageButton ID="img4" runat="server" ImageUrl="~/images/updown/up.gif" AlternateText="Up"
								Width="12" Height="7" />
							<ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender2" runat="server" TargetControlID="tbRows"
								Width="80" TargetButtonDownID="img3" TargetButtonUpID="img4" RefValues="" ServiceDownMethod=""
								Minimum="0" Maximum="100" ServiceUpMethod="" />
						</td>
					</tr>
					<tr id="trTable" style="display: none;">
						<td class="formlabel">
							<label for="tbCol">
								טבלה:</label>
						</td>
						<td class="formvalue">
							<table id="tbl" class="tblDynmic" border="1">
								<tbody>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
