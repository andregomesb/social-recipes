class RecipesController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.new
    set_collection
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
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cuisine_id, :meal_id, :portion,
                                   :preparation_time, :difficulty,
                                   :ingredients, :instructions)
  end

  def set_recipe
  end

  def set_collection
    @cuisine = Cuisine.all
    @meal = Meal.all
    @difficulties = Recipe.difficulty_select
  end
end
