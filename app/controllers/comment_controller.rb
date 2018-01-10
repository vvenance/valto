class CommentController < ApplicationController

  def index
    @c = policy_scope(Comment)
    @comments = Comment.where(feature_id: params[:id])
    authorize @comments, :index?
    @new_comment = Comment.new
    @feature = Feature.find(params[:id])
  end

  def create
    comment = Comment.new
    authorize comment
    comment.content = params["/comment"]["content"]
    comment.feature_id = params["/comment"]["feature_id"]
    comment.user_id = current_user.id
    comment.save
    redirect_to comment_index_path(id: params["/comment"]["feature_id"])
  end
end
