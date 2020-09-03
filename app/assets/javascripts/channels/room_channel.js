$(function () {
    App.room = App.cable.subscriptions.create({ channel: "RoomChannel", room: $('#messages').data('room_id') }, {

        connected: function () {

        },

        disconnected: function () {

        },

        received: function (data) {
            const messages = document.getElementById('messages');
            messages.insertAdjacentHTML('beforeend', data['message']);
            // return $('messages').append(data['message']);
        },

        speak: function (message) {
            return this.perform('speak', {
                message: message
            });
        }
    });

    $(document).on('keypress', '[data-behavior~=room_speaker]', function (event) {
        if (event.keyCode === 13) {
            App.room.speak(event.target.value);
            event.target.value = '';
            return event.preventDefault();
        }

    });
});







