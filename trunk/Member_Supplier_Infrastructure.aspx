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
</style>

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
					var cellText = "Cell " + r + "." + c;
					var btnClone = $('#cellDynamicTemplate .buttonAddContainer').clone();
					
					$("<td>")
					.addClass("tableCell")
					.text(cellText)
					.data("col", c)
					.append(btnClone)					
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
					var cellText = "Cell " + r + "." + c;
					var btnClone = $('#cellDynamicTemplate .buttonAddContainer').clone();
					
					$("<td>")
					.addClass("tableCell")
					.text(cellText)
					.data("col", c)
					.append(btnClone)
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
			createDynamicTable($("#tbl"), $("#ctl00_ContentPlaceHolder1_tbRows").val(), $("#ctl00_ContentPlaceHolder1_tbCols").val());
		});

		$('#ctl00_ContentPlaceHolder1_ddlCategory').one('change', function() {
			$('#trRows,#trCols').fadeIn(200);
		});
		
		//functions to control events when adding and removing
		$("#tbl").delegate('.buttonAdd','click', function () {				
				var template = $('#cellDynamicTemplate');
				var containerAdd = $('.containerAdd:eq(0)', template);
                var containerAddClone = containerAdd.clone();                                
                //phonesDiv.append('<div style="clear:both;" />')                
                $(this).parent().parent().append(containerAddClone);             
                containerAddClone.show();			
		});
		        
        $("#tbl").delegate('.removeAdd','click', function (e) {
			$(this).parents('.containerAdd').remove();
        });
        
        $("#tbl").delegate('.acceptAdd','click', function (e) {
			$(this).parents('.containerAdd').find('.textNormal').addClass('textAccept');
			$(this).hide();
        });   
        
        $('#Button1').click(function (e) {
			//build json
			var $table = $('#tbl');
			$('tr', $table).each(function(i, item){			
				//for each tr
				$('td',$(this)).each(function(i,item){				
				});
			});
			//aspnetForms
			var  o = $('#aspnetForm').serializeArray();
			var o = null;
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
	
	<input id="Button1" type="button" value="button" />
	
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
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
