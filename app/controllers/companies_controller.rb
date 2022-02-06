# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    if search_params[:q]
      @companies = Companies::Api.new.search(search_params)
      SaveCompaniesWorker.perform_async(@companies)
    else
      @companies = Company.none
    end
  end

  private

    def search_params
      params.permit(:q)
    end
end
