<%@ page import="it.algos.algos.Prova" %>



<div class="fieldcontain ${hasErrors(bean: provaInstance, field: 'stringa', 'error')} required">
	<label for="stringa">
		<g:message code="prova.stringa.label" default="Stringa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stringa" required="" value="${provaInstance?.stringa}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: provaInstance, field: 'intero', 'error')} required">
	<label for="intero">
		<g:message code="prova.intero.label" default="Intero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="intero" type="number" value="${provaInstance.intero}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: provaInstance, field: 'data', 'error')} ">
	<label for="data">
		<g:message code="prova.data.label" default="Data" />
		
	</label>
	<g:datePicker name="data" precision="day"  value="${provaInstance?.data}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: provaInstance, field: 'tempo', 'error')} ">
	<label for="tempo">
		<g:message code="prova.tempo.label" default="Tempo" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: provaInstance, field: 'booleano', 'error')} ">
	<label for="booleano">
		<g:message code="prova.booleano.label" default="Booleano" />
		
	</label>
	<g:checkBox name="booleano" value="${provaInstance?.booleano}" />

</div>

<div class="fieldcontain ${hasErrors(bean: provaInstance, field: 'lungo', 'error')} required">
	<label for="lungo">
		<g:message code="prova.lungo.label" default="Lungo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lungo" type="number" value="${provaInstance.lungo}" required=""/>

</div>

