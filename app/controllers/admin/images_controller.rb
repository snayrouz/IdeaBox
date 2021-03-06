class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.all
    @user = current_user
  end

  def new
    @image = Image.new
    @user = current_user
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image Added!"

      redirect_to admin_images_path
    else
      flash[:notice] = "Error, #{@image.errors.keys}, #{@image.errors.values}"

      redirect_to new_admin_image_path
    end
  end

  def edit
    @image = Image.find(params[:id])
    @user = current_user
  end

  def show
    @image = Image.find(params[:id])
    @user = current_user
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image Updated!"
      redirect_to admin_images_path
    else
      flash[:notice] = "Error, #{@image.errors.keys}, #{@image.errors.values}"
      redirect_to edit_admin_image_path
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image Deleted!"

    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :url)
  end
end
