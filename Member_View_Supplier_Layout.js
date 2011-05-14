/// <reference path="Scripts/jquery-1.5.2-vsdoc.js"/>

var currentUpdateEvent;
var addStartDate;
var addEndDate;
var globalAllDay;

function LoadPage() {                       

    if ($('#ctl00_C_txtLayoutdata').val() != "") {        
        FillLayoutData();        
        InitCalendar();
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
        
        droppedItem.data("id",'"' + obj.data[r].id + '"');            
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
                       
        // icons hide show on move   
        // div item mouse enter event 
        $('#divContainer').delegate('.divItem', 'mouseenter', function() {                
            $(this).find('.itemHeader').addClass("ui-state-active"); 
            $(this).find('.itemIcons').addClass("ui-state-active").show(); 
        });    

        // div item mouse leave event
        $('#divContainer').delegate('.divItem', 'mouseleave', function() {                
            $(this).find('.itemHeader').removeClass("ui-state-active");       
            $(this).find('.itemIcons').removeClass("ui-state-active").hide(); 
        });              
        
        // div item click event
        $('#divContainer').delegate('.divItem', 'click', function(e) {  
            var eventSource = {
                url: 'JsonResponse.ashx',
                type: 'POST',
                data: {resourceID: $(this).data("id")},
                error: function() {
                    alert('there was an error while fetching events!');
                }
                //color: 'yellow',   // a non-ajax option
                //textColor: 'black' // a non-ajax option
            };                        
            
            var timeObj = $.parseJSON($(this).data("time"));            
            
            var eventSource2 = {
                events: function(start, end, callback) {
                    var events = [];                                        
                    var timeStart,timeEnd;
                    var date = new Date();
                    var d = date.getDate();
                    var m = date.getMonth();
                    var y = date.getFullYear();
                    //var tes = date.format("dd-MM-yyyy hh:mm:ss tt")                                            

                    var unAvailibleTime =[];
                    for(var k=0;k<24;k++)
                    {                        
                        unAvailibleTime.push({
                            'date': new Date(String.format("{0} {1}", date.format("MM/dd/yyyy"),zeroPad(k,2) + ":00")),
                            'active': true
                        });
                        unAvailibleTime.push({
                            'date': new Date(String.format("{0} {1}", date.format("MM/dd/yyyy"),zeroPad(k,2) + ":30")),
                            'active': true
                        });
                    }                    

                    //loop days
                    for(var j=0;j<7;j++)
                    {                                                  
                        //reset dates struct 
                        $.each(unAvailibleTime, function(i, item) {
                            item.active = true;
                        });
                                          
                        //loop on time data rows
                        for(var i=0;i < timeObj.data.length; i++)
                        {                                                           
                            //j*2+1 start time 
                            //j*2+2 end time
                            var startTime = timeObj.data[i][j+1];
                            var endTime = timeObj.data[i][j+2];
                            
                            if(startTime == "") continue;
                            if(endTime == "") continue;
                                                                                    
                            startTime=new Date(String.format("{0} {1}", date.format("MM/dd/yyyy"),startTime));
                            endTime=new Date(String.format("{0} {1}", date.format("MM/dd/yyyy"),endTime));
                            
                            if(startTime > endTime) continue;

                            //check in slots if date active
                            $.each(unAvailibleTime, function(i, item) {                                
                                if(item.date >= startTime && item.date <= endTime)
                                {                                                                                                                              
                                    item.active = false;
                                }
                            });
                        }//loop on time data rows
                        
                        var eventsdates=[];
                        var eventsdatesStart="";
                        var eventsdatesEnd="";
                        //create date for events calendar
                        $.each(unAvailibleTime, function(i, item) {                                
                            //var startDate = item.date.format("yyyy-MM-dd HH:mm");
                            if(item.active == true)
                            {
                                if(eventsdatesStart == "")
                                {
                                    eventsdatesStart = item.date.format("yyyy-MM-dd HH:mm");
                                }
                            }
                        });                        
                        
                    }//loop days
/*
                            events.push({
                                title  : 'לא זמין',                        
                                start  : String.format("{0} {1}", date.format("yyyy-MM-dd"),timeStart),
                                end  : String.format("{0} {1}", date.format("yyyy-MM-dd"),timeEnd),
                                allDay : false                        
                            });                      */
                    
                    callback(events);
                },
                backgroundColor: 'gray'
                //color: 'yellow',   // an option!
                //textColor: 'black' // an option!
            };                                   
                                                                           
            //$('#calendar').fullCalendar( 'removeEventSource', eventSource )
            //$('#calendar').fullCalendar( 'removeEventSource', eventSource2 )            
            $('#calendar').fullCalendar( 'removeEvents', filter);
            $('#calendar').fullCalendar( 'addEventSource', eventSource );
            $('#calendar').fullCalendar( 'addEventSource', eventSource2 );
            //$('#calendar').fullCalendar( 'refetchEvents' );
            $('#calendarDialog').dialog('open');            
            window.scrollTo(10,0);
            //$("window").scrollTop(0);
            e.stopPropagation();
            return false;            
        });  
        
        // remove all events
        function filter(elem,i) {            
            return true;
        }                 
        
    }
}      

