<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cornerTest.aspx.cs" Inherits="Test_cornerTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="sm" runat="server">
    <Scripts>
		<asp:ScriptReference Path="~/Scripts/jquery.corner.js" />
    </Scripts>
    </asp:ScriptManager>  		
    
        <DotNetAge:JQueryPlugin ID="JQueryPlugin1" runat="server" Name="corner">
        <Target Selector="vbvb"></Target>
    </DotNetAge:JQueryPlugin>
    <div>
    
    <div class="a2" style="width:25px;height:80px;margin-top:35px;margin-left:8px;border:solid 1px red;">
		<div class="a1" id="rd" style="border:solid 1px red;padding:2px;float:left;width:204px;">
			<%--<input id="Text1" type="text" style="width:200px;border:medium none;" />--%>
			<input id="Text1" type="text" style="width:200px;" />
		</div>
		<div id="Div1" style="border:solid 1px red;padding:2px;float:left;width:204px;">		
			<select id="Select2" style="width:200px;">
				<option>1</option>
				<option>2</option>
			</select>
		</div>
    </div>
    
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$("div").corner("5px");
	});
</script>
