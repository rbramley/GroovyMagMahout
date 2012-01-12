
<%@ page import="com.rbramley.mahout.Preference" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'preference.label', default: 'Preference')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-preference" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-preference" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list preference">
			
				<g:if test="${preferenceInstance?.userId}">
				<li class="fieldcontain">
					<span id="userId-label" class="property-label"><g:message code="preference.userId.label" default="User Id" /></span>
					
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${preferenceInstance}" field="userId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preferenceInstance?.itemId}">
				<li class="fieldcontain">
					<span id="itemId-label" class="property-label"><g:message code="preference.itemId.label" default="Item Id" /></span>
					
						<span class="property-value" aria-labelledby="itemId-label"><g:fieldValue bean="${preferenceInstance}" field="itemId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preferenceInstance?.prefValue}">
				<li class="fieldcontain">
					<span id="prefValue-label" class="property-label"><g:message code="preference.prefValue.label" default="Pref Value" /></span>
					
						<span class="property-value" aria-labelledby="prefValue-label"><g:fieldValue bean="${preferenceInstance}" field="prefValue"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${preferenceInstance?.id}" />
					<g:link class="edit" action="edit" id="${preferenceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
