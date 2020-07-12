class ArticlesController < ApplicationController
	skip_before_action :is_logged, only: [:show]
	before_action :fetch_article, only: [:show, :edit, :update, :destroy]
	before_action :user_privilezed, only: [:update, :edit, :destroy]

	def show
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(filter_param)
		@article.user = current_user
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render "new"
		end
	end

	def update
		if @article.update(filter_param)
			flash[:notice] = "Article was updated successfully"
			redirect_to article_path(@article)
		else
			render "edit"
		end
	end

	def edit
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	def fetch_article
		@article = Article.find(params[:id])
	end

	def filter_param
		return params.require(:article).permit(:title, :description)
	end

	def user_privilezed
		if @article.user != current_user
			flash[:alert] = "You don't have the authorities to access the page"
			redirect_to @article
		end
	end
end
