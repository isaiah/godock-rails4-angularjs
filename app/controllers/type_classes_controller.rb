class TypeClassesController < ApplicationController
  respond_to :json
  def show
    respond_with TypeClass.find_by(name: params[:id])
  end
end
