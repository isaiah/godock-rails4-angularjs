class NamespacesController < ApplicationController
  respond_to :json
  def show
    respond_with Namespace.includes(:functions, :li).find_by(name: params[:id]).to_json(:include => :functions)
  end
end
