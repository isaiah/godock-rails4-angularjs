class SearchController < ApplicationController
  def index
    @search_result = PgSearch.multisearch(params[:query]).map(&:searchable)
    render json: @search_result.group_by(&:class)
  end
end
