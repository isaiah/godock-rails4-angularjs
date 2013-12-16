class NamespacesController < ApplicationController
  respond_to :json
  def show
    respond_with Namespace.includes(:functions, :struct_types).find_by(name: params[:id]).to_json(:include => [:functions, :struct_types])
  end
end
