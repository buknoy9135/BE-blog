class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_article_comment, except: [ :create]

  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(@article), notice: "Comment uploaded."
    else
      render 'articles/show', status: :unprocessable_entity
    end
  end
                            
  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article), notice: "Comment updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to article_path(@article), notice: "Comment deleted."
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body_of_the_comment)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_article_comment
      @comment = @article.comments.find(params[:id])
    end
end
