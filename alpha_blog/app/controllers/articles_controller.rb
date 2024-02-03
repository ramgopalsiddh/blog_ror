class ArticlesController < ApplicationController
  # this remove code retendency
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #binding.break # In Rails 6 this is byebug this use for debug
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article.user = User.first
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created sucessfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated sucessfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # use private for prevent access method outside of this controller
  private

  # Use this for remove code retendency

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end


end