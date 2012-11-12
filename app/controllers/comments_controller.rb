class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json

  before_filter :replace_sad_with_happy, :only => [:create]
  skip_before_filter :load_article, :only => [:destroy]
  #need to do this in order to be able to destroy comments if not :id will equal the article id and not the comment id

  def create
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.article, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to @comment.article }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    # @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.article }
      format.json { head :no_content }
    end
  end

  private
  def replace_sad_with_happy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.build(params[:comment])
      comment_string = @comment.body
      comment_array = comment_string.split(" ")
      while comment_array.include?("sad")
        index = comment_array.index("sad")
        comment_array[index] = "happy"
      end
      @comment.body = comment_array.join(" ")
      @comment
  end
end
