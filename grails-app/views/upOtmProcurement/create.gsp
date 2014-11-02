<%@ page import="procurement.up.otmprocurement.UpOtmProcurement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="upprocurement">
		<g:set var="entityName" value="${message(code: 'upOtmProcurement.label', default: 'UpOtmProcurement')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function setValueOnSchemeChange(schemeInfoId){
//                alert(schemeInfoId);
                if(schemeInfoId <=0 || schemeInfoId==null){

                }else{
                    setSchemeTypeGrantedAmountIsLabourAppointedOnSchemeChange(schemeInfoId);
                }
            }
            function setSchemeTypeGrantedAmountIsLabourAppointedOnSchemeChange(schemeInfoId) {
            <g:remoteFunction controller="common" action="loadSchemeInfo" update="schemeTypeGrantedAmounIsLabourAppointed" params="'schemeInfoId='+schemeInfoId" />
            }
        </script>
	</head>
	<body>

    <p align="right" style="color:#666; font-size: 15px; padding-right: 5px; margin-top: 10px;">
        <a style="color:#666; font-size: 15px;" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
        |
        <a style="color:#666; font-size: 15px;" href="#"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></a>
    </p>


    <div id="create-upOtmProcurement" class="content scaffold-create" role="main">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><g:message code="default.create.label/" default="তৈরি করুন - ইউনিয়ন পরিষদ ক্রয়" args="[entityName]"/></h3>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${upOtmProcurementInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${upOtmProcurementInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
            </div>
            <div class="panel-body">

                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary btn-sm save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>

    </body>
</html>




    %{----}%
		%{--<a href="#create-upOtmProcurement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
		%{--<div id="create-upOtmProcurement" class="content scaffold-create" role="main">--}%
			%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
			%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<g:hasErrors bean="${upOtmProcurementInstance}">--}%
			%{--<ul class="errors" role="alert">--}%
				%{--<g:eachError bean="${upOtmProcurementInstance}" var="error">--}%
				%{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
				%{--</g:eachError>--}%
			%{--</ul>--}%
			%{--</g:hasErrors>--}%
			%{--<g:form action="save" >--}%
				%{--<fieldset class="form">--}%
					%{--<g:render template="form"/>--}%
				%{--</fieldset>--}%
				%{--<fieldset class="buttons">--}%
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
				%{--</fieldset>--}%
			%{--</g:form>--}%
		%{--</div>--}%
	%{--</body>--}%
%{--</html>--}%
