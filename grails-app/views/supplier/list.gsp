
<%@ page import="procurement.pmu.Supplier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-supplier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-supplier" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="SUPP_CODE" title="${message(code: 'supplier.SUPP_CODE.label', default: 'SUPPCODE')}" />
					
						<g:sortableColumn property="SUPP_NAME" title="${message(code: 'supplier.SUPP_NAME.label', default: 'SUPPNAME')}" />
					
						<g:sortableColumn property="SUPP_ADDRESS" title="${message(code: 'supplier.SUPP_ADDRESS.label', default: 'SUPPADDRESS')}" />
					
						<g:sortableColumn property="FILE_UPLOAD" title="${message(code: 'supplier.FILE_UPLOAD.label', default: 'FILEUPLOAD')}" />
					
						<g:sortableColumn property="CREATEDATE" title="${message(code: 'supplier.CREATEDATE.label', default: 'CREATEDATE')}" />
					
						<g:sortableColumn property="ISACTIVE" title="${message(code: 'supplier.ISACTIVE.label', default: 'ISACTIVE')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "SUPP_CODE")}</g:link></td>
					
						<td>${fieldValue(bean: supplierInstance, field: "SUPP_NAME")}</td>
					
						<td>${fieldValue(bean: supplierInstance, field: "SUPP_ADDRESS")}</td>
					
						<td>${fieldValue(bean: supplierInstance, field: "FILE_UPLOAD")}</td>
					
						<td><g:formatDate date="${supplierInstance.CREATEDATE}" /></td>
					
						<td><g:formatBoolean boolean="${supplierInstance.ISACTIVE}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${supplierInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
