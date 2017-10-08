<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupPois.label', default: 'GroupPois')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-groupPois" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MOD">
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </sec:ifAnyGranted>
    </ul>
</div>
<div id="list-groupPois" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    %{--<f:table collection="${groupPoisList}" />--}%
    <table>
        <thead>
        <tr>
            <th>Nom du groupe</th>
            <th>Points d'intérêt </th>
            <th>Images</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${groupInstanceList}" var="MyGroup">
            <tr>
                <td><a href="/groupPois/show/${MyGroup.id}">${MyGroup.nomGroup}</a></td>
                <td>    <g:each in="${MyGroup.pois}" var="pois">
                <a href="/Pois/show/${pois.id}">${pois.nom}</a>   </g:each> </td>
                <td>    <g:each in="${MyGroup.images}" var="media">
                <img src="${createLink(controller: 'Media', action: 'DisplayImage', params: ['id': media.id])}" height="100" width="100"/>
                    </g:each> </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${groupPoisCount ?: 0}" />
    </div>
</div>

<h1>Carte des Points d'intérêts</h1>

<div id="googleMap" style="width:100%;height:400px;"></div>

<script>
    var latList = ${groupInstanceList.pois.loc.latitude} ;
    var lngList = ${groupInstanceList.pois.loc.longitude} ;


    function myMap() {

        var myCenter = new google.maps.LatLng(51,-0.120850);
        var mapCanvas = document.getElementById("map");
        var mapOptions = {center: myCenter, zoom: 5};
        var map = new google.maps.Map(mapCanvas, mapOptions);

        for (var iter=0; iter< latList.length; iter++ ){
            var my1 = new google.maps.LatLng(latList[iter],lngList[iter]);
            var marker1 = new google.maps.Marker ({position:my1});
            marker1.setMap(map);
        }
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4gFNEy61-CP4vgNVQCjBfGw6odeb-gt8&callback=myMap"></script>

</body>
</html>