import consumer from "./consumer"

consumer.subscriptions.create("StoryChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    let query = $('#query').val();

    if (query != '') {
      if (data.query === query)
        $('#loader').replaceWith(data.message);
    } else {
      $('#loader').replaceWith(data.message);
    }
  }
});
