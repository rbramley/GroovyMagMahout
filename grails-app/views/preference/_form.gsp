<%@ page import="com.rbramley.mahout.Preference" %>



<div class="fieldcontain ${hasErrors(bean: preferenceInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="preference.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="userId" required="" value="${fieldValue(bean: preferenceInstance, field: 'userId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preferenceInstance, field: 'itemId', 'error')} required">
	<label for="itemId">
		<g:message code="preference.itemId.label" default="Item Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="itemId" required="" value="${fieldValue(bean: preferenceInstance, field: 'itemId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preferenceInstance, field: 'prefValue', 'error')} required">
	<label for="prefValue">
		<g:message code="preference.prefValue.label" default="Pref Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="prefValue" from="${0.0..5.0}" class="range" required="" value="${fieldValue(bean: preferenceInstance, field: 'prefValue')}"/>
</div>

