/// <reference path="Scripts/jquery-1.5.2-vsdoc.js"/>
function LoadPage() {                       

    if ($('#ctl00_C_txtLayoutdata').val() != "") {        
        FillLayoutData();        
    } 
    
    //hide message
    $("#waitTbl").fadeOut(200);
}

function FillLayoutData() {
    var $divContainer = $('#divContainer');
    var $divItems = $('#divItems');
        
    var $itemTemplate = $(">div:eq(0)" ,$divItems);    
    //add values parse main conternt
    var obj = $.parseJSON($('#ctl00_C_txtLayoutdata').val());
    var rows = obj.data.length;  
        
    for (var r = 0; r < rows; r++) {
        var droppedItem = $itemTemplate.clone();                              
               
        droppedItem.css("left",obj.data[r].left);
        droppedItem.css("top",obj.data[r].top);
        droppedItem.css("position","absolute");
        //debugger
        droppedItem.data("time",$.toJSON(obj.data[r].time));
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
