class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: %i[edit update]
  
  def index
    @categories = Category.all
    @category = Category.new
    @submit = "新規登録"
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all
      @submit = "新規登録"
      render 'index'
    end
  end

  def edit
    @submit = "変更を保存する"
  end
  
  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
  def set_category
    @category = Category.find(params[:id])
  end
end
