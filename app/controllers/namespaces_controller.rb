class NamespacesController < ApplicationController
  def show
    render json: Namespace.includes(:functions).find_by(name: params[:id]).to_json(:include => :functions)
  end
end
