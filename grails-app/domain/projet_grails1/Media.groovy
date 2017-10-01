package projet_grails1


class Media {
    String fileName
    byte[] filedata
    Date uploadDate = new Date()
    static hasMany = [pois: Pois, groupe: GroupPois]



    static constraints = {
        fileName (blank:false,nullable:false)
        filedata(blank: true, nullable:true, maxSize:1073741824)
        pois nullable: true
        groupe nullable: true
    }
}
