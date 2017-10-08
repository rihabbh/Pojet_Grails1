package projet_grails1

class GroupPois {
    String nomGroup
    static hasMany = [pois:Pois, images:Media]
    static belongsTo = [images: Media]

    static constraints = {
        pois nullable:  true
       images nullable: true
        nomGroup blank: false

    }

}
