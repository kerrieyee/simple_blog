class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter do 

  	@upcase_titles = @article.title.upcase
  end

  private

  def load_article 
  	@article = Article.find(params[:id]) if params[:id]
  end

  def upcase_article_titles
  	@article.title = @article.title.capitalize
  end
end
