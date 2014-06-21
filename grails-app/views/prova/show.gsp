
<%@ page import="it.algos.algos.Prova" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prova.label', default: 'Prova')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prova" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prova" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prova">
			
				<g:if test="${provaInstance?.stringa}">
				<li class="fieldcontain">
					<span id="stringa-label" class="property-label"><g:message code="prova.stringa.label" default="Stringa" /></span>
					
						<span class="property-value" aria-labelledby="stringa-label"><g:fieldValue bean="${provaInstance}" field="stringa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provaInstance?.intero}">
				<li class="fieldcontain">
					<span id="intero-label" class="property-label"><g:message code="prova.intero.label" default="Intero" /></span>
					
						<span class="property-value" aria-labelledby="intero-label"><g:fieldValue bean="${provaInstance}" field="intero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provaInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="prova.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:formatDate date="${provaInstance?.data}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${provaInstance?.tempo}">
				<li class="fieldcontain">
					<span id="tempo-label" class="property-label"><g:message code="prova.tempo.label" default="Tempo" /></span>
					
						<span class="property-value" aria-labelledby="tempo-label"><g:fieldValue bean="${provaInstance}" field="tempo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provaInstance?.booleano}">
				<li class="fieldcontain">
					<span id="booleano-label" class="property-label"><g:message code="prova.booleano.label" default="Booleano" /></span>
					
						<span class="property-value" aria-labelledby="booleano-label"><g:formatBoolean boolean="${provaInstance?.booleano}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${provaInstance?.lungo}">
				<li class="fieldcontain">
					<span id="lungo-label" class="property-label"><g:message code="prova.lungo.label" default="Lungo" /></span>
					
						<span class="property-value" aria-labelledby="lungo-label"><g:fieldValue bean="${provaInstance}" field="lungo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:provaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${provaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
