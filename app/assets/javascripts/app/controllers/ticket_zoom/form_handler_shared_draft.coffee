class TicketZoomFormHandlerSharedDraft

  # central method, is getting called on every ticket form change
  # but only trigger event for group_id changes
  @run: (params, attribute, attributes, classname, form, ui) ->
    return if attribute.name isnt 'group_id'
    App.Event.trigger('ui::ticket::updateSharedDraft', { taskKey: ui.taskKey, newGroupId: params.group_id })

App.Config.set('150-ticketFormSharedDraft', TicketZoomFormHandlerSharedDraft, 'TicketZoomFormHandler')
