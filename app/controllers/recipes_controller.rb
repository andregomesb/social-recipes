class RecipesController < ApplicationController

  before_action :set_recipe, only:[:show, :edit, :update, :destroy, :favorite, :share]
  before_action :set_collection, only:[:index, :new, :edit, :search]

  LATEST_RECIPES_HOME = 20
  MOST_FAVORITES = 5

  def index
    @recipes = Recipe.order(created_at: :desc).limit(LATEST_RECIPES_HOME)
    @favorites = Recipe.joins(:favorite_recipes).select('recipes.*, COUNT(recipe_id) as recipe_count').group('recipes.id').order('recipe_count DESC').limit(MOST_FAVORITES)
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

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Receita atualizada com sucesso"
    else
      set_collection
      flash.now[:alert] = "Não foi possível atualizar a receita"
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    # redirect_back(fallback_location: root_path)
    redirect_to recipes_user_path(@recipe.user), notice: 'Receita deletada com sucesso'
  end

  def search
    search_recipe = params[:search]
    @recipes = Recipe.search(search_recipe)
    flash.now[:notice] = I18n.t(:results, count: @recipes.size)
    render :index
  end

  def favorite
    favorite = params[:favorite] == "true"
    if favorite
      current_user.favorites << @recipe
      flash[:notice] = 'Favoritado'
    else
      current_user.favorites.delete(@recipe)
      flash[:notice] = 'Desfavoritado'
    end
    redirect_to @recipe
  end

  def share
    mail_to = params[:share_recipe_email]
    unless mail_to.empty?
      RecipeMailer.share_email(current_user, @recipe, mail_to).deliver
      flash.now[:notice] = 'Email enviado'
      render :show
    else
      flash.now[:alert] = 'Ocorreu um erro, não foi possível enviar o email'
      render :show
    end

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
