
<%@ page import="it.algos.algos.Prova" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'prova.label', default: 'Prova')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-prova" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <g:if test="${menuExtra}">
            <algos:menuExtra menuExtra="${menuExtra}"></algos:menuExtra>
        </g:if>
    </ul>
</div>

<div id="list-prova" class="content scaffold-list" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
    <g:if test="${flash.messages}">
        <g:each in="${flash.messages}" status="i" var="singoloMessaggio">
            <div class="message" role="status">${singoloMessaggio}</div>
        </g:each>
    </g:if>
    <g:if test="${flash.errors}">
        <g:each in="${flash.errors}" status="i" var="singoloErrore">
            <div class="errors" role="status">${singoloErrore}</div>
        </g:each>
    </g:if>
    <h1><g:message code="prova.list.label" args="[entityName]" default="Elenco"/></h1>

    <table>
        <thead>
        <g:if test="${campiLista}">
            <algos:titoliLista campiLista="${campiLista}"></algos:titoliLista>
        </g:if>
        <g:else>
            <tr>
                
                <g:sortableColumn property="stringa"
                                  title="${message(code: 'prova.stringa.label', default: 'Stringa')}"/>
                
                <g:sortableColumn property="intero"
                                  title="${message(code: 'prova.intero.label', default: 'Intero')}"/>
                
                <g:sortableColumn property="data"
                                  title="${message(code: 'prova.data.label', default: 'Data')}"/>
                
                <g:sortableColumn property="tempo"
                                  title="${message(code: 'prova.tempo.label', default: 'Tempo')}"/>
                
                <g:sortableColumn property="booleano"
                                  title="${message(code: 'prova.booleano.label', default: 'Booleano')}"/>
                
                <g:sortableColumn property="lungo"
                                  title="${message(code: 'prova.lungo.label', default: 'Lungo')}"/>
                
            </tr>
        </g:else>
        </thead>
        <tbody>
        <g:if test="${campiLista}">
            <g:each in="${provaInstanceList}" status="i" var="provaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <algos:rigaLista campiLista="${campiLista}" rec="${provaInstance}"></algos:rigaLista>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <g:each in="${provaInstanceList}" status="i" var="provaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${provaInstance.id}">${fieldValue(bean: provaInstance, field: "stringa")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${provaInstance.id}">${fieldValue(bean: provaInstance, field: "intero")}</g:link></td>
                    
                    <td><g:formatDate date="${provaInstance.data}"/></td>
                    
                    <td><g:link action="show"
                                id="${provaInstance.id}">${fieldValue(bean: provaInstance, field: "tempo")}</g:link></td>
                    
                    <g:if test="${provaInstance.booleano!=null}">
                        <td><g:checkBox name="booleano" value="${provaInstance.booleano}"/></td>
                    </g:if>
                    
                    <td><g:link action="show"
                                id="${provaInstance.id}">${fieldValue(bean: provaInstance, field: "lungo")}</g:link></td>
                    
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${provaInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
