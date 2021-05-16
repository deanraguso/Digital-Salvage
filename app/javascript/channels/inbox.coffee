jQuery(document).on 'tubolinks:load', ->
    messages = $('#messages')
    if messages.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: "InboxesChannel"
            inbox_id: messages.data('inbox-id')
        },
        connected: ->
        disconnected: -> 
        received: (data) ->
            messages.append data['message']
        send_message: (message, inbox_id) ->
            @perform 'send_message', message: message, inbox_id: inbox_id
    $('#new_message').submit (e) ->
        $this = $(this)
        textarea = $this.find('#message_content')
        if $.trim(textarea.val()).length > 1
            App.global_chat.send_message textarea.val(),
            message.data('index-id')
            textarea.val('')
        e.preventDefault()
        return false