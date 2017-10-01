package projet_grails1

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MediaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Media.list(params), model:[mediaCount: Media.count()]
    }

    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "Aucune image selectionnée"
        } else {
            def documentInstance = new Media()
            documentInstance.fileName = file.originalFilename
            documentInstance.filedata = file.getBytes()
            documentInstance.save()
        }
        redirect (action:'index')
    }

    def show(Media media) {
        respond media
    }

    def create() {
        respond new Media(params)
    }

    @Transactional
    def save(Media media) {
        if (media == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (media.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond media.errors, view:'create'
            return
        }

        media.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'media.label', default: 'Media'), media.id])
                redirect media
            }
            '*' { respond media, [status: CREATED] }
        }
    }

    def edit(Media media) {
        respond media
    }

    @Transactional
    def update(Media media) {
        if (media == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (media.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond media.errors, view:'edit'
            return
        }

        media.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'media.label', default: 'Media'), media.id])
                redirect media
            }
            '*'{ respond media, [status: OK] }
        }
    }

    @Transactional
    def delete(Media media) {

        if (media == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        media.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'media.label', default: 'Media'), media.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    def DisplayImage() {
        def classified = Media.findById(params.id)
        byte[] imageInByte=classified.filedata
        response.contentType = 'image/png' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()
    }
}
