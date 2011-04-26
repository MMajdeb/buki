<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Supplier_Layout.aspx.cs"
	Inherits="Member_Supplier_Layout" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register Assembly="AnthemExtensions" Namespace="AnthemExtensions" TagPrefix="anthemext" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">
<style type="text/css">
    .divItem{width:128px;float:right;direction:rtl;}
    .btnBase{border-style: none; background-repeat: no-repeat; background-color: #FFFFFF; width:16px;height:16px;}
	.buttonRemove{background-image: url('images/led-icons/cancel.gif');float:left;display:none;}  
	.buttonAdd{background-image: url('images/led-icons/add.png');}  
	.buttonEdit{background-image: url('images/led-icons/pencil.gif');float:left;display:none;}  
	.inputHeaderText{float:right;}
	.txtHide{display:none;width:60px;}
	.buttonAccept{background-image: url('images/led-icons/accept.gif');float:none;display:none;}  	
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <asp:ScriptManager ID="sm" runat="server">
		<Scripts>
			<asp:ScriptReference Path="~/Member_Supplier_Layout.js" />
		</Scripts>
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
                        <span class="inputHeaderText">עמדה</span><input type="text" class="txtHide" /><input type="button" class="btnBase buttonAccept" /><input type="button" class="btnBase buttonRemove" /><input type="button" class="btnBase buttonEdit" /></div>
                        <div style="height: auto;" class="ui-widget-content ui-corner-bottom">
                             <img src="images/icons-basic/circle.png" alt="" /></div>
                    </div>		
                    <div id="item1" runat="server" class="divItem">
                        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
                            <span class="inputHeaderText">עמדה</span><input type="text" class="txtHide" /><input type="button" class="btnBase buttonAccept" /><input type="button" class="btnBase buttonRemove" /><input type="button" class="btnBase buttonEdit" /></div>
                        <div style="height: auto;" class="ui-widget-content ui-corner-bottom">
                            <img src="images/icons-basic/squre.png" alt="" /></div>
                    </div>	 
                    <div id="item2" runat="server" class="divItem">
                        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
                            <span class="inputHeaderText">עמדה</span><input type="text" class="txtHide" /><input type="button" class="btnBase buttonAccept" /><input type="button" class="btnBase buttonRemove" /><input type="button" class="btnBase buttonEdit" /></div>
                        <div style="height: auto;" class="ui-widget-content ui-corner-bottom">
                            <img src="images/icons-basic/round-rect.png" alt="" /></div>
                    </div>	                                       	   			   
			   </div>			   
			   <div style="clear:both"></div>	
			   <asp:Panel ID="pnlZoom" runat="server">			
			   <div id="divContainer" dir="ltr" style="border:solid 1px red; height:400px; clear:both; margin:0px; padding:0px; width:auto;overflow:scroll;position:relative;">
               <%--<div style='height: 400px; width: 1px; position:relative;'></div>--%>
                </div>  
                </asp:Panel>
				
				
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
	LoadPage();		
}); 
</script>     
</asp:Content>
