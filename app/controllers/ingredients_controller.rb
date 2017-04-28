class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :destroy, :update] # if someone does show or destroy, it will run set_patient first
  # before_action :set_patient, only: %i[show destroy] # This is another way of writing the same thing, preferred by linter.

  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  end

  def show
    render json: @ingredient
  end

  def update
    if @ingredient.update(ingredient_params) # We need to protect ourselves from what users are submitting.
      head :no_content
    else
      render json: @ingredient.errors, status:
      :unprocessable_entity
    end
  end

  def destroy
    @ingredient.destroy
    head :no_content
  end

  def create
    if Ingredient.create(ingredient_params)
      render json: @ingredient, status: :created
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount) #says first key has to be an ingredient.  If they send us bad stuff, it will filter out anything that doesn't match this criteria.
  end
end
