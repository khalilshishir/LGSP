<%@ page import="procurement.up.otmprocurement.UpOtmEvaluation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="upprocurement">
    <g:set var="entityName" value="${message(code: 'upOtmEvaluation.label', default: 'ইউপি উন্মুক্ত দরপত্র মূল্যায়ন প্রতিবেদন')}" />
    <title><g:message code="default.edit.label/" default="এডিট" args="[entityName]" /></title>
</head>
<body>
<p align="right" style="color:#666; font-size: 15px; padding-right: 5px; margin-top: 10px;">
    <a style="color:#666; font-size: 15px;" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label/" default="হোম"/></a>
    |
    <a style="color:#666; font-size: 15px;" href="#"><g:link class="list" action="list"><g:message code="default.list.label/" default="ইউপি উন্মুক্ত দরপত্র মূল্যায়ন প্রতিবেদন লিস্ট" args="[entityName]" /></g:link></a>
    |
    <a style="color:#666; font-size: 15px;" href="#"><g:link class="create" action="create"><g:message code="default.new.label/" default="নতুন ইউপি উন্মুক্ত দরপত্র মূল্যায়ন প্রতিবেদন" args="[entityName]" /></g:link></a>
</p>

<div id="edit-up_Proc_Master" class="content scaffold-edit" role="main">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><g:message code="default.edit.label/" default="এডিট - ইউপি উন্মুক্ত দরপত্র মূল্যায়ন প্রতিবেদন" args="[entityName]"/></h3>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${upOtmEvaluationInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${upOtmEvaluationInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
        </div>

        <div class="panel-body">
            <g:form method="post">
                <g:hiddenField name="id" value="${upOtmEvaluationInstance?.id}"/>
                <g:hiddenField name="version" value="${upOtmEvaluationInstance?.version}"/>
                <fieldset class="form" id="upOtmEvaluationForm" name="upOtmEvaluationForm">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save btn btn-primary btn-sm" action="update"
                                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    <g:actionSubmit class="delete btn btn-warning btn-sm" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    formnovalidate=""
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message/', default: 'আপনি কি নিশ্চিত ?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
