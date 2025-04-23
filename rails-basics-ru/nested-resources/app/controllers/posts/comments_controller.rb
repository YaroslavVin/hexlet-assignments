class Posts::CommentsController < Posts::ApplicationController
  def index
    @comments = resource_post.comments
  end

  def new
    @comment = resource_post.comments.build
  end

  def create
    @comment = resource_post.comments.build(post_comment_params)

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end
  def show; end

  def update
    if @comment.update(post_comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_comments_path(resource_post), notice: 'Comment was successfully destroyed.'
  end

  private

  def post_comment_params
    params.require(:comment).permit(:body)
  end
end