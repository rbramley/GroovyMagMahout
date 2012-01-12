package com.rbramley.mahout

import org.springframework.dao.DataIntegrityViolationException

class PreferenceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [preferenceInstanceList: Preference.list(params), preferenceInstanceTotal: Preference.count()]
    }

    def create() {
        [preferenceInstance: new Preference(params)]
    }

    def save() {
        def preferenceInstance = new Preference(params)
        if (!preferenceInstance.save(flush: true)) {
            render(view: "create", model: [preferenceInstance: preferenceInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'preference.label', default: 'Preference'), preferenceInstance.id])
        redirect(action: "show", id: preferenceInstance.id)
    }

    def show() {
        def preferenceInstance = Preference.get(params.id)
        if (!preferenceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'preference.label', default: 'Preference'), params.id])
            redirect(action: "list")
            return
        }

        [preferenceInstance: preferenceInstance]
    }

    def edit() {
        def preferenceInstance = Preference.get(params.id)
        if (!preferenceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'preference.label', default: 'Preference'), params.id])
            redirect(action: "list")
            return
        }

        [preferenceInstance: preferenceInstance]
    }

    def update() {
        def preferenceInstance = Preference.get(params.id)
        if (!preferenceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'preference.label', default: 'Preference'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (preferenceInstance.version > version) {
                preferenceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'preference.label', default: 'Preference')] as Object[],
                          "Another user has updated this Preference while you were editing")
                render(view: "edit", model: [preferenceInstance: preferenceInstance])
                return
            }
        }

        preferenceInstance.properties = params

        if (!preferenceInstance.save(flush: true)) {
            render(view: "edit", model: [preferenceInstance: preferenceInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'preference.label', default: 'Preference'), preferenceInstance.id])
        redirect(action: "show", id: preferenceInstance.id)
    }

    def delete() {
        def preferenceInstance = Preference.get(params.id)
        if (!preferenceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'preference.label', default: 'Preference'), params.id])
            redirect(action: "list")
            return
        }

        try {
            preferenceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'preference.label', default: 'Preference'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'preference.label', default: 'Preference'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
