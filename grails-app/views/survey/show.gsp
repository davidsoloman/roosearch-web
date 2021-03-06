<%@ page import="web.Survey" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <gvisualization:apiImport/>
</head>

<body>

<a href="#show-survey" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-survey" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list survey">

        <g:if test="${surveyInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="survey.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${surveyInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${surveyInstance?.questions}">
            <li class="fieldcontain">
                <span id="questions-label" class="property-label"><g:message code="survey.questions.label"
                                                                             default="Questions"/></span>

                <g:each in="${surveyInstance.questions}" var="q">
                    <span class="property-value" aria-labelledby="questions-label"><g:link controller="question"
                                                                                           action="show"
                                                                                           id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <g:each in="${charts.values()}" var="item">
            <gvisualization:barCoreChart
                    elementId="chart-${item.question_id}"
                    title="${item.question}"
                    width="${400}" height="${240}"
                    columns="${item.column}"
                    data="${item.data}"/>

            <div id="chart-${item.question_id}" align="center"></div>
        </g:each>
    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${surveyInstance?.id}"/>
            <g:link class="edit" action="edit" id="${surveyInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>



</div>
</body>
</html>
