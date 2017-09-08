class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas
  end

  def new
    @user = current_user
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @user = current_user
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      #flash[:notice] = "Idea saved!"
      redirect_to @user
    else
      #flash[:notice] = "Idea not saved. #{@idea.errors.keys}, #{@idea.errors.values}"
      redirect_to new_user_idea_path
    end
  end

  def show

  end

  def edit
    @user = current_user
    @idea = @user.ideas.find(params[:id])
  end

  def update
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    if @idea.update(idea_params)
      #flash notice for successful update
      redirect_to @user
    else
      redirect_to edit_admin_category_path
    end
  end

  def destroy
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    if @idea.destroy
    else
      redirect_to @user
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :user_id)
  end

end
