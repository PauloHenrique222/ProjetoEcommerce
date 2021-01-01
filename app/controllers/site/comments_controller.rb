class Site::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    @comment = Comment.new(comment_params)
    @comment.member = current_member

    if @comment.save
      redirect_to site_ad_datail_path(@comment.announcement_id), notice: "Salve successfully"
    else
      redirect_to site_ad_datail_path(@comment.announcement_id), notice: "Error"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :announcement_id)
  end

end
