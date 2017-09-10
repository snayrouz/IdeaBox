class IdeaImages < ApplicationController
  def index
  end

  def new
    @idea = current_user.ideas.find(params[:idea_id])
    @idea_image = @idea.idea_images.new
  end

  def create
    @user = current_user
    @idea = @user.ideas.find(params[:idea_id])
    @image = @idea.images.new(idea_image_params)
    if @image.save
      flash[:success] = "Image Added!"
      redirect_to user_idea_path(@user, @idea)
    else
      flash[:error] = "Error #{@image.errors.keys} #{@image.errors.values}"
      render :new
    end
  end

  def delete
    @user = current_user
    @idea = @user.ideas.find(params[:idea_id])
    @image = @idea.images.find(params[:image_id])
    if @image.destroy
      flash[:success] = "Image destroyed!"
      redirect_to user_idea_path(@user, @idea)
    else
    flash[:errror] = "Error, #{@image.errors.keys}, #{@image.errors.values}"
    end
  end

  private

  def idea_image_params
    params.require(:idea_image).permit(:id, :idea_id)
  end

end
