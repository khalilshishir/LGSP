<%--
  Created by IntelliJ IDEA.
  User: amahamud
  Date: 16/9/2014
  Time: 4:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>
       Zilla Porishod Performance Entry
    </title>
    <style>
        table{
            width: 100%;
            border-color: #31b0d5;
        }
        th {
            border-color: #31b0d5;
            text-align: center;
            font-size: 15px
        }
        tr {
            border-color: #31b0d5
        }
        td {
            border-color: #31b0d5
        }
    </style>

</head>

<body>
<script src="${resource(dir: 'js', file: 'jquery-1.8.0.min.js.js')}"></script>
<script type="text/javascript">
//    jQuery(document).ready(function(){
//        alert("oh ya");
//    });
    jQuery(document).on("change",".morRadio",function(){
//        alert("enter");
//        alert($(this).val());
        var anem=$(this).attr('name');
//        alert(anem);
        var mark=$(this).val();
        var arrId=anem.split('-');
        $("#txt-"+arrId[1]).val(mark);
        var id=$(this).attr('id');
        var arrName=id.split('-');
        $("#hd-"+arrId[1]).val(arrName[1]);
        CalculateTotalMark();

    });

    jQuery(document).on("change",function(){
        CalculateTotalMark();
    });
    function CalculateTotalMark(){
        var sum=0;
        $('.marks').each(function(){
            var mark=$(this).val();
            if(mark=="")
            mark="0"
            sum=sum+parseInt(mark);
        });
        $("#txtSum").val(sum);
    }
</script>
<p align="right" style="color:#666; font-size: 11px; padding-right: 5px; margin-top: 10px;">
    <a style="color:#666; font-size: 11px;" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    |
    <a style="color:#666; font-size: 11px;" href="#"><g:link class="list" action="ZillaParishodPerformanceList">Zilla Parishod Performance List</g:link></a>
    %{--|--}%
    %{--<a style="color:#666; font-size: 11px;" href="#"><g:link class="create" action="ZillaPorisodPerformanceEntry">Zilla Parishod Performance New</g:link></a>--}%
