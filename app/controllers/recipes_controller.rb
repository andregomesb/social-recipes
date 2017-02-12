class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update,
                                    :destroy, :favorite, :share]
  before_action :set_collection, only: [:index, :new, :edit, :search]

  LATEST_RECIPES_HOME = 20

  def index
    @recipes = Recipe.latest_recipes(LATEST_RECIPES_HOME)
    @favorites = Recipe.most_favorited
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe, notice: t('.success')
    else
      set_collection
      flash.now[:alert] = t('.error')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: t('.success')
    else
      set_collection
      flash.now[:alert] = t('.error')
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    # redirect_back(fallback_location: root_path)
    redirect_to recipes_user_path(@recipe.user),
                notice: t('.success')
  end

  def search
    @search_recipe = params[:search]
    @recipes = Recipe.search(@search_recipe)
    flash[:notice] = I18n.t(:results, count: @recipes.size)
  end

  def favorite
    favorite = params[:favorite] == 'true'
    if favorite
      current_user.favorites << @recipe
      flash[:notice] = t('.favorite')
    else
      current_user.favorites.delete(@recipe)
      flash[:notice] = t('.unfavorite')
    end
    redirect_to @recipe
  end

  def share
    mail_to = params[:share_recipe_email]
    if mail_to.present?
      RecipeMailer.share_email(current_user, @recipe, mail_to).deliver
      flash.now[:notice] = t('.success')
    else
      flash.now[:alert] = t('.error')
    end

    render :show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cuisine_id, :meal_id, :portion,
                                   :preparation_time, :difficulty,
                                   :ingredients, :instructions, :recipe_image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_collection
    @cuisines = Cuisine.all
    @meals = Meal.all
    @difficulties = Recipe.difficulty_select
  end
end
