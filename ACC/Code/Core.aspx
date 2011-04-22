<%@ Page Title="Core Features of Draggable" Language="C#" MasterPageFile="~/Demo.master"
    Inherits="DemoPage" %>
<%@ Register Src="~/CodeFormatter.ascx" TagName="Code" TagPrefix="demo" %>

<script runat="server">

    private System.Collections.Generic.List<string> ttt = new System.Collections.Generic.List<string>();
    
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        Draggable1.Target.TargetIDs = ttt.ToArray();
    }
    
    protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        //if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.SelectedItem)
        //{
        //    DNA.UI.JQuery.Draggable.ApplyTo(e.Item.FindControl("Panel2"));            
        //}
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.SelectedItem)
        {

            JQuerySelector j = new JQuerySelector();
            j.Selector = e.Item.FindControl("Panel2").ClientID;
            //DNA.UI.JQuery.Draggable.ApplyTo(Page, j);

            Page.ClientScript.RegisterArrayDeclaration("ttt","'" + e.Item.FindControl("Panel2").ClientID + "'");
            //ttt.Add(e.Item.FindControl("Panel2").ClientID);

            //Draggable1.Target.Selector = "'#" + e.Item.FindControl("Panel2").ClientID + "'";
                                 
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void Repeater1_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="DemoHolder" runat="Server">
   <style>
   .custom-state-active{background-color:Red;}
   .aas{background-color:green;}
   </style>
   <script>
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
                     cursor: "move"      
                    }
                );                
                //debugger
                droppedItem.css("left",ui.position.left);
                droppedItem.css("top",ui.position.top);
                droppedItem.css("position","absolute");
                $(this).append(droppedItem);                
                
            }
        });

        });   
   </script>
   
   <div id="aa" style="border:solid 1px red; height:400px; clear:both; margin:0px; padding:0px;">

   </div>
   
   <DotNetAge:Droppable ID="GalleryViewDroppable" runat="server" ActiveCssClass="custom-state-active" HoverCssClass="aas" OnClientDrop="ggg" Tolerance="Touch"
       >

<Accept Selector=""></Accept>

        <Target Selector="#aa1" />
       
    </DotNetAge:Droppable> 

    <div class="dna-state-help ui-corner-all" style="margin-bottom: 10px;">
       Click Tabs to swap between content that is broken into logical section Views.
    </div>
    <asp:Panel ID="Panel1" runat="server" Height="200px" Width="200px">
        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
            Drag me around</div>
        <div style="padding: 10px; height: auto;" class="ui-widget-content ui-corner-bottom">
            I am the Panel Control enabled Draggable</div>
    </asp:Panel>
    <div id="divElement" style="height: 200px; width: 200px; position: absolute; float: left;
        left: 230px; top: 170px;">
        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
            Drag me around</div>
        <div style="padding: 10px;" class="ui-widget-content ui-corner-bottom">
            I am the Div Html Element enabled Draggable</div>
    </div>
    <DotNetAge:Draggable ID="Draggable1" runat="server">
        <Target TargetIDs="Panel1,divElement" />
    </DotNetAge:Draggable>
    <br />


    <div id="zzz">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" 
        onitemcreated="Repeater1_ItemCreated" 
        onitemdatabound="Repeater1_ItemDataBound" 
        onitemcommand="Repeater1_ItemCommand" onload="Repeater1_Load">
    <ItemTemplate>
        <asp:Panel ID="Panel2" runat="server" Width="200px">
        <div class="ui-state-active ui-corner-top" style="padding: 5px; height: 20px;">
            Drag me around</div>
        <div style="padding: 10px; height: auto;" class="ui-widget-content ui-corner-bottom">
            <%# Eval("CategoryName")%> I am the Panel Control enabled Draggable</div>
    </asp:Panel>
    
    <script>
	$(function() {
		$( '#<%# Container.FindControl("Panel2").ClientID %>' ).draggable({ helper: 'clone', cursor: "move"});
	});
	</script>
   
   
    </ItemTemplate>
    </asp:Repeater>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description], [Picture] FROM [Categories]"></asp:SqlDataSource>
    
    <demo:Code runat="server" ID="codeView" SourceFile="~/Draggable/Codes/Core.aspx" />
</asp:Content>
