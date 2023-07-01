class CommentsController < ApplicationController
  def index
    load_comments
  end

  private

  def load_comments
    @comments = Comment.all
  end
end
