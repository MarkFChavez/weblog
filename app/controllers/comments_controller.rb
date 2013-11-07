class CommentsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :get_article

	def create
		@comment = @article.comments.build(params[:comment])
		@comment.user = current_user

		if @comment.save
			redirect_to @article, notice: "Comment added successfully"
		else
			redirect_to @article, alert: "Comment was not added"
		end
	end

	def destroy
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to @article, notice: "Comment removed"
	end

	private

	def get_article
		@article = Article.find(params[:article_id])
	end
end