</p>
<g:form action="PerformanceEntrySave">
<div class="panel panel-info">
    <div class="panel-heading">
        <h3>Zilla Porishod Performance Entry</h3>
    </div>
    <div class="panel-body">

    <fieldset >
        <div class="row" style="padding-left: 15px">

            <div class="col-xs-6">
                <div class="form-group">
                    <label for="division">বিভাগ</label>
                    <span class="required-indicator">*</span>
                    <g:select class="form-control" name="division" id="division" noSelection="[null:'Select One']" optionKey="id"  from="${settings.Division.list().sort()}"></g:select>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label for="district">জেলা</label>
                    <span class="required-indicator">*</span>
                    <g:select class="form-control" name="district" id="district" noSelection="[null:'Select One']" optionKey="id" from="${settings.District.list().sort()}"></g:select>
                    %{--<g:select class="form-control" name="district" id="district" noSelection="[null:'Select One']" optionKey="id" from="${settings.District.list().sort()}"></g:select>--}%
                </div>
            </div>

            <div class="col-xs-6">
                <div class="form-group">
                    <label for="fiscalYear">অর্থ বছর</label>
                    <span class="required-indicator">*</span>
                    <g:select class="form-control" name="fiscalYear" id="fiscalYear" noSelection="[null:'Select One']" optionKey="id" from="${planningbudget.FiscalYear.list().sort()}"></g:select>
                    %{--<g:select class="form-control" name="fiscalYear" id="fiscalYear" noSelection="[null:'Select One']" optionKey="id" from="${planningbudget.FiscalYear.list().sort()}"></g:select>--}%
                </div>
            </div>
        </div>
    </fieldset>



        %{--<fieldset>--}%
            %{--<table>--}%
                %{--<tr>--}%
                    %{--<td>--}%
                        %{--বিভাগ--}%
                    %{--</td>--}%
                    %{--<td>--}%
                        %{--<label for="division">--}%
                            %{--<g:message code="zillaPorishodPerformanceEntry.division.label" default="Division" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:select name="division" id="division" noSelection="[null:'Select']" optionKey="id"  from="${settings.Division.list().sort()}"></g:select>--}%
                    %{--</td>--}%
                    %{--<td>--}%
                        %{--জেলা--}%
                    %{--</td>--}%
                    %{--<td>--}%
                        %{--<label for="district">--}%
                            %{--<g:message code="zillaPorishodPerformanceEntry.district.label" default="District" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:select name="district" id="district" noSelection="[null:'Select']" optionKey="id" from="${settings.District.list().sort()}"></g:select>--}%
                    %{--</td>--}%
                    %{--<td>--}%
                        %{--অর্থ বছর--}%
                    %{--</td>--}%
                    %{--<td>--}%
                        %{--<label for="fiscalYear">--}%
                            %{--<g:message code="zillaPorishodPerformanceEntry.fiscalYear.label" default="District" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:select name="fiscalYear" id="fiscalYear" noSelection="[null:'Select']" optionKey="id" from="${planningbudget.FiscalYear.list().sort()}"></g:select>--}%
                    %{--</td>--}%
                %{--</tr>--}%
            %{--</table>--}%
        %{--</fieldset>--}%

        <fieldset>
            <table border="2">
                <tr bgcolor="#fff0f5">
                    <th>ক্রঃ নং</th>
                    <th>বিবরণ</th>
                    <th>নম্বর</th>
                    <th>নম্বর বিতরণ পদ্ধতি</th>
                    <th>নম্বর</th>
                    %{--<th>&nbsp;</th>--}%
                    <th>প্রাপ্ত নম্বর</th>
                </tr>
                <g:set var="counter" value="${0}" />
                <g:each in="${lstPerformanceHead}" var="performanceHead" status="i">
                    <g:set var="counter" value="${counter+performanceHead?.mark}"></g:set>
                <tr bgcolor="#f0f8ff" style="font-size: 15px">
                    <td>${performanceHead?.slNo}</td>
                    <td>
                        ${performanceHead?.headName}
                    </td>
                    <td>
                        ${performanceHead?.mark}
                    </td>
                    <td colspan="2"></td>
                    %{--<td>--}%

                    %{--</td>--}%
                    <td>

                    </td>
                </tr>

                    <g:each in="${grantmanagement.PerformanceIndicator.findAllByPerformanceHead(performanceHead).sort{it.slNo}}" var="performanceIndicator" status="j">

                    <tr>
                    <td>

                    </td>
                    <td>
                        ${performanceIndicator?.slNo+" )  "+performanceIndicator?.indicatorName}
                    </td>
                    <td>
                        ${performanceIndicator?.mark}
                    </td>
                    <td>
                    <table>
                        <g:each in="${grantmanagement.MarkDstribution.findAllByPerformanceIndicatorAndPerformanceHead(performanceIndicator,performanceHead).sort{it.slNo}}" var="markDistribution" status="k">

                            <tr>
                                <td>
                                    <g:radio class="morRadio" name="${'rdb-'+performanceIndicator?.id}" value="${markDistribution?.mark}" id="${'rdb-'+markDistribution?.id}"/>
                                    <label>
                                    ${markDistribution?.rules}
                                    </label>
                                </td>
                            </tr>

                        </g:each>
                    </table>

                        %{--<g:radioGroup name="${'chk-'+performanceIndicator?.id}" class="morRadio" id="${grantmanagement.MarkDstribution.findAllByPerformanceIndicatorAndPerformanceHead(performanceIndicator,performanceHead).sort{it.slNo}.id}"--}%
                                      %{--labels="${grantmanagement.MarkDstribution.findAllByPerformanceIndicatorAndPerformanceHead(performanceIndicator,performanceHead).sort{it.slNo}.rules}"--}%
                                      %{--values="${grantmanagement.MarkDstribution.findAllByPerformanceIndicatorAndPerformanceHead(performanceIndicator,performanceHead).sort{it.slNo}.mark}">--}%
                            %{--<p>${it.radio} ${it.label} </p>--}%
                        %{--</g:radioGroup>--}%
                    </td>
                    <td>
                    <table>
                        <g:each in="${grantmanagement.MarkDstribution.findAllByPerformanceIndicatorAndPerformanceHead(performanceIndicator,performanceHead).sort{it.slNo}}" var="markDistribution" status="k">

                            <tr>
                                <td>${markDistribution?.mark}</td>
                            </tr>


                        </g:each>
                    </table>
                    </td>
                    %{--<td>--}%
                        %{--<g:each in="${grantmanagement.MarkDstribution.findAllByPerformanceIndicatorAndPerformanceHead(performanceIndicator,performanceHead).sort{it.slNo}}" var="markDistribution" status="k">--}%
                        %{--<table>--}%
                            %{--<tr>--}%
                                %{--<td>--}%
                                    %{--<g:radioGroup name="${'rdb-'+performanceIndicator?.id}" class="morRadio" id="${'rdb-'+performanceIndicator?.id}"--}%
                                                  %{--values="${markDistribution?.mark}">--}%
                                        %{--<p> ${it.radio}</p>--}%
                                    %{--</g:radioGroup>--}%
                                %{--</td>--}%
                            %{--</tr>--}%

                        %{--</table>--}%
                        %{--</g:each>--}%
                        %{--&nbsp;--}%
                    %{--</td>--}%
                    <td>
                        <label for="${'txt-'+performanceIndicator?.id}">
                            %{--<g:message code="zillaPorishodPerformanceEntry.obtainMark.label" default="Obtain Mark" />--}%
                            <span class="required-indicator">*</span>
                        </label>
                        %{--<g:field name="obtainMark" type="number" value="${zillaPorishodPerformanceEntryInstance.obtainMark}" required=""/>--}%
                        <g:textField disabled="" name="${'txt-'+performanceIndicator?.id}" id="${'txt-'+performanceIndicator?.id}" class="marks" required="required"></g:textField>
                        <g:hiddenField name="${'hd-'+performanceIndicator?.id}" value="" id="${'hd-'+performanceIndicator?.id}"></g:hiddenField>
                    </td>
                </tr>
                    </g:each>
                </g:each>
                <tr bgcolor="#fff0f5">
                    <td colspan="2" align="center">
                        সর্বমোট
                    </td>
                    <td>
                        ${counter}
                    </td>
                    <td colspan="2">
                        মোট প্রাপ্ত নম্বর(অংকে)
                    </td>
                    <td>
                        <g:textField style="background-color: #fff0f5;" disabled="" name="txtSum" id="txtSum"></g:textField>

                    </td>
                </tr>
            </table>
        </fieldset>

        <fieldset style="margin-top: 10px">
            <g:submitButton name="create" class="btn btn-primary btn-sm save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
        %{--<g:submitButton name="create" class="save btn-primary btn-sm" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
    </div>
</div>
</g:form>
</body>
</html>