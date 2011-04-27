/// <reference path="Scripts/jquery-1.5.2-vsdoc.js"/>
function LoadPage() {           
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
            
            droppedItem.find(".itemContent").resizable({
                grid: 5,
                helper: "ui-resizable-helper",
                stop: function(event, ui) {
                    
                }
            });  
            //debugger;                            
            droppedItem.css("left",ui.position.left + $(this).scrollLeft() - $(this).position().left);
            droppedItem.css("top",ui.position.top + $(this).scrollTop() - $(this).position().top);
            droppedItem.css("position","absolute");
            droppedItem.find(".itemContent").css("background","none repeat scroll 0 0 transparent");            
            droppedItem.find('.itemHeader').removeClass("ui-state-active"); 
            droppedItem.find('.itemIcons').removeClass("ui-state-active");             
            //droppedItem.find('.itemHeader').css("border-style","none");             
            //droppedItem.css("left",0);
            //droppedItem.css("top",0);                
            //$('.buttonRemove', droppedItem).show("fast");
            //$('.buttonEdit', droppedItem).show("fast");
            $(this).append(droppedItem);                                                     
        }
    });        
    
    $('#divContainer').delegate('input:button.buttonRemove', 'click', function() {
        $(this).parents(".divItem").remove();
    });        

    $('#divContainer').delegate('input:button.buttonEdit', 'click', function() {
        var $inputHeaderText = $(this).parents(".divItem").find(".inputHeaderText");        
        var inputHeaderTextValue = $inputHeaderText.text();        
        //$inputHeaderText.hide();
        
        var $txtHide = $(this).parent().find(".txtHide");
        $txtHide.show();
        $txtHide.val(inputHeaderTextValue);
        $(this).parent().find(".buttonAccept").show();        
    });        

    $('#divContainer').delegate('input:button.buttonAccept', 'click', function() {        
        var $txtHide = $(this).parent().find(".txtHide");
        $txtHide.hide();
        var txtHideVal = $txtHide.val();
        
        $(this).parent().find(".buttonAccept").hide();        
        
        var $inputHeaderText = $(this).parents(".divItem").find(".inputHeaderText");        
        $inputHeaderText.text(txtHideVal);        
        //$inputHeaderText.show();        
    });   
        
    // icons hide show on move    
    $('#divContainer').delegate('.divItem', 'mouseenter', function() {                
        $(this).find('.buttonRemove').show();
        $(this).find('.buttonEdit').show();                
        $(this).find('.buttonTime').show();
        $(this).find('.itemHeader').addClass("ui-state-active"); 
        $(this).find('.itemIcons').addClass("ui-state-active").show(); 
    });    

    $('#divContainer').delegate('.divItem', 'mouseleave', function() {                
        $(this).find('.buttonRemove').hide();
        $(this).find('.buttonEdit').hide();
        $(this).find('.buttonTime').hide();                        
        $(this).find('.itemHeader').removeClass("ui-state-active");       
        $(this).find('.itemIcons').removeClass("ui-state-active").hide(); 
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
}

function CollectLayoutData() {
    //build json collect table data

    var $table = $('#divContainer');
    var sb = new Sys.StringBuilder();

    sb.appendLine('{');
    sb.appendLine('"data":[');

    var $divs = $('>div', $table);
    var rows = $divs.length;      

    $divs.each(function(i, item) {
        //debugger
        sb.appendLine('{');                      
        sb.append('"left":' + ($(this).position().left + $table.scrollLeft()));   
        sb.append(',');             
        sb.append('"top":' + ($(this).position().top + $table.scrollTop()));        
        sb.append(',');             
        sb.append('"width":' + $(this).find(".itemContent").width());                
        sb.append(',');             
        sb.append('"height":' + $(this).find(".itemContent").height());
        sb.append(',');             
        sb.append('"headerContent":"' + $(this).find(".inputHeaderText").text() + '"');        
        sb.append(',');             
        sb.append('"bodyContentImgSrc":"' + $(this).find(".itemContent img").attr("src") + '"');        
        
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
        
        droppedItem.find(".itemContent").resizable({
            grid: 5,
            helper: "ui-resizable-helper",
            stop: function(event, ui) {
                $(this).parent().find('.itemHeader').css("width",ui.size.width - 10);                
            }
        });          
               
        droppedItem.css("left",obj.data[r].left);
        droppedItem.css("top",obj.data[r].top);
        droppedItem.css("position","absolute");
        if(obj.data[r].width != null)
        {
            droppedItem.find(".itemContent").width(obj.data[r].width);
            droppedItem.find('.itemHeader').width(obj.data[r].width - 10);               
        }    
        if(obj.data[r].height != null)
            droppedItem.find(".itemContent").height(obj.data[r].height);
        droppedItem.find(".itemContent img").attr("src",obj.data[r].bodyContentImgSrc);
        droppedItem.find(".inputHeaderText").text(obj.data[r].headerContent);        
        droppedItem.find(".itemContent").css("background","none repeat scroll 0 0 transparent");
        droppedItem.find('.itemHeader').removeClass("ui-state-active"); 
        droppedItem.find('.itemIcons').removeClass("ui-state-active"); 
        //$('.buttonEdit', droppedItem).show("fast");
        //$('.buttonRemove', droppedItem).show("fast");        
        
        $divContainer.append(droppedItem);
    }
}      
