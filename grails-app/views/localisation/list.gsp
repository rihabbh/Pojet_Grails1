<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'localisation.label', default: 'Localisation')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-localisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-localisation" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            %{--<f:table collection="${localisationList}" />--}%
            <table>
                <thead>
                <tr>
                    <th>Point d'intérêt</th>
                    <th>Longitude </th>
                    <th>Lattitude</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${locInstanceList}" var="MyLocalisation">
                    <tr>
                        <td><a href="/Localisation/show/${MyLocalisation.id}">${MyLocalisation.pois.nom}</a></td>
                        <td><a href="/Localisation/show/${MyLocalisation.id}">${MyLocalisation.longitude}</a></td>
                        <td><a href="/Localisation/show/${MyLocalisation.id}">${MyLocalisation.latitude}</a></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${localisationCount ?: 0}" />
            </div>
        </div>
    </body>
</html>