class MealsController < ApplicationController
  before_action :logged_as_admin, only: [:new, :edit, :destroy]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new meal_params

    if @meal.save
      redirect_to @meal, notice: t('.success')
    else
      flash[:alert] = t('.error')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Tipo de Comida atualizada com sucesso'
    else
      flash.now[:alert] = 'Não foi possível atualizar o tipo de comida'
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to root_path, notice: 'Tipo de Cozinha deletada com sucesso'
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
