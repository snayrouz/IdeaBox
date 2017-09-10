class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
    @user = current_user
  end

  def new
    @category = Category.new
    @user = current_user

  end

  def edit
    @category = Category.find(params[:id])
    @user = current_user
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New Category Saved!"
      redirect_to admin_categories_path
    else
      flash[:notice] = "Error, #{@categroy.errors.keys}, #{@category.errors.values}"
      redirect_to new_admin_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
    @user = current_user
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category Updated!"
      redirect_to admin_categories_path
    else
      flash[:notice] = "Error, #{@category.errors.keys}, #{@category.errors.values}"
      redirect_to edit_admin_category_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy

    flash[:notice] = "Category Deleted!"
    
    redirect_to admin_categories_path
    else
      flash[:notice] = "Error, #{@category.errors.keys}, #{@category.errors.values}"

      redirect_to admin_categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
