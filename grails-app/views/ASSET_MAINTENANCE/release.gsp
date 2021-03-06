<%--
  Created by IntelliJ IDEA.
  User: mahye
  Date: 11/6/14
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ASSET_MAINTENANCE.label', default: 'Release')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#edit-ASSET_MAINTENANCE" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>--}%
<p align="right" style="color:#666; font-size: 11px; padding-right: 5px; margin-top: 10px;">
    <a style="color:#666; font-size: 11px;" class="home" href="${createLink(uri: '/')}"><g:message code="Home"/></a>
    %{--|
    <a style="color:#666; font-size: 11px;" href="#"><g:link class="list" action="list"><g:message code="Asset Book List" args="[entityName]" /></g:link></a>
    |
    <a style="color:#666; font-size: 11px;" href="#"><g:link class="create" action="create"><g:message code="New Asset Book" args="[entityName]" /></g:link></a>
--}%
</p>
<div id="edit-ASSET_MAINTENANCE" class="content scaffold-edit" role="main">
    %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><g:message code="Release Asset" args="[entityName]" /></h3>
        </div>
        %{--<g:if test="${flash.message}">
              <div class="message" role="status">${flash.message}</div>
              </g:if>--}%
        <script>
            $(document).ready(function(){
                $("#a").fadeOut(8000);
            });
        </script>
        <g:if test="${flash.message}">
            <div class="panel-body">
                <div id="a" class="alert alert-success" role="alert">
                    <div class="message" role="status">
                        <h3 class="panel-title">${flash.message}</h3>
                    </div>
                </div>
            </div>
        </g:if>
        <g:hasErrors bean="${ASSET_MAINTENANCEInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${ASSET_MAINTENANCEInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="panel-body">
            <g:form method="post" >
                <g:hiddenField name="id" value="${ASSET_MAINTENANCEInstance?.id}" />
                <g:hiddenField name="version" value="${ASSET_MAINTENANCEInstance?.version}" />
                <fieldset class="form">
                    <g:render template="formRelease"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save btn btn-primary btn-sm" action="updateForRelease" value="${message(code: 'default.button.label', default: 'Release')}" />
                    %{--<g:actionSubmit class="delete btn btn-warning btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
                </fieldset>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
