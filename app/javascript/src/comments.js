App = this.App || (this.App = {});

App.comments = {
  bindLink: function() {
    $('.show-comments').off('click').on('click', function() {
      $(this)
        .css({ display: 'none' })
        .parents('article')
          .removeClass('collapsed')
          .after(App.comments.loadingTemplate());
    })
  },
  loadingTemplate: function() {
    return `
      <div class="row comments comment-loader">
        <div class="column">
          <div class="ui loading segment">
            <p></p>
            <p></p>
          </div>
        </div>
      </div>
    `;
  },
  setup: function() {
    App.comments.bindLink();
  }
}
