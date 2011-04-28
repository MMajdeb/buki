<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_Supplier_Layout.aspx.cs"
	Inherits="Member_Supplier_Layout" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register Assembly="AnthemExtensions" Namespace="AnthemExtensions" TagPrefix="anthemext" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">
<style type="text/css">
    .divItem{width:128px;float:right;direction:ltr;}
    .btnBase{border-style: none; background-repeat: no-repeat; background-color: #FFFFFF; width:16px;height:16px;}
	.buttonRemove{background-image: url('images/led-icons/cancel.gif');float:left;display:none;}  
	.buttonAdd{background-image: url('images/led-icons/add.png');}  
	.buttonEdit{background-image: url('images/led-icons/pencil.gif');float:left;display:none;}  
	.buttonTime{background-image: url('images/led-icons/clock.gif');float:left;display:none;}
	.inputHeaderText{float:right;color:#EB8F00;font-weight:bold;}
	.txtHide{display:none;width:60px;float:right;direction:rtl;}
	.buttonAccept{background-image: url('images/led-icons/accept.gif');float:right;display:none;}  	
	.fitBox{width:100%;height:100%}	
	.ui-resizable-helper { border: 2px dotted #00F; }
	.itemContent{}
	.itemHeader{direction:rtl;}
	.itemIcons{white-space:nowrap;widows:132px;display:none;}
	#tblDialogTime{width:100%;border:solid 1px gray;border-collapse:collapse;}	
	#tblDialogTime td{border:solid 1px gray;border-collapse:collapse;white-space:nowrap;}
	.txtDialogInput{width:45px;border:none;background-color:White;}
	.txtDialogInputSelected{width:45px;border:none;background-color:#FFBF08;}
	.txtDialogTableDynamicBtn{}
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <asp:ScriptManager ID="sm" runat="server">
		<Scripts>		
		    <asp:ScriptReference Path="~/Scripts/jquery.json-2.2.min.js" />
		    <asp:ScriptReference Path="~/Scripts/jquery.maskedinput-1.3.min.js" />
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
   <DotNetAge:JQueryPlugin ID="JQueryPlugin3" runat="server" Name="resizable">
        <Target TargetID="vbvb" />
        <PlugInScripts>
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.core.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.widget.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.mouse.js" />                        
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.resizable.js" />
        </PlugInScripts>
    </DotNetAge:JQueryPlugin> 
       
   <DotNetAge:JQueryPlugin ID="JQueryPlugin4" runat="server" Name="dialog">
        <Target TargetID="vbvb" />
        <PlugInScripts>
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.core.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.position.js" />            
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.widget.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.mouse.js" />                        
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.dialog.js" />
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
							שנה את גודל הצורה בעזרת גרירת המשולש הקטן בתחתית הצורה.
							להגדלת משטח העבודה משוך את הצורה כלפי מטה או לצד ימין והמשטח יגדל.
							להסרת עמדה עלה עם העכבר על הצורה ולחץ על כפתור סגירה ליד הצורה שהתווספה
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
			   <asp:Repeater runat="server" ID="rptItems">
					<ItemTemplate>
						<div runat="server" class="divItem" >												
							<div class="ui-state-active ui-corner-top itemHeader" style="padding: 5px; height: 20px;">
								<span class="inputHeaderText">עמדה</span>
							</div>
							<div style="height:auto;" class="ui-widget-content ui-corner-bottom itemContent">
								 <img src='<%# Eval("Image") %>' class="fitBox" alt="" /></div>				
            				<div class="ui-state-active ui-corner-bottom itemIcons" style="padding: 2px; height: 20px;">
								<input type="text" class="txtHide" />
								<input type="button" class="btnBase buttonAccept" />
								<input type="button" class="btnBase buttonRemove" />								
								<input type="button" class="btnBase buttonTime" />	
								<input type="button" class="btnBase buttonEdit" />						
							</div>								 									 
						</div>		
                    </ItemTemplate>
                </asp:Repeater>
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
				
                <div id="dialog-modal" title="עריכת זמנים של עמדה">
	                <p>לחץ על כפתור '+' כדי להוסיף שורות.
	                הוסף זמנים לדוגמא משעה 07:00 עד 17:00</p>	                
	                <table id="tblDialogTime">
	                    <tr>	 
	                    <td></td>                   
	                    <td colspan="2">א</td>
	                    <td colspan="2">ב</td>
	                    <td colspan="2">ג</td>
	                    <td colspan="2">ד</td>
	                    <td colspan="2">ה</td>
	                    <td colspan="2">ו</td>
	                    <td colspan="2">ש</td>
	                    </tr>
	                    <tr>	     
	                    <td><input type="button" value="-" class="txtDialogTableDynamicBtn" style="display:none;" /></td>               
	                    <td>משעה</td>
	                    <td>עד שעה</td>
	                    <td>משעה</td>
	                    <td>עד שעה</td>
	                    <td>משעה</td>
	                    <td>עד שעה</td>
	                    <td>משעה</td>
	                    <td>עד שעה</td>
	                    <td>משעה</td>
	                    <td>עד שעה</td>
	                    <td>משעה</td>
	                    <td>עד שעה</td>
	                    <td>משעה</td>
	                    <td>עד שעה</td>	                    
	                    </tr>	                    
	                </table>
                    <input id="btnDialogAddRow" type="button" value="+" />
                </div>
                
                <%--<input id="btnd" type="button" value="dialog" />--%>
				
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
