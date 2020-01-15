require 'rails_helper'

RSpec.describe StoriesController do
  describe 'GET index' do
    context 'when query is present' do
      it 'renders index template' do
        get :index, params: { query: 'abc' }
        expect(response).to render_template('stories/index')
      end

      it 'does not assign @stories' do
        get :index, params: { query: 'abc' }
        expect(assigns(:stories)).to be_nil
      end

      it 'invokes FetchStoriesJob.perform_later' do
        expect(FetchStoriesJob).to receive(:perform_later).with('abc')
        get :index, params: { query: 'abc' }
      end
    end

    context 'when query is not present' do
      it 'renders index template' do
        get :index
        expect(response).to render_template('stories/index')
      end

      it 'does not assign @stories' do
        get :index
        expect(assigns(:stories)).to be_nil
      end

      it 'invokes FetchStoriesJob.perform_later' do
        expect(FetchStoriesJob).to receive(:perform_later).with('')
        get :index
      end
    end
  end
end
