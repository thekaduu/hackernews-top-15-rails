require 'rails_helper'

RSpec.describe StoriesController do
  describe 'GET index' do
    context 'when query is present' do
      it 'renders index template' do
        allow(SearchStories).to receive(:call)
        get :index, params: { query: 'abc' }
        expect(response).to render_template('stories/index')
      end

      it 'assigns @stories' do
        allow(SearchStories).to receive(:call) { [] }
        get :index, params: { query: 'abc' }
        expect(assigns(:stories)).to eq([])
      end

      it 'invokes SearchStories.call' do
        expect(SearchStories).to receive(:call).with('abc')
        get :index, params: { query: 'abc' }
      end
    end

    context 'when query is not present' do
      it 'renders index template' do
        allow(SearchStories).to receive(:call)
        get :index
        expect(response).to render_template('stories/index')
      end

      it 'assigns @stories' do
        allow(SearchStories).to receive(:call) { [] }
        get :index
        expect(assigns(:stories)).to eq([])
      end

      it 'invokes SearchStories.call' do
        expect(SearchStories).to receive(:call).with('')
        get :index
      end
    end
  end
end
