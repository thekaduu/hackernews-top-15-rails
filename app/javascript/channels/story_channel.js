import consumer from "./consumer"

consumer.subscriptions.create("StoryChannel", {
  received(data) {
    let query = $('#query').val();

    if (query != '') {
      if (data.query === query)
        $('#loader').replaceWith(data.message);
    } else {
      $('#loader').replaceWith(data.message);
    }

    App.comments.setup();
  }
});
