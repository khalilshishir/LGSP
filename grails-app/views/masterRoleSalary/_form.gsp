<%@ page import="settings.SchemeInfo; procurement.up.Up_Proc_Master; procurement.up.Procurement_Type; procurement.up.communityprocurement.MasterRoleSalary" %>

%{--jquery form validation starts--}%
<script>
    $(document).ready(function() {
        $('#masterRoleSalaryForm').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                UP_PROCUREMENT_MASTER: {
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

<script type="text/javascript">
    function loadGrantedAmountForTheScheme(procurementMasterId){
        <g:remoteFunction action="setValueForGrantedAmount"  params="'schemeInfo='+procurementMasterId" update="grantedAmount"/>
    }
</script>

<div class="col-xs-6">
    <div class="form-group">
        <label for="UP_PROCUREMENT_MASTER"><g:message code="masterRoleSalary.UP_PROCUREMENT_MASTER.label" default="কমিউনিটি প্রকিয়াই ক্রয়কৃত  স্কীম সমূহ" /></label>
        <g:select id="schemeInfo" name="schemeInfo.id" from="${SchemeInfo.findAllWhere(IMPLEMENTATION_SYSTEM :'Community Procurement')}" optionKey="id"  noSelection="['': 'Select One']" optionValue="NAME" required="" value="${masterRoleSalaryInstance?.schemeInfo?.id}" class="form-control" onchange="loadGrantedAmountForTheScheme(this.value)"/>


    </div>
</div>

<div id="grantedAmount">
    <div class="col-xs-6">
        <div class="form-group">
            <label for="grantedAmount"><g:message code="labourAppoinmentInfo.UP_PROCUREMENT_MASTER.label" default="অনুমোদিত মূল্য" /></label>
            <g:textField name="grantedAmount" id="grantedAmount" readonly=""  class="form-control" value="${grantedAmount}"/>
        </div>
    </div>
</div>

<div class="col-xs-12 detail-list">
    <div class="form-group">
        <ul class="one-to-many">
            <fieldset>
                <li><g:render template="details"/></li>
            </fieldset>
        </ul>
    </div>
</div>