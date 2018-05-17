class ArticlesController < ApplicationController

	http_basic_authenticate_with name: 'lol', password: '123456', except: [:index, :show]

	def index
		@articles = article_method.all
	end
	
	def show
		@article = article_method.find(params[:id])
	end

	def new
		@article = article_method.new
	end

	def edit
		@article = article_method.find(params[:id])
	end

	def create
		@article = article_method.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = article_method.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = article_method.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end
	
	private

	def article_method
		@art = Article
	end
	
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
