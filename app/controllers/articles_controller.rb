class ArticlesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@article = Article.new
	end

	def create
		@article = current_user.articles.build(params[:article])

		if @article.save
			redirect_to root_path, notice: "Article created successfully"
		else	
			render :new
		end
	end
end
