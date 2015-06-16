class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_link
  
  def edit
    render template: 'links/show'
  end

  def create
  	@comment = @link.comments.build(comment_params)
  	@comment.user = current_user
  	respond_to do |format|
	  	if @comment.save
	  		format.html {redirect_to link_path(@link), notice: "Thank you for your contribution, your comment was created"}	
	  	else
	  		format.html {render template: "links/show", alert: "Something unexpected happened, Plz try again!"}
	  	end
	  end
  	
  end

  def update
  	respond_to do |format|
	  	if @comment.update_attributes(comment_params)
	  		format.html {redirect_to link_path(@link), notice: "Thank you for your contribution, your comment is updated"}	
	  	else
	  		format.html {render template: "links/show", alert: "Something unexpected happened, Plz try again!"}
	  	end
  	end
  end

  def destroy
  	#@link.comments.where(id: params[:id]).destroy
  	respond_to do |format|
	  	if @comment.destroy
	  		format.html {redirect_to link_path(@link), notice: "Thank you, your comment is deleted"}	
	  	else
	  		format.html {render template: "links/show", alert: "Something unexpected happened, Plz try again!"}
	  	end
  	end
  end

  private

  def set_comment
  	@comment = Comment.find(params[:id])
  end

  def set_link
  	@link = Link.find_by(id: params[:link_id]) 
  end

  def comment_params
  	params.require(:comment).permit(:body)
  end

end
