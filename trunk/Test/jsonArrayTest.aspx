<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
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
    <div>
    
    </div>
    </form>
</body>
</html>

    <script type="text/javascript">
        debugger;
        var d = '{ "data":[ { "left":730,"top":88,"width":126,"height":126,"headerContent":"âÞÓÔ","bodyContentImgSrc":"images/icons-basic/circle.png","time":"undefined"} }]}';
        d = $.parseJSON(d);
        var tt
    </script>
