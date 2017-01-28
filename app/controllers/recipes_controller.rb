class RecipesController < ApplicationController

  before_action :set_recipe, only:[:show]
  before_action :set_collection, only:[:index, :new, :search]

  LATEST_RECIPES_HOME = 20

  def index
    @recipes = Recipe.last(LATEST_RECIPES_HOME)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if @recipe.save
      redirect_to @recipe, notice: t('.success')
    else
      set_collection
      flash[:alert] = t('.error')
      render :new
    end
  end

  def show
  end

  def search
    search_recipe = params[:search]
    @recipes = Recipe.search(search_recipe)
    flash[:notice] = I18n.t(:results, count: @recipes.size)
    render :index
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
