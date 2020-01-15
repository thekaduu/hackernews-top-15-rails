# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RelevantCommentsController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      VCR.use_cassette('success_fetch_relevant_comments') do
        get :index, params: { story_id: 8863 }, xhr: true
        expect(response).to render_template('relevant_comments/index')
      end
    end

    it 'assigns most relevant comments' do
      VCR.use_cassette('success_fetch_relevant_comments') do
        get :index, params: { story_id: 8863 }, xhr: true
        expect(assigns(:comments)).to be_kind_of(Array)
        expect(assigns(:comments).first).to be_kind_of(Comment)
      end
    end
  end
end
