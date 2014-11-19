package it.algos.algos


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProvaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    private static int MAX = 20

    def list() {
        redirect(action: 'index', params: params)
    } // fine del metodo

    def index(Integer max) {
        if (!params.max) params.max = MAX
        ArrayList menuExtra = null
        ArrayList campiLista = null
        def campoSort
        int recordsTotali
        String titoloLista = ''

        //--selezione dei menu extra
        //--solo azione e di default controller=questo; classe e titolo vengono uguali
        //--mappa con [cont:'controller', action:'metodo', icon:'iconaImmagine', title:'titoloVisibile']
        menuExtra = []
        params.menuExtra = menuExtra
        // fine della definizione

        //--selezione delle colonne (campi) visibili nella lista
        //--solo nome e di default il titolo viene uguale
        //--mappa con [campo:'nomeDelCampo', title:'titoloVisibile', sort:'ordinamento']
        //--se vuoto, mostra i primi n (stabilito nel templates:scaffoldinf:list)
        //--    nell'ordine stabilito nella constraints della DomainClass
        campiLista = ['stringa', 'intero', 'data', 'tempo', 'booleano', 'lungo']
        // fine della definizione

        //--regolazione dei campo di ordinamento
        //--regolazione dei parametri di ordinamento
        if (!params.sort) {
            if (campoSort) {
                params.sort = campoSort
            }// fine del blocco if
        }// fine del blocco if-else
        if (params.order) {
            if (params.order == 'asc') {
                params.order = 'desc'
            } else {
                params.order = 'asc'
            }// fine del blocco if-else
        } else {
            params.order = 'asc'
        }// fine del blocco if-else

        //--selezione dei records da mostrare
        recordsTotali = Prova.count()

        //--presentazione della view (index), secondo il modello
        //--menuExtra e campiLista possono essere nulli o vuoti
        //--se campiLista è vuoto, mostra tutti i campi (primi 12)
        respond Prova.list(params), model: [titoloLista       : titoloLista,
                                            menuExtra         : menuExtra,
                                            campiLista        : campiLista,
                                            provaInstanceCount: recordsTotali,
                                            params            : params]
    } // fine del metodo

    def show(Prova provaInstance) {
        respond provaInstance
    } // fine del metodo

    def create() {
        respond new Prova(params)
    } // fine del metodo

    @Transactional
    def save(Prova provaInstance) {
        if (provaInstance == null) {
            notFound()
            return
        }// fine del blocco if

        if (provaInstance.hasErrors()) {
            respond provaInstance.errors, view: 'create'
            return
        }// fine del blocco if

        provaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prova.label', default: 'Prova'), provaInstance.id])
                redirect provaInstance
            }// fine di form
            '*' { respond provaInstance, [status: CREATED] }
        }// fine di request
    } // fine del metodo

    def edit(Prova provaInstance) {
        respond provaInstance
    } // fine del metodo

    @Transactional
    def update(Prova provaInstance) {
        if (provaInstance == null) {
            notFound()
            return
        }// fine del blocco if

        if (provaInstance.hasErrors()) {
            respond provaInstance.errors, view: 'edit'
            return
        }// fine del blocco if

        provaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Prova.label', default: 'Prova'), provaInstance.id])
                redirect provaInstance
            }// fine di form
            '*' { respond provaInstance, [status: OK] }
        }// fine di request
    } // fine del metodo

    @Transactional
    def delete(Prova provaInstance) {

        if (provaInstance == null) {
            notFound()
            return
        }// fine del blocco if

        provaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Prova.label', default: 'Prova'), provaInstance.id])
                redirect action: "index", method: "GET"
            }// fine di form
            '*' { render status: NO_CONTENT }
        }// fine di request
    } // fine del metodo

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prova.label', default: 'Prova'), params.id])
                redirect action: "index", method: "GET"
            }// fine di form
            '*' { render status: NOT_FOUND }
        }// fine di request
    } // fine del metodo
} // fine della controller classe
