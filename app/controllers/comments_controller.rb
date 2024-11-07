class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @product.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js {}
      end
    else
      flash[:error] = "Comment can not be created!"
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js {}
      end
    else
      flash[:error] = "Comment can not be deleted!"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @product
    else
      render :edit
    end
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :user_id)
  end
end
