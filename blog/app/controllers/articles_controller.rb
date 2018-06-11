class ArticlesController < ApplicationController
  before_action :article_find, only: %i[show edit update destroy]

  def index
    @articles = article_method.all
  end

  def show; end

  def new
    @article = article_method.new
  end

  def edit; end

  def create
    @article = article_method.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_find
    @article = article_method.find(params[:id])
  end

  def article_method
    @art = Article
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
