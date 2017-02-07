class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]
  before_action :logged_as_admin, only: [:new, :edit, :destroy]

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new cuisine_params

    if @cuisine.save
      redirect_to @cuisine, notice: t('.success')
    else
      flash[:alert] = t('.error')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine, notice: 'Cozinha atualizada com sucesso'
    else
      flash.now[:alert] = 'Não foi possível atualizar a cozinha'
      render :edit
    end
  end

  def destroy
    @cuisine.destroy
    redirect_to root_path, notice: 'Cozinha deletada com sucesso'
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end
end
