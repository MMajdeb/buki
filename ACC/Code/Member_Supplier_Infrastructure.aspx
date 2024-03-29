<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Supplier_Infrastructure.aspx.cs"
	Inherits="Member_Supplier_Infrastructure" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register Assembly="AnthemExtensions" Namespace="AnthemExtensions" TagPrefix="anthemext" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">

<script type="text/javascript">
	function createDynamicTable(tbody, rows, cols) {
		if (tbody == null || tbody.length < 1) return;
		//tbody.find("tr").remove();

		var lRows = tbody.find("tr").length;
		var lCols = tbody.find("tr:first td").length;

		// add cols
		if (cols > lCols) {
			for (var r = 0; r < rows; r++) {
				var lRow = tbody.find("tr:eq(" + r + ")");
				for (var c = lCols; c < cols; c++) {
					var cellText = "Cell " + r + "." + c
					$("<td>")
					.addClass("tableCell")
					.text(cellText)
					.data("col", c)
					.appendTo(lRow);
				}
			}
		}

		//remove cols
		if (cols < lCols) {
			for (var r = 0; r < rows; r++) {
				for (var c = lCols; c > cols; c--) {
					tbody.find("tr:eq(" + r + ") td:last").remove();
				}
			}
		}

		// add rows
		if (rows > lRows) {
			for (var r = lRows; r < rows; r++) {
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
		// remove rows
		if (rows < lRows) {
			for (var r = lRows; r > rows; r--) {
				tbody.find("tr:last").remove();
			}
		}

	}

	$(document).ready(function() {
		//createDynamicTable($("#tbl"), 10, 5);
		$("#tbl td.tableCell")
        .click(function() {
        	alert("Clicked Col=" + $(this).data("col"));
        });

		$('.target').one('click', function() {
			$('#trTable').fadeIn(200);
		});

		$('.target').bind('click', function() {
			createDynamicTable($("#tbl"), $("#ctl00_C_tbRows").val(), $("#ctl00_C_tbCols").val());
		});

		$('#ctl00_C_ddlCategory').one('change', function() {
			$('#trRows,#trCols').fadeIn(200);
		});

	});
</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1"
		CombineScripts="true">
		<Scripts>
			<asp:ScriptReference Path="~/Scripts/AnthemGlobalProgress.js" />
		</Scripts>
	</ajaxToolkit:ToolkitScriptManager>
	<div id="body">
		<!--Start of left column-->
<%--		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
			</div>
		</div>--%>
		<!--end columnleft-->
		<!--Start of right column-->
		<div id="columnright">
			<div class="rightblock">
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
								<asp:ListItem Text=""></asp:ListItem>
								<asp:ListItem Text="�����"></asp:ListItem>
								<asp:ListItem Text="���"></asp:ListItem>
								<asp:ListItem Text="����"></asp:ListItem>
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
							<table id="tbl" class="tblDynmic" border="1">
								<tbody>
								</tbody>
							</table>
							<asp:Button runat="server" ID="btn1" />
							<asp:UpdatePanel ID="UpdatePanel1" runat="server">
								<ContentTemplate>
									<asp:GridView runat="server" ID="gv1" BorderStyle="None" BorderWidth="1px" ondatabinding="gv1_DataBinding" 
										onrowdatabound="gv1_RowDataBound" BackColor="White" BorderColor="#3366CC" CellPadding="4">
										<RowStyle BackColor="White" ForeColor="#003399" />
									<Columns>
										<asp:TemplateField>
											<ItemTemplate>
												<asp:Panel runat="server" ID="p1"></asp:Panel>
											</ItemTemplate>
										</asp:TemplateField>
									</Columns>										
										<FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
										<PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
										<SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
										<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
									</asp:GridView>
								</ContentTemplate>
								<Triggers>
									<asp:AsyncPostBackTrigger ControlID="btn1" EventName="Click" />
								</Triggers>
							</asp:UpdatePanel>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
