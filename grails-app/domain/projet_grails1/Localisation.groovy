package projet_grails1


class Localisation {


    static belongsTo = [pois: Pois]
    int  latitude
    int longitude



    static constraints = {
        latitude nullable: false
        longitude nullable : false

    }
}