function InitCalendar()
{
    // update Dialog
    $('#updatedialog').dialog({
        autoOpen: false,
        width: 470,
        buttons: {
            "update": function() {
                //alert(currentUpdateEvent.title);
                var eventToUpdate = {
                    id: currentUpdateEvent.id,
                    title: $("#eventName").val(),
                    description: $("#eventDesc").val()
                };

                if (checkForSpecialChars(eventToUpdate.title) || checkForSpecialChars(eventToUpdate.description)) {
                    alert("please enter characters: A to Z, a to z, 0 to 9, spaces");
                }
                else {
                    PageMethods.UpdateEvent(eventToUpdate, updateSuccess);
                    $(this).dialog("close");

                    currentUpdateEvent.title = $("#eventName").val();
                    currentUpdateEvent.description = $("#eventDesc").val();
                    $('#calendar').fullCalendar('updateEvent', currentUpdateEvent);
                }

            },
            "delete": function() {

                if (confirm("do you really want to delete this event?")) {

                    PageMethods.deleteEvent($("#eventId").val(), deleteSuccess);
                    $(this).dialog("close");
                    $('#calendar').fullCalendar('removeEvents', $("#eventId").val());
                }

            }

        }
    });

    //add dialog
    $('#addDialog').dialog({
        autoOpen: false,
        width: 470,
        buttons: {
            "Add": function() {

                //alert("sent:" + addStartDate.format("dd-MM-yyyy hh:mm:ss tt") + "==" + addStartDate.toLocaleString());
                var eventToAdd = {
                    title: $("#addEventName").val(),
                    description: $("#addEventDesc").val(),
                    start: addStartDate.format("dd-MM-yyyy hh:mm:ss tt"),
                    end: addEndDate.format("dd-MM-yyyy hh:mm:ss tt")

                };

                if (checkForSpecialChars(eventToAdd.title) || checkForSpecialChars(eventToAdd.description)) {
                    alert("please enter characters: A to Z, a to z, 0 to 9, spaces");
                }
                else {
                    //alert("sending " + eventToAdd.title);

                    PageMethods.addEvent(eventToAdd, addSuccess);
                    $(this).dialog("close");
                }

            }

        }
    });
        
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();    

    var calendar = $('#calendar').fullCalendar({        
        theme: true,
        header: {
            left: 'next,prev today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        isRTL: true,
        defaultView: 'agendaWeek',
        buttonText: {      
            today:    'היום',
            month:    'חודש',
            week:     'שבוע',                      
            day:      'יום'
        },        
        dayNames:['ראשון', 'שני', 'שלישי', 'רביעי','חמישי', 'שישי', 'שבת'],
        dayNamesShort:['א', 'ב', 'ג', 'ד', 'ה', 'ו', 'ש'],
        monthNames:['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי','אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר'],
        monthNamesShort:['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי','אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר'],
        columnFormat:{
            month: 'ddd',    // Mon
            week: 'ddd d/M', // Mon 9/7
            day: 'dddd d/M'  // Monday 9/7
        },
        allDayText: 'יום שלם',
        axisFormat: 'HH:mm',
        eventClick: updateEvent,
        selectable: true,
        selectHelper: true,
        select: selectDate,
        editable: true,
        //events:'JsonResponse.ashx',
        eventDrop: eventDropped,
        eventResize: eventResized
        ,
        eventRender: function(event, element) {
            //alert(event.title);
            element.qtip({
                content: event.description,
                position: { corner: { tooltip: 'bottomLeft', target: 'topRight'} },
                style: {
                    border: {
                        width: 1,
                        radius: 3,
                        color: '#2779AA'

                    },
                    padding: 10,
                    textAlign: 'center',
                    tip: true, // Give it a speech bubble tip with automatic corner detection
                    name: 'cream' // Style it according to the preset 'cream' style
                }

            });
        }

    });
    
    $('#calendarDialog').dialog({
        modal: true,
        autoOpen: false,
        width: 960
    });    
    
}

function updateEvent(event, element) {
    //alert(event.description);

    if ($(this).data("qtip")) $(this).qtip("destroy");

    currentUpdateEvent = event;

    $('#updatedialog').dialog('open');

    $("#eventName").val(event.title);
    $("#eventDesc").val(event.description);
    $("#eventId").val(event.id);
    $("#eventStart").text("" + event.start.toLocaleString());

    if (event.end === null) {
        $("#eventEnd").text("");
    }
    else {
        $("#eventEnd").text("" + event.end.toLocaleString());
    }

}

function updateSuccess(updateResult) {
    //alert(updateResult);
}

function deleteSuccess(deleteResult) {
    //alert(deleteResult);
}

function addSuccess(addResult) {
// if addresult is -1, means event was not added
//    alert("added key: " + addResult);

    if (addResult != -1) {
        $('#calendar').fullCalendar('renderEvent',
						{
						    title: $("#addEventName").val(),
						    start: addStartDate,
						    end: addEndDate,
						    id: addResult,
						    description: $("#addEventDesc").val(),
						    allDay: globalAllDay
						},
						true // make the event "stick"
					);


        $('#calendar').fullCalendar('unselect');
    }

}

function UpdateTimeSuccess(updateResult) {
    //alert(updateResult);
}


function selectDate(start, end, allDay) {

    $('#addDialog').dialog('open');


    $("#addEventStartDate").text("" + start.toLocaleString());
    $("#addEventEndDate").text("" + end.toLocaleString());


    addStartDate = start;
    addEndDate = end;
    globalAllDay = allDay;
    //alert(allDay);

}

function updateEventOnDropResize(event, allDay) {

    //alert("allday: " + allDay);
    var eventToUpdate = {
        id: event.id,
        start: event.start

    };

    if (allDay) {
        eventToUpdate.start.setHours(0, 0, 0);

    }

    if (event.end === null) {
        eventToUpdate.end = eventToUpdate.start;

    }
    else {
        eventToUpdate.end = event.end;
        if (allDay) {
            eventToUpdate.end.setHours(0, 0, 0);
        }
    }

    eventToUpdate.start = eventToUpdate.start.format("dd-MM-yyyy hh:mm:ss tt");
    eventToUpdate.end = eventToUpdate.end.format("dd-MM-yyyy hh:mm:ss tt");

    PageMethods.UpdateEventTime(eventToUpdate, UpdateTimeSuccess);

}

function eventDropped(event, dayDelta, minuteDelta, allDay, revertFunc) {

    if ($(this).data("qtip")) $(this).qtip("destroy");

    updateEventOnDropResize(event, allDay);



}

function eventResized(event, dayDelta, minuteDelta, revertFunc) {

    if ($(this).data("qtip")) $(this).qtip("destroy");

    updateEventOnDropResize(event);

}

function checkForSpecialChars(stringToCheck) {
    var pattern = /[^A-Za-z0-9 ]/;
    return pattern.test(stringToCheck); 
}

function zeroPad(num,count)
{
    var numZeropad = num + '';
    while(numZeropad.length < count) {
        numZeropad = "0" + numZeropad;
    }
    return numZeropad;
}
