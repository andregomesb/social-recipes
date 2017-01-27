class MealsController < ApplicationController

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new cuisine_params

    if @meal.save
      redirect_to @meal, notice: t(".success")
    else
      flash[:alert] = t(".error")
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  private 

  def cuisine_params
    params.require(:meal).permit(:name)
  end
end
