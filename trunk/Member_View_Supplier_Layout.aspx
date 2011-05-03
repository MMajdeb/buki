<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Member_View_Supplier_Layout.aspx.cs"
	Inherits="Member_Supplier_Layout" Title="Modify Membership Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register Assembly="AnthemExtensions" Namespace="AnthemExtensions" TagPrefix="anthemext" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder1" runat="Server">
<style type="text/css">
    .divItem{width:64px;float:right;direction:ltr;}
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
	.itemContent{width:64px;height:64px;}
	.itemHeader{direction:rtl;}
	.itemIcons{white-space:nowrap;widows:132px;display:none;}
	#tblDialogTime{width:100%;border:solid 1px gray;border-collapse:collapse;}	
	#tblDialogTime td{border:solid 1px gray;border-collapse:collapse;white-space:nowrap;}
	.txtDialogInput{width:45px;border:none;background-color:White;}
	.txtDialogInputSelected{width:45px;border:none;background-color:#FFBF08;}
	.txtDialogTableDynamicBtn{}
	#divItems{display:none;}
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <asp:ScriptManager ID="sm" runat="server">
		<Scripts>				    
			<asp:ScriptReference Path="~/Scripts/jquery.json-2.2.min.js" />
			<asp:ScriptReference Path="~/Member_View_Supplier_Layout.js" />
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
<%--   <DotNetAge:JQueryPlugin ID="JQueryPlugin1" runat="server" Name="droppable">
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
    </DotNetAge:JQueryPlugin>  --%>     

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
					����� ���
				</h2>
				<div class="dashedline">
				</div>			
				
				<%--content here--%>
				<div>
							������ �����:
							<br />
							���� �� �� ����� ���� ���� ������, ���� ��� ���� ������ ����� �����.							
							����/���� �� ��� ������� ���� ����� ���� ������ ���� ������ ���� �����.							
							��� �� ����� �"� ����� �����.
							��� �� ���� ����� ����� ����� ������ ���� ������ �����.
							������ ���� ������ ���� �� ����� ���� ��� �� ��� ���� ������ ����.
							����� ���� ��� �� ����� �� ����� ���� �� ����� ����� ��� ����� ��������
				</div>
				<br />
				<%--<table border="0">
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
					<tr>
						<td class="formlabel">
							<label for="txtPosition">
								����:</label>
						</td>
						<td class="formvalue">
                            <input id="txtPosition" type="text" value="����" />							
						</td>
					</tr>
                    <tr>
						<td class="formlabel">
							<label for="btnAdd">
								����:</label>
						</td>
						<td>
                            <input id="btnAdd" class="buttonAdd btnBase" type="button" />                            
						</td>
					</tr>
					</table>--%>

				<div id="divItems">	
					<div runat="server" class="divItem" >												
						<div class="ui-state-active ui-corner-top itemHeader" style="padding: 5px; height: 20px;">
							<span class="inputHeaderText">����</span>
						</div>
						<div class="ui-widget-content ui-corner-bottom itemContent">
							 <img src='' class="fitBox" alt="" /></div>				
    					<div class="ui-state-active ui-corner-bottom itemIcons" style="padding: 2px; height: 20px;">
    						<table cellpadding="0" cellspacing="0">
    						<tr>
    						<td><input type="button" class="btnBase buttonAccept" /></td>
							<td><input type="text" class="txtHide" /></td>								
							<td><input type="button" class="btnBase buttonRemove" /></td>								
							<td><input type="button" class="btnBase buttonTime" /></td>	
							<td><input type="button" class="btnBase buttonEdit" /></td>						
							</tr>
							</table>
						</div>								 									 
					</div>		
			   </div>			   			   			   
			   <div style="clear:both"></div>				   	
			   <div id="divContainer" dir="ltr" style="border:solid 1px red; height:450px; clear:both; margin:0px; padding:0px; width:auto;overflow:scroll;position:relative;">
               <%--<div style='height: 400px; width: 1px; position:relative;'></div>--%>
                </div>                 				
				
				<div>				
                        <asp:HiddenField ID="txtLayoutdata" runat="server" />
				</div>								                
                
                <%--<input id="btnd" type="button" value="dialog" />--%>
				
				<%--content here end--%>
				
				
				<div id="waitTbl">
					����� ���� ��� ����...<img src="images/Icons/wait18trans.gif" alt="" />
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
