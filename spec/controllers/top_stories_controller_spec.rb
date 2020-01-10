require 'rails_helper'

RSpec.describe TopStoriesController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template('top_stories/index')
    end
  end
end
