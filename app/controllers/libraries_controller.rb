class LibrariesController < ApplicationController
  def index
    render json: Library.last.includes(:namespaces)
  end

  def show
    render json: Library.includes(:namespaces).find(params[:id]).to_json(:include => :namespaces)
  end
end
