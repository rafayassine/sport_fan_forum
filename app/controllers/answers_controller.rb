class AnswersController < ApplicationController

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

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
