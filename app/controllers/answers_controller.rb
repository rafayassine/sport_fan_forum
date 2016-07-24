class AnswersController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]
  before_action :find_answer, only: [:edit, :update, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(answer_params)
    @answer.user_id = current_user.id

    if @answer.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  def destroy
    @answer.destroy
    redirect_to post_path(@post)
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_answer
      @answer = @post.answers.find(params[:id])
    end
end
