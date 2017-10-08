package projet_grails1


class Localisation {


    static belongsTo = [pois: Pois]
    float  latitude
    float longitude




    static constraints = {
        latitude nullable: false
        longitude nullable : false

    }
}
