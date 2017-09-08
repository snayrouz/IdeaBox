class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      #flash message success
      redirect_to admin_categories_path
    else
      #flash message unsuccessful
      redirect_to new_admin_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      #flash successful update
      redirect_to admin_categories_path
    else
      #flash unsuccessful message
      redirect_to edit_admin_category_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    #flash category deleted
    redirect_to admin_categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
