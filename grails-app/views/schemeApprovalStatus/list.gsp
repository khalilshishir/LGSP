
<%@ page import="planningbudget.SchemeApprovalStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schemeApprovalStatus.label', default: 'Scheme Approval Status')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-schemeApprovalStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
        <p align="right" style="color:#666; font-size: 11px; padding-right: 5px; margin-top: 10px;">
            <a style="color:#666; font-size: 11px;" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            |
            <a style="color:#666; font-size: 11px;" href="#"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></a>
        </p>
		<div id="list-schemeApprovalStatus" class="content scaffold-list" role="main">
			%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><g:message code="default.list.label" args="[entityName]" /></h3>
                </div>
            </div>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table id="example" class="dataListTable table table-bordered table-striped table-hover table-condensed" >
                <thead>
                <tr>
					
						<g:sortableColumn property="keyWard" title="${message(code: 'schemeApprovalStatus.keyWard.label', default: 'Key Ward')}" />
					
						<g:sortableColumn property="statusName" title="${message(code: 'schemeApprovalStatus.statusName.label', default: 'Status Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${schemeApprovalStatusInstanceList}" status="i" var="schemeApprovalStatusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${schemeApprovalStatusInstance.id}">${fieldValue(bean: schemeApprovalStatusInstance, field: "keyWard")}</g:link></td>
					
						<td>${fieldValue(bean: schemeApprovalStatusInstance, field: "statusName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${schemeApprovalStatusInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
