<%@ page import="accounts.AfmBankInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'afmBankInfo.label', default: 'Bank Information')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

    <p align="right" style="color:#666; font-size: 11px; padding-right: 5px; margin-top: 10px;">
        <a style="color:#666; font-size: 11px;" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
        |
        <a style="color:#666; font-size: 11px;" href="#"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></a>
    </p>

    <div id="create-afmBankInfo" class="content scaffold-create" role="main">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><g:message code="default.create.label" args="[entityName]" /></h3>
                <g:if test="${flash.message}">
                    <div  class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${afmBankInfoInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${afmBankInfoInstance}" var="error">
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


    %{--


		<a href="#create-afmBankInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

   --}%%{-- New Design Start--}%%{--


    <div id="create-afmBankInfo" class="content scaffold-create myDiv" role="main">
        <div class="inner-wrapper">

            <div class="page-title-block">
                <div align="center" class="myHeader site-title" style="width: 100%">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>

                </div>
                <div class="clear"></div>

            </div>
            <g:if test="${flash.message == "already exist in database"}">
                <div align="center"  role="alert">
                    <label class="errors">${value+" "+flash.message}</label>
                </div>
            </g:if>
            <g:elseif test="${flash.message}">
                <div align="center" role="status">
                    <label class="message">${flash.message}</label>
                </div>
            </g:elseif>
            <g:hasErrors bean="${afmBankInfoInstance}">
                <div align="center">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${afmBankInfoInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <g:if test="${flash.message}">
                    <fieldset style="margin-top: 17.5%;" class="buttons ">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Save')}"/>
                    </fieldset>
                </g:if>
                <g:else>
                    <fieldset style="margin-top: 22%;" class="buttons ">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Save')}"/>
                    </fieldset>
                </g:else>
            </g:form>
            <br/>
        </div>
    </div>

    New Design End--}%

	</body>
</html>
