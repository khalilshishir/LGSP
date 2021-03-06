<script type="text/javascript">
    var childCount = ${hrCalendarInstance?.hrCalendarMonths?.size()} + 0;

    $('.startDate').live('focus', function () {
        $('.startDate').datepicker({ dateFormat: 'dd/mm/yy'});
    });

    $('.endDate').live('focus', function () {
        $('.endDate').datepicker({ dateFormat: 'dd/mm/yy'});
    });

    $('.delButton').live('click', function() {
        var prnt = $(this).parents(".detail-div");
        var delInput = prnt.find("input[id$=deleted]");
        delInput.attr('value', 'true');
        prnt.hide();
    });

    function addChild() {
        var clone = $("#detail_clone").clone();
        var htmlId = 'hrCalendarMonths[' + childCount + '].';
        var slNo=  childCount+1;

        clone.find("input[id$=id]")
                .attr('id', htmlId + 'id')
                .attr('name', htmlId + 'id');

        clone.find("input[id$=deleted]")
                .attr('id', htmlId + 'deleted')
                .attr('name', htmlId + 'deleted');

        clone.find("input[id$=new]")
                .attr('id', htmlId + 'new')
                .attr('name', htmlId + 'new')
                .attr('value', 'true');


        /*clone.find("select[id^=hrCalendarIdHrCalendar]")
                .attr('id', 'hrCalendarIdHrCalendar' + childCount)
                .attr('name', htmlId + 'hrCalendarIdHrCalendar');*/

        clone.find("input[id$=calendarYear]").attr('id', htmlId + 'calendarYear').attr('name', htmlId + 'calendarYear');
        clone.find("input[id$=startDate]").attr('id', htmlId + 'startDate').attr('name', htmlId + 'startDate');
        clone.find("input[id$=endDate]").attr('id', htmlId + 'endDate').attr('name', htmlId + 'endDate');
        clone.find("input[id$=periodName]").attr('id', htmlId + 'periodName').attr('name', htmlId + 'periodName');
        clone.find("input[id$=serialNo]").attr('id',htmlId+'serialNo').attr('name',htmlId + 'serialNo').attr('value',slNo);
        clone.attr('id', 'detail' + childCount);
        $("#serialNo").val(slNo);
        $("#detailList").append(clone);
        clone.show();
        childCount++;
    }


    // --------------- start for loan details process --------------------------------------
    function calendarDetail(calendarYear,startDate,endDate,periodName,serialNo) {
       // alert(calendarYear+" "+startDate+" "+endDate+" "+periodName+" "+serialNo);
        var clone = $("#detail_clone").clone();
        var htmlId = 'hrCalendarMonths['+childCount+'].';
        var displayItemId = 'hrCalendarMonths' + childCount;

        clone.find("input[id$=id]")
                .attr('id',htmlId + 'id')
                .attr('name',htmlId + 'id');

        clone.find("input[id$=deleted]")
                .attr('id',htmlId + 'deleted')
                .attr('name',htmlId + 'deleted');

        clone.find("input[id$=new]")
                .attr('id',htmlId + 'new')
                .attr('name',htmlId + 'new')
                .attr('value', 'true');

        clone.find("input[id$=calendarYear]")
                .attr('id', htmlId + 'calendarYear')
                .attr('name', htmlId + 'calendarYear').attr('value',calendarYear);

        clone.find("input[id$=startDate]")
                .attr('id',htmlId+'startDate')
                .attr('name',htmlId + 'startDate').attr('value',startDate);

        clone.find("input[id$=endDate]")
                .attr('id',htmlId+'endDate')
                .attr('name',htmlId + 'endDate').attr('value',endDate);

        clone.find("input[id$=periodName]")
                .attr('id',htmlId+'periodName')
                .attr('name',htmlId + 'periodName').attr('value',periodName);

        clone.find("input[id$=serialNo]")
                .attr('id',htmlId+'serialNo')
                .attr('name',htmlId + 'serialNo').attr('value',serialNo);

        clone.attr('id', 'detail'+childCount);
        $("#detailList").append(clone);
        clone.show();
        childCount++;
    }
    // --------------- end for Calendar details process ------------------------------


    function addChilds() {
       // alert("addChilds");
        $("#process").attr("disabled","disabled");
        var calendarYearName = $('.calendarYearName').val();
        var startMonthArray = $('.startMonth').val().split("/");
        var  startMonth = startMonthArray[2]+"/"+startMonthArray[1]+"/"+startMonthArray[0];

        var endMonthArray = $('.endMonth').val().split("/");
        var  endMonth = endMonthArray[2]+"/"+endMonthArray[1]+"/"+endMonthArray[0];

        var startingMonth = new Date(startMonth);
        var endingMonth = new Date(endMonth);

         // Months between years.
        var months = (endingMonth.getFullYear() - startingMonth.getFullYear()) * 12;
        // Months between... months.
        months += (endingMonth.getMonth() - startingMonth.getMonth())+1;

        for (var i=0;i<months;i++) {
        var d = new Date(startMonth);
        var m = d.getMonth()+i; //current month
        var y = d.getFullYear(); //current year
        var firstDay = new Date(y,m,1);
        var firstDayOfMonth = $.datepicker.formatDate('dd/mm/yy',firstDay);
        var lastDay = new Date(y,m+1,0);
        var lastDayOfMonth = $.datepicker.formatDate('dd/mm/yy',lastDay);
        var monthName = $.datepicker.formatDate('M',firstDay);
        var dateString = monthName+'-'+calendarYearName.substr(2,2);
        calendarDetail(calendarYearName,firstDayOfMonth,lastDayOfMonth,dateString,i+1);
        }
    }

</script>

<br/><br/>

<table width="100%" border="0" cellpadding="0" cellspacing="0" id="detailList" class="common-list-table">
    <tr style="background-color: #0188D1; font-family: arial;font-size: 12px; font-weight: bold; color: white; height: 25px;">
        <th>Calendar Year</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Period Name</th>
    </tr>
    <g:render template='detail' model="['hrCalendarMonth':null,'i':'_clone','hidden':true]"/>
    <g:each var="hrCalendarMonth" in="${hrCalendarMonths}" status="i">
        <g:render template='detail' model="['hrCalendarMonth':hrCalendarMonth,'i':i]"/>
    </g:each>
</table>


<g:if test="${params.action=='create'}">
    <input type="button" id="process" value="Calendar Process" onclick="addChilds();" class="add-btn"/>
</g:if>
<g:else>
    <input type="button" id="process" value="Add Detail" onclick="addChild();" class="add-btn" />
</g:else>

%{--<input type="button" id="process" value="Calendar Process" onclick="addChilds();" class="add-btn"/>
<input type="button" value="Add Detail" onclick="addChild();"/>--}%
