/// <reference path="../jquery-1.5.2.js"/>
function LoadPage() {           
            //createDynamicTable($("#tbl"), 10, 5);
    $("#tbl td.tableCell")
        .click(function() {
            alert("Clicked Col=" + $(this).data("col"));
        });

    $('.target').one('click', function() {
        $('#trTable').fadeIn(200);
    });

    $('.target').bind('click', function() {  
        //alert($("#ctl00_C_tbRows").val() + " " + $("#ctl00_C_tbCols").val());        
        //createDynamicTable($("#tbl"), $("#ctl00_C_tbRows").val(), $("#ctl00_C_tbCols").val());        
        if($.browser.msie)
        {
            $("#ctl00_C_tbCols,#ctl00_C_tbRows").trigger("change");
        }       
    });
        
    $("#ctl00_C_tbCols,#ctl00_C_tbRows").bind("change", function() {  
        //alert($("#ctl00_C_tbRows").val() + " " + $("#ctl00_C_tbCols").val());        
        createDynamicTable($("#tbl"), $("#ctl00_C_tbRows").val(), $("#ctl00_C_tbCols").val());
    });
    

    $('#ctl00_C_ddlCategory').one('change', function() {
        $('#trRows,#trCols').fadeIn(200);
    });

    //functions to control events when adding and removing
    $("#tbl").delegate('.buttonAdd', 'click', function() {
        var template = $('#cellDynamicTemplate');
        var containerAdd = $('.containerAdd:eq(0)', template);
        var containerAddClone = containerAdd.clone();
        //phonesDiv.append('<div style="clear:both;" />')                
        $(this).parent().parent().append(containerAddClone);
        containerAddClone.show();
    });

    $("#tbl").delegate('.removeAdd', 'click', function(e) {
        $(this).parents('.containerAdd').remove();
    });

    $("#tbl").delegate('.acceptAdd', 'click', function(e) {
        $(this).parents('.containerAdd').find('.textNormal').addClass('textAccept');
        $(this).hide();
    });

    if ($('#ctl00_C_txtLayoutdata').val() != "") {        
        FillLayoutData();        
    }  
    
    //hide message
    $("#waitTbl").fadeOut(200);
}

function createDynamicTable(tbody, rows, cols) {    
    if (tbody == null || tbody.length < 1) return;
    //tbody.find("tr").remove();

    var lRows = tbody.find("tr").length;
    var lCols = tbody.find("tr:first td").length;

    // add cols
    if (cols > lCols) {
        for (var r = 0; r < rows; r++) {
            var lRow = tbody.find("tr:eq(" + r + ")");
            for (var c = lCols; c < cols; c++) {
                //var cellText = "Cell " + r + "." + c;
                var cellText = "";
                var btnClone = $('#cellDynamicTemplate .buttonAddContainer').clone();

                $("<td>")
					.addClass("tableCell")
					.text(cellText)
					.data("col", c)
					.append(btnClone)
					.appendTo(lRow);
            }
        }
    }

    //remove cols
    if (cols < lCols) {
        for (var r = 0; r < rows; r++) {
            for (var c = lCols; c > cols; c--) {
                tbody.find("tr:eq(" + r + ") td:last").remove();
            }
        }
    }

    // add rows
    if (rows > lRows) {
        for (var r = lRows; r < rows; r++) {
            var trow = $("<tr>");
            for (var c = 1; c <= cols; c++) {
                //var cellText = "Cell " + r + "." + c;
                var cellText = "";
                var btnClone = $('#cellDynamicTemplate .buttonAddContainer').clone();

                $("<td>")
					.addClass("tableCell")
					.text(cellText)
					.data("col", c)
					.append(btnClone)
					.appendTo(trow);
            }
            trow.appendTo(tbody);
        }
    }
    // remove rows
    if (rows < lRows) {
        for (var r = lRows; r > rows; r--) {
            tbody.find("tr:last").remove();
        }
    }

}

function FillLayoutData() {
    $('#trRows,#trCols').fadeIn(200);
    $('#trTable').fadeIn(200);

    var rows = $("#ctl00_C_tbRows").val();
    var cols = $("#ctl00_C_tbCols").val();
    var tbody = $("#tbl");

    //recreate table
    createDynamicTable(tbody, rows, cols);

    //add values
    var obj = $.parseJSON($('#ctl00_C_txtLayoutdata').val());

    for (var r = 0; r < rows; r++) {
        var lRow = tbody.find("tr:eq(" + r + ")");
        for (var c = 0; c < cols; c++) {
            //var cellText = "Cell " + r + "." + c;
            var cellText = "";
            var lCol = lRow.find("td:eq(" + c + ")");

            var arrTextValues = obj.data["row_" + r]["col_" + c].textValues;
            //obj.data
            for (var i in arrTextValues) {
                var template = $('#cellDynamicTemplate');
                var containerAdd = $('.containerAdd:eq(0)', template);
                var containerAddClone = containerAdd.clone();
                //phonesDiv.append('<div style="clear:both;" />')

                containerAddClone.find(".textNormal").val(arrTextValues[i])

                lCol.append(containerAddClone);
                containerAddClone.show();

                containerAddClone.find('.textNormal').addClass('textAccept');
                containerAddClone.find('.acceptAdd').hide();
            }


        }
    }
}

function CollectLayoutData() {
    //build json collect table data

    var $table = $('#tbl');
    var sb = new Sys.StringBuilder();

    sb.appendLine('{');
    sb.appendLine('"data":{');

    var rows = $('tr', $table).length;
    var cols = $('tr:eq(0) td', $table).length;

    $('tr', $table).each(function(i, item) {
        sb.appendLine('"row_' + i + '":{');

        //for each tr
        $('td', $(this)).each(function(i, item) {
            sb.appendLine('"col_' + i + '":{');

            //get length of textboxs
            var valuesCount = $('.textNormal', $(this)).length;

            sb.appendLine('"textValues":[');
            //collect array values data
            $('.textNormal', $(this)).each(function(i, item) {
                sb.appendLine('"' + $(this).val() + '"');

                if (valuesCount > i + 1) sb.appendLine(',');
            });
            sb.appendLine(']');

            sb.appendLine('}');
            if (cols > i + 1) sb.appendLine(',');
        });

        sb.appendLine('}');

        if (rows > i + 1) sb.appendLine(',');
    });
    //aspnetForms
    var o = $('#aspnetForm').serializeArray();
    var o = null;

    //close data
    sb.appendLine('}');
    //close main
    sb.appendLine('}');

    $('#ctl00_C_txtLayoutdata').val(sb.toString());

    //alert(sb.toString());    
}     

