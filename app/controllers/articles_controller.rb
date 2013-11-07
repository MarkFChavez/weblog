class ArticlesController < ApplicationController
	load_and_authorize_resource only: [:edit, :update, :destroy]
	before_filter :authenticate_user!, except: :show

	def show
		@article = Article.find(params[:id])
	end

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

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to @article, notice: "Article updated successfully"
		else
			render :edit
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		
		redirect_to root_url, notice: "Article removed successfully"
	end
end
