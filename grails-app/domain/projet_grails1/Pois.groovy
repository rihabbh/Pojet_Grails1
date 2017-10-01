package projet_grails1

class Pois {

    String nom;
    String description;

    static hasOne = [loc: Localisation ]
    static hasMany = [images: Media , group: GroupPois]
    static belongsTo    =[ group:GroupPois,images: Media]
    static constraints = {

        nom blank : false
        description blank : false
        loc nullable: true
        images nullable :true
        group nullable :true

    }


}
