<%@ page import="settings.SchemeInfo; procurement.up.rfqprocurement.UpRfqEvaluation" %>

%{--jquery form validation starts--}%
<script>
    $(document).ready(function() {
        $('#upRfqEvaluationForm').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                UP_PROC_MASTER: {
                    message: 'The Procurement Name is not valid',
                    validators: {
                        notEmpty: {
                            message: 'Procurement is required and cannot be empty'
                        }
                    }
                }
            }
        });
    });
</script>
%{--jquery form validation ends--}%

<script>
    function setValueOnProcurementChange(procurementMasterId){
        setValueForForm(procurementMasterId);
        setValueForDetails(procurementMasterId);
    }

    function setValueForDetails(procurementMasterId){
        <g:remoteFunction action="setValueForDetails"  params="'schemeId='+procurementMasterId" update="createDetailTable"/>
    }

    function setValueForForm(procurementMasterId) {
        <g:remoteFunction action="setValueForForm"  params="'schemeId='+procurementMasterId" update="changedValue"/>
    }
</script>

<div class="col-xs-6">
    <div class="form-group">
        <label for="schemeInfo"><g:message code="upRfqOpeningSheet.schemeInfo.label" default="কমিউনিটি প্রকিয়াই ক্রয়কৃত  স্কীম সমূহ" /></label>
        %{--<g:select id="UP_PROC_MASTER" name="UP_PROC_MASTER.id" from="${upProcMasterList}" optionKey="id" optionValue="SCHEME_INFO" noSelection="['':'Select One']" required="" value="${upRfqOpeningSheetInstance?.UP_PROC_MASTER?.id}" class="form-control" onchange="showEstimatedAmountForTheProcurement(this.value)"/>--}%
        <g:select id="schemeInfo" name="schemeInfo.id" from="${SchemeInfo.findAllWhere(IMPLEMENTATION_SYSTEM :'RFQ Procurement')}" optionKey="id"  onchange="setValueOnProcurementChange(this.value)"   noSelection="['': 'Select One']" optionValue="NAME" required="" value="${upRfqEvaluationInstance?.schemeInfo?.id}" class="form-control"/>

    </div>
</div>
%{--
<div class="col-xs-6">
    <div class="form-group">
        <label for="UP_PROC_MASTER"><g:message code="upRfqEvaluation.UP_PROC_MASTER.label" default="ইউনিয়ন পরিষদ ক্রয়" /></label>
        <g:select id="UP_PROC_MASTER" name="UP_PROC_MASTER.id" from="${upProcMasterList}" optionKey="id" optionValue="SCHEME_INFO" noSelection="${['':'Select One']}" required="" value="${upRfqEvaluationInstance?.UP_PROC_MASTER?.id}" onchange="setValueOnProcurementChange(this.value)" class="form-control"/>
    </div>
</div>
--}%

<div class="col-xs-6">
    <div class="form-group">
        <label for="TEC"><g:message code="upRfqEvaluation.TEC.label" default="দরপত্র মূল্যায়ন কমিটি" /></label>
        <g:select id="TEC" name="TEC.id" from="${settings.Committee.list()}" optionKey="id" optionValue="COMMITTEE_NAME" noSelection="['':'Select One']" required="" value="${upRfqEvaluationInstance?.TEC?.id}" class="form-control"/>
    </div>
</div>

<div id="changedValue">
    <div class="col-xs-6">
        <div class="form-group">
            <label for="INVITATION_DATE"><g:message code="upRfqEvaluation.INVITATION_DATE.label" default="দরপত্র আহ্বান তারিখ" /></label>
            <g:textField name="INVITATION_DATE" class="form-control" readonly=""/>
        </div>
    </div>

    <div class="col-xs-6">
        <div class="form-group">
            <label for="OPENING_DATE"><g:message code="upRfqEvaluation.OPENING_DATE.label" default="দরপত্র খোলার তারিখ" /></label>
            <g:textField name="OPENING_DATE" class="form-control" readonly=""/>
        </div>
    </div>
</div>

<div class="col-xs-6">
    <div class="form-group">
        <label for="EVALUATION_DATE"><g:message code="upRfqEvaluation.EVALUATION_DATE.label" default="দরপত্র মূল্যায়ন তারিখ" /></label>
        <div class="bfh-datepicker"   id="EVALUATION_DATE" data-date="${formatDate(format:'MM/dd/yyyy',date:upRfqEvaluationInstance?.EVALUATION_DATE)}" data-close="true" data-name="EVALUATION_DATE"></div>
    </div>
</div>

<div class="col-xs-12 detail-list ${hasErrors(bean: upRfqEvaluationInstance, field: 'upRfqEvaluationSheetDetails', 'error')} ">
    <div class="form-group">
        <ul class="one-to-many">
            <fieldset>
                <li><g:render template="createDetails"/></li>
            </fieldset>
        </ul>
    </div>
</div>

