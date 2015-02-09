class RecipesController < ApplicationController
  protect_from_forgery with: :null_session

def index
  @recipes = Recipe.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @recipes }
    end

end


def show

  @recipe = Recipe.find_by(id: params[:id])
  if @recipe
    respond_to do |format|
      format.json { render json: @recipe }
    end
  else
    respond_to do |format|
      format.json { render json: ["RECIPE NOT FOUND"] }
    end
  end

end

def create

  @recipe = Recipe.create(recipe_params)
  if @recipe.save
    render json: @recipe
  else
    render status: 400, nothing: true
  end

end

def destroy

  @recipe = Recipe.find_by(id: params[:id])
  if @recipe
    Recipe.destroy(@recipe)
    format.json { render json: ["RECIPE DESTROYED"] }
  else
    format.json { render json: ["RECIPE NOT FOUND"] }
  end

end


private

 def recipe_params
   params.require(:recipe).permit(:name, :ingredients, :instructions)
 end


end
#
# Prefix Verb   URI Pattern                 Controller#Action
#   root GET    /                           recipes#index
# recipes GET    /recipes(.:format)          recipes#index
#        POST   /recipes(.:format)          recipes#create
# new_recipe GET    /recipes/new(.:format)      recipes#new
# edit_recipe GET    /recipes/:id/edit(.:format) recipes#edit
# recipe GET    /recipes/:id(.:format)      recipes#show
#        PATCH  /recipes/:id(.:format)      recipes#update
#        PUT    /recipes/:id(.:format)      recipes#update
#        DELETE /recipes/:id(.:format)      recipes#destroy
