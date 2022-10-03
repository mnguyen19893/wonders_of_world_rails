class TypesController < ApplicationController
  def index
    @types = Type.includes(:places).all
  end

  def show
    @type = Type.includes(:places).find(params[:id])
  end
end
