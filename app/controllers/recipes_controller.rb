class RecipesController < ApplicationController

  before_action :set_recipe, only:[:show, :edit, :update, :destroy]
  before_action :set_collection, only:[:index, :new, :edit, :search]

  LATEST_RECIPES_HOME = 20

  def index
    @recipes = Recipe.last(LATEST_RECIPES_HOME)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.user_id = current_user.id
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

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Receita atualizada com sucesso"
    else
      set_collection
      flash[:alert] = "Não foi possível atualizar a receita"
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_user_path(@recipe.user), notice: 'Receita deletada com sucesso'
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
