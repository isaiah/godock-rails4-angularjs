class LibrariesController < ApplicationController
  respond_to :json
  def index
    respond_with Library.last.includes(:namespaces)
  end

  def show
    respond_with Library.includes(:namespaces).find(params[:id]).to_json(:include => :namespaces)
  end
end
