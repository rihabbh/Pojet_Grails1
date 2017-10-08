<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pois.label', default: 'Pois')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-pois" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MOD">
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </sec:ifAnyGranted>
                </ul>
        </div>
        <div id="show-pois" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="pois" />
            <th>    <g:each in="${pois.images}" var="media">
                <img src="${createLink(controller: 'Media', action: 'DisplayImage', params: ['id': media.id])}"  height="300" width="300"/>
            </g:each> </th>
            <h1>Situer le POI</h1>

            <g:form resource="${this.pois}" method="DELETE">

                <fieldset class="buttons">
                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MOD">
                    <g:link class="edit" action="edit" resource="${this.pois}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAnyGranted>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
