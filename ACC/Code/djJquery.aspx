<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<% if (false){ %> <script src="../../Scripts/jquery-1.5.2-vsdoc.js" type="text/javascript"></script> <% } %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>  
    
</head>
<body>
    <form id="form1" runat="server"> 
    
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>   
           
   <DotNetAge:JQueryPlugin ID="JQueryPlugin2" runat="server" Name="draggable">
        <Target TargetID="SimpleListView1 a" />
        <PlugInScripts>
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.core.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.widget.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.mouse.js" />            
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.draggable.js" />
        </PlugInScripts>
    </DotNetAge:JQueryPlugin>
   <DotNetAge:JQueryPlugin ID="JQueryPlugin1" runat="server" Name="Droppable">
        <Target TargetID="SimpleListView1 a" />
        <PlugInScripts>
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.core.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.widget.js" />
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.mouse.js" />                        
            <asp:ScriptReference Assembly="jQuery" Name="jQuery.ui.droppable.js" />
        </PlugInScripts>
    </DotNetAge:JQueryPlugin>
    
   <div id="aa" style="border:solid 1px red; height:400px; clear:both; margin:0px; padding:0px; width:auto;overflow:scroll;position:relative;">
   <%--<div style='height: 400px; width: 1px; position:relative;'></div>--%>
   </div>    
    
    <div id="zzz">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">                     
    <ItemTemplate>
        <asp:Panel ID="Panel2" runat="server" Width="100px">
        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
            עמדה</div>
        <div style="padding: 10px; height: auto;" class="ui-widget-content ui-corner-bottom">
            <%# Eval("CategoryName")%> I am the Panel Control enabled Draggable</div>
    </asp:Panel>
    
    <script type="text/javascript">
	$(function() {
		$( '#<%# Container.FindControl("Panel2").ClientID %>' ).draggable({ helper: 'clone', cursor: "move", revert: "invalid"});
	});
	</script>
   
   
    </ItemTemplate>
    </asp:Repeater>    
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"                 
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description], [Picture] FROM [Categories]"></asp:SqlDataSource>    
    </form>
</body>
</html>

<script type="text/javascript">
   function ggg( ev, ui)
   {
   alert(10);
   }
   
   $(document).ready(function () {
       // loadProductsFromUser();
        //$(".block").draggable({ helper: 'clone' });
        // drag zone 

        $("#aa").droppable(
        {
            accept: "#zzz div",
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
                droppedItem.css("left",ui.position.left + $(this).scrollLeft());
                droppedItem.css("top",ui.position.top + $(this).scrollTop());
                droppedItem.css("position","absolute");
                //droppedItem.css("left",0);
                //droppedItem.css("top",0);                
                $(this).append(droppedItem);                    
                
            }
        });

        });   
   </script>   
