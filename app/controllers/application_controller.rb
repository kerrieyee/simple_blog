class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_article, :capitalize_article_titles
  private

  def load_article
    @articles = Article.find(params[:id]) if params[:id]
  end

  def capitalize_article_titles
    @articles = Article.all
    @articles.map do |article|
      article.title.upcase!
    end
  end

end
