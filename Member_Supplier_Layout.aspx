<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Supplier_Layout.aspx.cs"
	Inherits="Member_Supplier_Layout" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register Assembly="AnthemExtensions" Namespace="AnthemExtensions" TagPrefix="anthemext" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">
<style type="text/css">
    .divItem{width:128px;float:right;direction:rtl;}
    .btnBase{border-style: none; background-repeat: no-repeat; background-color: #FFFFFF; width:16px;}
	.buttonRemove{background-image: url('images/led-icons/cancel.gif');float:left;display:none;}  
	.buttonAdd{background-image: url('images/led-icons/add.png');}  
	.inputHeaderText{float:right;}	  
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>  
    
   <DotNetAge:JQueryPlugin ID="JQueryPlugin2" runat="server" Name="draggable">
        <Target TargetID="vbvb" />
        <PlugInScripts>
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.core.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.widget.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.mouse.js" />            
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.draggable.js" />
        </PlugInScripts>
    </DotNetAge:JQueryPlugin>
   <DotNetAge:JQueryPlugin ID="JQueryPlugin1" runat="server" Name="droppable">
        <Target TargetID="vbvb" />
        <PlugInScripts>
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.core.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.widget.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.mouse.js" />                        
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.droppable.js" />
        </PlugInScripts>
    </DotNetAge:JQueryPlugin>    

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
					עריכת פריסת עסק
				</h2>
				<div class="dashedline">
				</div>			
				
				<%--content here--%>
				<div>
							הוראות הפעלה:
							<br />
							רשום את שם העמדה בתוך תיבת הרשימה, לאחר מכן שמות העמדות ישתנו בהתאם.							
							משוך/גרור את אחת מהצורות לתוך המלבן משטח העבודה והיא תתווסף לתוך המלבן.							
							מקם את הצורה ע"י גרירת הצורה.
							להגדלת משטח העבודה משוך את הצורה כלפי מטה או לצד ימין והמשטח יגדל.
							להסרת עמדה לחץ על כפתור סגירה ליד הצורה שהתווספה
				</div>
				<br />
				<table border="0">
				    <tr>
						<td class="formlabel">
							<label for="ddlCategory">
								קטגוריה:</label>
						</td>
						<td class="formvalue">
							<asp:DropDownList ID="ddlCategory" runat="server">								
							</asp:DropDownList>							
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							<label for="txtPosition">
								עמדה:</label>
						</td>
						<td class="formvalue">
                            <input id="txtPosition" type="text" value="עמדה" />							
						</td>
					</tr>
                    <%--<tr>
						<td class="formlabel">
							<label for="btnAdd">
								הוסף:</label>
						</td>
						<td>
                            <input id="btnAdd" class="buttonAdd btnBase" type="button" />                            
						</td>
					</tr>--%>
					</table>
				
			   <div id="divItems">	
                    <div id="item0" runat="server"  class="divItem" >
                        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
                        <span class="inputHeaderText">עמדה</span><input type="button" class="btnBase buttonRemove" /></div>
                        <div style="height: auto;" class="ui-widget-content ui-corner-bottom">
                             <img src="images/icons-basic/circle.png" alt="" /></div>
                    </div>		
                    <div id="item1" runat="server" class="divItem">
                        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
                            <span class="inputHeaderText">עמדה</span><input type="button" class="btnBase buttonRemove" /></div>
                        <div style="height: auto;" class="ui-widget-content ui-corner-bottom">
                            <img src="images/icons-basic/squre.png" alt="" /></div>
                    </div>	 
                    <div id="Div1" runat="server" class="divItem">
                        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
                            <span class="inputHeaderText">עמדה</span><input type="button" class="btnBase buttonRemove" /></div>
                        <div style="height: auto;" class="ui-widget-content ui-corner-bottom">
                            <img src="images/icons-basic/round-rect.png" alt="" /></div>
                    </div>	                                       	   			   
			   </div>
			   <div style="clear:both"></div>	
			   <div id="divContainer" dir="ltr" style="border:solid 1px red; height:400px; clear:both; margin:0px; padding:0px; width:auto;overflow:scroll;position:relative;">
               <%--<div style='height: 400px; width: 1px; position:relative;'></div>--%>
                </div>  
				
				
				<div>
					<br />
                    <asp:Button ID="btnAddRecord" runat="server" Text="בוצע" 
                        onclick="btnAddRecord_Click" OnClientClick="CollectLayoutData();" />
                        <asp:HiddenField ID="txtLayoutdata" runat="server" />
				</div>				
				
				<%--content here end--%>
				
				
				<div id="waitTbl">
					העמוד נטען אנא המתן...<img src="images/Icons/wait18trans.gif" alt="" />
				</div>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>    
<script type="text/javascript"> 
$(document).ready(function () { 

    $('#divItems>div').each(function(i, item) {
        $(this).draggable({ helper: 'clone', cursor: "move", revert: "invalid"});
    });

   // loadProductsFromUser();
    //$(".block").draggable({ helper: 'clone' });
    // drag zone 

    $("#divContainer").droppable(
    {
        accept: "#divItems>div",
        tolerance:"fit",              
        drop: function (ev, ui) {                   
            var droppedItem = ui.draggable.clone(); 
            droppedItem.draggable(
                {
                 containment: "parent",
                 opacity: 0.65, 
                 scroll: true,
                 snap: true,      
                 cursor: "move"      
                }
            );    
            //debugger;                            
            droppedItem.css("left",ui.position.left + $(this).scrollLeft() - $(this).position().left);
            droppedItem.css("top",ui.position.top + $(this).scrollTop() - $(this).position().top);
            droppedItem.css("position","absolute");
            //droppedItem.css("left",0);
            //droppedItem.css("top",0);                
            $('.buttonRemove', droppedItem).show("fast");
            $(this).append(droppedItem);                                                     
        }
    });
    
    $('#divContainer').delegate('input:button', 'click', function() {
        $(this).parents(".divItem").remove();
    });        
    
    $("#txtPosition").bind("change", function() {          
        var txtPositionvalue = $('#txtPosition').val();
        $('#divItems .inputHeaderText').each(function(i, item) {
            $(this).text(txtPositionvalue);
        });    
    }); 

    if ($('#ctl00_C_txtLayoutdata').val() != "") {        
        FillLayoutData();        
    } 
    
    //hide message
    $("#waitTbl").fadeOut(200);

}); 
        
function CollectLayoutData() {
    //build json collect table data

    var $table = $('#divContainer');
    var sb = new Sys.StringBuilder();

    sb.appendLine('{');
    sb.appendLine('"data":[');

    var $divs = $('>div', $table);
    var rows = $divs.length;      

    $divs.each(function(i, item) {
        sb.appendLine('{');              
        
        sb.append('"left":' + ($(this).position().left + $table.scrollLeft()));   
        sb.append(',');             
        sb.append('"top":' + ($(this).position().top + $table.scrollTop()));        
        sb.append(',');             
        sb.append('"headerContent":"' + $(this).find(".inputHeaderText").text() + '"');        
        sb.append(',');             
        sb.append('"bodyContentImgSrc":"' + $(this).find(".ui-widget-content img").attr("src") + '"');        
        
        sb.appendLine('}');

        if (rows > i + 1) sb.appendLine(',');
    });
    //aspnetForms
    var o = $('#aspnetForm').serializeArray();
    var o = null;

    //close data
    sb.appendLine(']');
    //close main
    sb.appendLine('}');

    $('#ctl00_C_txtLayoutdata').val(sb.toString());

    //debugger;
    //alert(sb.toString());    
}         

function FillLayoutData() {
    var $divContainer = $('#divContainer');
    var $divItems = $('#divItems');
        
    var $itemTemplate = $(">div:eq(0)" ,$divItems);
    
    //add values
    var obj = $.parseJSON($('#ctl00_C_txtLayoutdata').val());
    var rows = obj.data.length;  
        
    for (var r = 0; r < rows; r++) {
        var droppedItem = $itemTemplate.clone();
        
        // make div clone draggble        
        droppedItem.draggable(
            {
             containment: "parent",
             opacity: 0.65, 
             scroll: true,
             snap: true,      
             cursor: "move"      
            }
        );    
                          
        droppedItem.css("left",obj.data[r].left);
        droppedItem.css("top",obj.data[r].top);
        droppedItem.css("position","absolute");
        droppedItem.find(".ui-widget-content img").attr("src",obj.data[r].bodyContentImgSrc);
        droppedItem.find(".inputHeaderText").text(obj.data[r].headerContent);
        $('.buttonRemove', droppedItem).show("fast");        
        
        $divContainer.append(droppedItem);
    }
}      
   </script>     
</asp:Content>
