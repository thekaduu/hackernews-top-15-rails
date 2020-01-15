# frozen_string_literal: true

class RelevantCommentsController < ApplicationController
  def index
    @comments = RelevantComments.call(params[:story_id])
  end
end
