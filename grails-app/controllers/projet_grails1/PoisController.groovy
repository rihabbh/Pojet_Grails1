package projet_grails1

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoisController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Pois.list(params), model:[poisCount: Pois.count()]
        redirect(action: "list", params: params)
    }

    def list(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [poisInstanceList:  Pois.list(params), PoisCount: Pois.count()]
    }


    def show(Pois pois) {
        [poisInstance : pois]
        respond pois
    }

    def create() {
        respond new Pois(params)
    }

    @Transactional
    def save(Pois pois) {
        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pois.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pois.errors, view:'create'
            return
        }

        pois.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pois.label', default: 'Pois'), pois.id])
                redirect pois
            }
            '*' { respond pois, [status: CREATED] }
        }
    }

    def edit(Pois pois) {
        respond pois
    }

    @Transactional
    def update(Pois pois) {
        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pois.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pois.errors, view:'edit'
            return
        }

        pois.save flush:true


        def groupIdList = pois.group.collect{it.id}
        groupIdList.each {
            Long id ->
                GroupPois.get(id).removeFromPois(pois).save(flush:true)

        }
        params.group.each
        {
            GroupPois.get(Integer.parseInt(it)).addToPois(pois).save(flush:true)
        }


        def imagesIdList = pois.images.collect{it.id}
        imagesIdList.each {
            Long id ->
                Media.get(id).removeFromPois(pois).save(flush:true)

        }
        params.images.each
                {
                    Media.get(Integer.parseInt(it)).addToPois(pois).save(flush:true)
                }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'pois.label', default: 'Pois'), pois.id])
                redirect pois
            }
            '*'{ respond pois, [status: OK] }
        }
    }

    @Transactional
    def delete(Pois pois) {

        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        pois.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'pois.label', default: 'Pois'), pois.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pois.label', default: 'Pois'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
