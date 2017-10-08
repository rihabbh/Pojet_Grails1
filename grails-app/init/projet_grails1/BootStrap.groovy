package projet_grails1

class BootStrap {

    def init = { servletContext ->
        if (Role.count()==0){
            def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            def modRole = new Role(authority: 'ROLE_MOD').save(flush: true, failOnError: true)
            def userRole = new Role(authority: 'ROLE_USER').save(flush: true, failOnError: true)

            def userInstance = new User(username: 'NINOU', password: 'COCO1234').save(flush: true, failOnError: true)
            def modInstance= new User(username: 'NI', password: 'COCO1234').save(flush: true,failOnError:true)
            def adminInstance= new User(username: 'NOU', password: 'COCO1234').save(flush: true,failOnError:true)

            UserRole.create(userInstance, userRole, true)
            UserRole.create(modInstance, modRole, true)
            UserRole.create(adminInstance, adminRole, true)

            assert User.count() == 3
            assert Role.count() == 3
            assert UserRole.count() == 3

        }

        //def poisInstance = new Pois(nom : 'monptipois', description: 'le gogo ninou est un tout pti user').save(flush: true, failOnError: true);

    //    def loc = new Localisation(longitude :(float) 47.9,latitude :(float) 7.3).save(flush: true, failOnError: true)


        def loc1= new Localisation(latitude: 48.866667, longitude:2.33333)
        (1..3).each {
            int groupIndex ->
                def poisGroupInstance = new GroupPois(nomGroup: 'group '+groupIndex).save(flush: true, failOnError: true)
                (1..5).each {
                    int poisIndex ->
                        poisGroupInstance.addToPois(
                                new Pois(nom:"Poi"+poisIndex,description: 'ptiResume'+poisIndex, loc: loc1).save(flush: true, failOnError: true)

                        )
                }


        }

        def random = new Pois(nom:"truc", description: "random", loc : new Localisation(latitude: 43.6163539, longitude:7.055221)).save(flush: true, failOnError: true)
        def grandom = new GroupPois(nomGroup: 'group random ', pois: random).save(flush: true, failOnError: true)


//        def user1 = new UserRole(user : userInstance, role : userRole).save(flush: true,failOnError:true)
//        def user2 = new UserRole(user : modInstance, role : modRole).save(flush: true,failOnError:true)
//        def user3 = new UserRole(user : adminInstance, role :adminRole).save(flush: true,failOnError:true)


    }
    def destroy = {

    }
}
