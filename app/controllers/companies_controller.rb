# frozen_string_literal: true

class CompaniesController < ActionController::Base
  def index
    if search_params[:q]
      @companies = Companies::Api.new.search(search_params)
    else
      @companies = Company.none
    end
  end

  private

    def search_params
      params.permit(:q)
    end
end
