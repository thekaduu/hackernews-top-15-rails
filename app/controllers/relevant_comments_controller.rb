class RelevantCommentsController < ApplicationController
  def index
    @comments = RelevantComments.call(params[:top_story_id])
  end
end
