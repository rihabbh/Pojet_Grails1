<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<content tag="nav">

<sec:ifNotLoggedIn>
    <li> <a href="/login/index"  role="button" >Connexion</a></li>
    <li>  <a href="/user/create"  role="button" > Inscription </a></li>
</sec:ifNotLoggedIn>

<sec:ifAnyGranted roles="ROLE_ADMIN">
    <li>
       <a href="/role/index">Roles</a>
    </li>
    <li>
  <a href="/user/index">Utilisateur</a>
    </li>
    <li>
  <a href="/userRole/index">UserRole</a>
    </li>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_MOD">
    <li>
        <a href="/userRole/indexmod">Utilisateur</a>
    </li>
</sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MOD">
        <li>
        <a href="/localisation/index"> Localisation</a>
        </li>
        <li>
            <a href="/media/index">Images</a>
        </li>
    </sec:ifAnyGranted>
    <sec:ifLoggedIn>
        <li>
            <a href="/pois/index">Points d'intérêt</a>
        </li>
        <li>
        <a href="/groupPois/index">Groupes</a>
    </li>
        <li>
            <a href="/groupPois/map">Carte des POI</a>
        </li>
        <li>   <a href="/logout/index"  role="button">Deconnexion</a></li>
    </sec:ifLoggedIn>

</content>

<div class="svg" role="presentation">
        <asset:image src="landscape-2373649_1920.jpg"/>

</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Projet Grails MBDS 2017/2018</h1>

        <p>
           Projet Grails effectué par BEN HAMOUDA Rihab & MIMOUNA Amira dans le cadre du cours de Grails en Master 2 MBDS 2017/2018
        </p>

</body>
</html>
