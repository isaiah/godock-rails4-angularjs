class FunctionsController < ApplicationController
  respond_to :json
  def show
    respond_with(Function.find_by(name: params[:id]))
  end
end
