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

    </ul>


<h1>Carte des Points d'intérêts</h1>

    <div id="map" style="width:100%;height:400px;"></div>

    <script>
        var latList = ${groupInstanceList.pois.loc.latitude} ;
        var lngList = ${groupInstanceList.pois.loc.longitude} ;
        //var nomList= ${groupInstanceList.pois.nom} ;
        function myMap() {
            // cree mon centre
            var myCenter = new google.maps.LatLng(51,-0.120850);
            // cree mon cavnas & mes option sur la map
            var mapCanvas = document.getElementById("map");
            var mapOptions = {center: myCenter, zoom: 5};
            //allou ma map a l'option et le cavnas
            var map = new google.maps.Map(mapCanvas, mapOptions);
            //cree mon marker sur la position de mon centre
            var marker = new google.maps.Marker({position:myCenter});

            marker.setMap(map);

            for (var iter=0; iter< latList.length; iter++ ){
                var my1 = new google.maps.LatLng(latList[iter],lngList[iter]);
                var marker1 = new google.maps.Marker ({position:my1});
    //            marker1.setMap(map);
  //              console.log( nomList[iter])
      //          var infowindow = new google.maps.InfoWindow({
       // content:  nomList[iter]
         //     });
           //             infowindow.open(map,marker);
            }
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4gFNEy61-CP4vgNVQCjBfGw6odeb-gt8&callback=myMap"></script>


</body>
</html>