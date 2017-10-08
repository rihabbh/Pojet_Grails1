<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pois.label', default: 'Pois')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-pois" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MOD">
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:ifAnyGranted>
            </ul>
        </div>
        <div id="list-pois" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <th>Nom </th>
                    <th>Description </th>
                    <th>Lattitude</th>
                    <th>Longitude</th>
                    <th> Groupes</th>
                    <th>Images</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${poisInstanceList}" var="Pois">
                    <tr>
                        <td><a href="/Pois/show/${Pois.id}">${Pois.nom}</a></td>
                        <td>${Pois.description}</td>
                        <td> <g:each in="${Pois.loc}" var="loc">
                    <a href="/Localisation/show/${loc.id}">${loc.latitude}</a>  </g:each></td>
                        <td> <g:each in="${Pois.loc}" var="loc">
                            <a href="/Localisation/show/${loc.id}">${loc.longitude}</a>  </g:each></td>
                        <td>    <g:each in="${Pois.group}" var="group">
                            <a href="/GroupPois/show/${group.id}">${group.nomGroup}</a>  </g:each> </td>
                        <td>    <g:each in="${Pois.images}" var="media">
                            <img src="${createLink(controller: 'Media', action: 'DisplayImage', params: ['id': media.id])}"  height="300" width="300"/>
                        </g:each> </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${PoisCount ?: 0}" />
            </div>
        </div>
    </body>
</html>