class RelevantCommentsController < ApplicationController
  def index
    @comments = RelevantComments.call(params[:story_id])
  end
end
