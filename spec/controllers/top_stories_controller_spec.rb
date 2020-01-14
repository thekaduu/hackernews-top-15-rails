# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopStoriesController, type: :controller do
  describe 'GET index' do
    before { allow(TopStories).to receive(:call) { [] } }

    it 'renders index template' do
      get :index
      expect(response).to render_template('top_stories/index')
    end

    it 'assigns stories' do
      get :index
      expect(assigns(:stories)).to eq([])
    end
  end
end
