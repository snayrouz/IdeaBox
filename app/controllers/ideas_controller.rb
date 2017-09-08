class IdeasController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      #flash[:success] = "You created #{@idea.title}"
      redirect_to user_idea_path(@user, @idea)
    else
      #flash unsuccessful
      redirect_to new_user_idea_path
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end

end
