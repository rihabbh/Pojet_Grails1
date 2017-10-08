package projet_grails1

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/projet/login/" (controller: 'login',action: 'auth')
        "/projet/user/$id?/show"  (controller: 'user',action: 'show')
        "/projet/user/$id?/edit"  (controller: 'user',action: 'edit')
        "/projet/user/info"  (controller: 'user',action: 'info')
        "/projet/user/editme"  (controller: 'user',action: 'editme')
        "/projet/group/$id?/edit"  (controller: 'groupPois',action: 'edit')
        "/projet/group/$id?/show"  (controller: 'groupPois',action: 'show')
        "/projet/group/index"  (controller: 'groupPois',action: 'list')
        "/projet/group/map"  (controller: 'groupPois',action: 'map')
        "/projet/poi/$id?/show"  (controller: 'pois',action: 'show')
        "/projet/poi/$id?/edit"  (controller: 'pois',action: 'edit')
        "/projet/poi/index"  (controller: 'pois',action: 'list')

    }
}
