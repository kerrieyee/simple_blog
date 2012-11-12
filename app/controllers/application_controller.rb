class ApplicationController < ActionController::Base
  protect_from_forgery
   before_filter :load_article

  def load_article
    @articles = Article.find(params[:id]) if params[:id]
  end





end
